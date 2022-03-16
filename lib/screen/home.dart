import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../endPoints/dataTutor.dart';
import '../model/tutorModal.dart';
import 'history/history.dart';
import 'news/news.dart';
import 'profile/profile.dart';
import 'course/course.dart';
import 'requeset/request.dart';

class HomePage extends StatefulWidget {
  HomePage(String this.email);
  final String email;
  State<HomePage> createState() => _HomePage(this.email);
}

class _HomePage extends State<HomePage> {
  _HomePage(String this.email);
  final String email;
  void initState() {
    super.initState();
  }

  int curentIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: FutureBuilder<List<Tutor>>(
            future: getTutorProfile(email),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("Loading..."),
                );
              } else {
                List<Tutor>? tutor = snapshot.data;
                final Screen = [
                  CourseScreen(
                      id: tutor![0].id,
                      avatar: tutor![0].avatar,
                      name: tutor![0].name),
                  RequestScreen(tutor![0].id),
                  HistoryScreen(id: tutor![0].id),
                  NewsScreen(),
                  ProfileScreen(tutor[0].id,tutor[0].name, tutor[0].email, tutor[0].phone,
                      tutor[0].avatar, tutor[0].education, tutor[0].skill),
                ];
                return Scaffold(
                    body: Screen[curentIndex],
                    bottomNavigationBar: CurvedNavigationBar(
                      key: _bottomNavigationKey,
                      index: curentIndex,
                      height: 60.0,
                      items: const <Widget>[
                        Icon(Icons.book, size: 30),
                        Icon(Icons.request_page, size: 30),
                        Icon(Icons.history_edu, size: 30),
                        Icon(Icons.new_label_outlined, size: 30),
                        Icon(Icons.account_box, size: 30),
                      ],
                      color: Colors.white,
                      buttonBackgroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      animationCurve: Curves.easeInOut,
                      animationDuration: Duration(milliseconds: 600),
                      onTap: (index) {
                        setState(() {
                          curentIndex = index;
                        });
                      },
                      letIndexChange: (index) => true,
                    ));
              }
            }));
  }
}
