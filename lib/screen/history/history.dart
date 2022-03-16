import 'dart:math';

import 'package:flutter/material.dart';

import '../../endPoints/dataRequest.dart';
import '../../model/requestModal.dart';
import '../lession/lession.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key, required int this.id});
  final int id;

  State<HistoryScreen> createState() => _HistoryScreen(id: this.id);
}

class _HistoryScreen extends State<HistoryScreen> {
  int _counter = 0;
  _HistoryScreen({
    Key? key,
    required int this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Danh sách học viên hoàn thành")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<List<Request>>(
            future: getRequestDone(id),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text("Loading..."));
              } else {
                List<Request>? request = snapshot.data;
                return Container(
                    // width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                        itemCount: request!.length,
                        itemBuilder: (context, position) {
                          return Expanded(
                            child: Container(
                              margin: EdgeInsets.all(2),
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)],
                                  borderRadius: position % 2 == 0
                                      ? BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          bottomRight: Radius.circular(50),
                                        )
                                      : BorderRadius.only(
                                          bottomLeft: Radius.circular(50),
                                          topRight: Radius.circular(50),
                                        )),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LessionScreen(
                                              course: request[position].course,
                                              student:
                                                  request[position].student)));
                                },
                                child: Container(
                                  child: Center(
                                    child: Text(
                                        "Học Viên: " +
                                            request[position]
                                                .student
                                                .toString() +
                                            "đã hoàn thành khoá học: " +
                                            request[position].course.toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                        )),
                                  ),
                                ),
                              ),

                              // Expanded(
                              //     child: Container(
                              //   width:
                              //       MediaQuery.of(context).size.width * 0.1,
                              //   child: IconButton(
                              //     icon: Icon(Icons.done_all_outlined),
                              //     color: Colors.green,
                              //     onPressed: () {
                              //       doneRequest(int.parse(request[position].id.toString()));
                              //       setState(() {
                              //         _counter++;
                              //       });
                              //     },
                              //     tooltip: "Done this lesson!",
                              //   ),
                              // ))
                            ),
                          );
                        }));
              }
            }),
      ),
    );
  }
}
