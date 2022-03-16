import 'dart:convert';

import 'package:flutter/material.dart';
import '../../components/itemCard.dart';
import '../../endPoints/dataCourse.dart';
import '../../model/courseModal.dart';
import "courseHeader.dart";
import "courseBody.dart";
import 'package:http/http.dart' as http;

// class CourseScreen extends StatefulWidget {
//   State<CourseScreen> createState() => _CourseScreen();
// }
class CourseScreen extends StatefulWidget {
  CourseScreen(
      {required int this.id,
      required String this.avatar,
      required String this.name});
  final int id;
  final String avatar;
  final String name;
  @override
  State<CourseScreen> createState() => _CourseScreen(id, avatar, name);
}

class _CourseScreen extends State<CourseScreen> {
  late Future<Course> courseData;
  _CourseScreen(int this.id, String this.avatar, String this.name);
  final int id;
  final String avatar;
  final String name;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar();
    double heigt = appbar.preferredSize.height;

    return Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: heigt),
          child: Column(children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: CourseHeader(name, avatar),
            ),
            Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: CourseBody(id)))
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              ShowBottomSheet(id);
            },
            child: const Icon(Icons.add)));
  }

  void ShowBottomSheet(int author) {
    TextEditingController _nameController = new TextEditingController();
    TextEditingController descriptionController = new TextEditingController();
    TextEditingController priceController = new TextEditingController();
    TextEditingController ageLimitController = new TextEditingController();
    showBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              decoration: const BoxDecoration(
                  border: Border(top: BorderSide(color: Colors.black))),
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.75,
              child: Expanded(
                child: Column(
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                  controller: _nameController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Enter name course")),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                  controller: priceController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Enter price course")),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                  controller: ageLimitController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Enter age limit ")),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Enter description")),
                            ),
                          ],
                        )),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: RaisedButton(
                                color: Colors.red,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.cancel),
                                    Text("Cancel",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: RaisedButton(
                                color: Colors.blue,
                                onPressed: () async {
                                  if (_nameController.text != '') {
                                    if (descriptionController.text != '') {
                                      if (ageLimitController.text != '') {
                                        if (priceController.text != '') {
                                          final response = await addCoruse(
                                              author.toString(),
                                              _nameController.text.toString(),
                                              descriptionController.text
                                                  .toString(),
                                              ageLimitController.text
                                                  .toString(),
                                              priceController.text.toString());

                                          if (response == true) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Tạo khoá học thành công")));
                                            Navigator.pop(context);
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Tạo khoá học không thành công")));
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Giá không được để trống")));
                                        }
                                      } else {
                                                                                  ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Miêu tả không được để trống")));
                                      }
                                    } else {  
                                                                                ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Tuổi không được để trống")));
                                    }
                                  } else {
                                                                              ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Name không được để trống")));
                                  }
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.add_comment),
                                    Text("Add Course",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
