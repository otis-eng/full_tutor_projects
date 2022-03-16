import 'dart:ui';

import 'package:f_tutor_app/endPoints/dataRequest.dart';
import 'package:f_tutor_app/model/requestModal.dart';
import 'package:flutter/material.dart';

class ItemRequest extends StatefulWidget {
  ItemRequest(int this.id);
  final int id;

  @override
  _ItemRequestState createState() => _ItemRequestState(id);
}

class _ItemRequestState extends State<ItemRequest> {
  _ItemRequestState(int this.id);
  final int id;
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Request>>(
        future: fetchRequesetBydId(id), // send the name of account
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text("Loading ..."));
          } else {
            List<Request>? request = snapshot.data;
            return Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: request!.length,
                    itemBuilder: (context, postion) {
                      if (request[postion].status == "processing") {
                        return GestureDetector(
                          child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.blue),
                              child: Row(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Text(
                                            request[postion]
                                                    .student
                                                    .toString() +
                                                ": Đã đăng ký khoá học: " +
                                                request[postion]
                                                    .course
                                                    .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(8))),
                                          child: RaisedButton(
                                              color: Colors.red,
                                              onPressed: () {
                                                cancelRequest(int.parse(
                                                    request[postion]
                                                        .id
                                                        .toString()));

                                                setState(() {
                                                  _counter++;
                                                });
                                              },
                                              child: Row(
                                                children: const [
                                                  Icon(Icons.cancel),
                                                  Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              )),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(8))),
                                          child: RaisedButton(
                                              color: Color.fromARGB(
                                                  255, 20, 214, 26),
                                              onPressed: () {
                                                acceptRequest(int.parse(
                                                    request[postion]
                                                        .id
                                                        .toString()));
                                                setState(() {
                                                  _counter++;
                                                });
                                              },
                                              child: Row(
                                                children: const [
                                                  Icon(Icons.check),
                                                  Text(
                                                    "Accept",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              )),
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              )),
                        );
                      } else {
                        return Container(
                          child: Text(""),
                        );
                      }
                    }));
          }
        });
  }
}
