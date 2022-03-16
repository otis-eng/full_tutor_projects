import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../endPoints/dataLession.dart';
import '../../endPoints/dataRequest.dart';
import '../../model/lessionModal.dart';

class LessionScreen extends StatefulWidget {
  final int course;
  final String student;
  LessionScreen({required this.course, required this.student});

  @override
  _LessionScreenState createState() =>
      _LessionScreenState(this.course, this.student);
}

class _LessionScreenState extends State<LessionScreen> {
  final int course;
  final String student;
  bool _isCanPlus = true;
  _LessionScreenState(this.course, this.student);
  String linkMeet = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Danh sách buổi học"),
          leading: IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              print("this is course" + course.toString());
              final response = doneRequest(this.course);
              print(response);
              if (response == true) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Hoàn thành khoá học thành công")));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(" Hoàn thành khoá học không thành công")));
              }
            },
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<List<Lession>>(
              future: getAllLession(course),
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.data == null) {
                  return Center(child: Text("Loading..."));
                } else {
                  List<Lession>? lession = snapshot.data;
                  return Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      // margin: EdgeInsets.all(10),
                      child: ListView.builder(
                          itemCount: lession?.length,
                          itemBuilder: (context, position) {
                            if (lession?[position].status == "active") {
                              return Expanded(
                                  child: Container(
                                margin: EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Table(
                                  border: TableBorder.all(
                                    color: Colors.black,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  children: [
                                    TableRow(children: [
                                      Center(child: Text('Buổi học thứ ')),
                                      Center(
                                          child:
                                              Text((position + 1).toString())),
                                    ]),
                                    TableRow(children: [
                                      Center(child: Text('Học sinh')),
                                      Center(
                                          child: Text(lession![position]
                                              .student
                                              .toString())),
                                    ]),
                                    TableRow(children: [
                                      Center(child: Text('Thời gian')),
                                      Center(
                                          child: Text(lession[position]
                                                  .timeStart
                                                  .toString() +
                                              " - " +
                                              lession[position]
                                                  .timeEnd
                                                  .toString())),
                                    ]),
                                    TableRow(children: [
                                      Center(child: Text('Link học')),
                                      Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Row(
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(
                                                  lession[position]
                                                      .linkMeet
                                                      .toString(),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Container(
                                                  child: IconButton(
                                                tooltip: "Copy link",
                                                icon: Icon(Icons.copy),
                                                onPressed: () {
                                                  Clipboard.setData(
                                                      new ClipboardData(
                                                          text:
                                                              lession[position]
                                                                  .linkMeet
                                                                  .toString()));
                                                },
                                              ))
                                            ],
                                          )),
                                    ]),
                                  ],
                                ),
                              ));
                            } else {
                              return const Text("");
                            }
                          }));
                }
              }),
        ),
        floatingActionButton: _isCanPlus == true
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddLession(
                            course: this.course,
                            student: this.student,
                            linkMeet: linkMeet),
                      ));
                },
                child: const Icon(Icons.add))
            : FloatingActionButton(
                onPressed: () {}, child: const Icon(Icons.warning)));
  }
}

class AddLession extends StatefulWidget {
  AddLession(
      {required this.course, required this.student, required this.linkMeet});
  final int course;
  final String student;
  final String linkMeet;

  @override
  _AddLessionState createState() => _AddLessionState(course, student, linkMeet);
}

class _AddLessionState extends State<AddLession> {
  _AddLessionState(this.course, this.student, this.linkMeet);
  final int course;
  final String student;
  final String linkMeet;

  TextEditingController timeStartController = new TextEditingController();
  TextEditingController timeEndController = new TextEditingController();
  TextEditingController linkController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black))),
          margin: EdgeInsets.only(top: 50),
          // height: MediaQuery.of(context).size.height * 0.75,
          child: Expanded(
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                              controller: timeStartController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Enter time start")),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                              controller: timeEndController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Enter time end")),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Enter description")),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                              controller: dateController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Enter date")),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                              controller: linkController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: "Enter link")),
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
                              print(this.student.toString());
                              final response = await addLession(
                                this.course,
                                this.student,
                                timeStartController.text.toString(),
                                timeEndController.text.toString(),
                                linkController.text.toString(),
                                descriptionController.text.toString(),
                                dateController.text.toString(),
                              );
                              if (response == true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text("Tạo khoá học thành công")));
                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Tạo khoá học không thành công")));
                              }
                            },
                            child: Row(
                              children: const [
                                Icon(Icons.add_comment),
                                Text("Add Lession",
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
          )),
    );
  }
}
