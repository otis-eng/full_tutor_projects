import 'dart:math';

import 'package:f_tutor_app/endPoints/dataCourse.dart';
import 'package:f_tutor_app/model/courseModal.dart';
import 'package:flutter/material.dart';
import '../../components/itemCourse.dart';
import 'package:http/http.dart' as http;

import '../lession/lession.dart';

class CourseBody extends StatefulWidget {
  CourseBody(int this.id);
  final int id;
  State<CourseBody> createState() => _CourseBody(id);
}

class _CourseBody extends State<CourseBody> {
  _CourseBody(int this.id);
  final int id; // id user
  bool boolDelete = false;
  @override
  void initState() {
    super.initState();
    // fetchCourseById("phankieuphu");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Course>>(
          future: fetchCourseById(id),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Loading..."),
              );
            } else {
              List<Course>? course = snapshot.data;

              return Expanded(
                  child: ListView.builder(
                      itemBuilder: (context, position) {
                        return course!.length < 1
                            ? Container(
                                child: Center(
                                    child: Text(
                                "No records found!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              )))
                            : Container(
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (course![position].student == "") {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Khoá học chưa được đăng ký")));
                                        } else {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LessionScreen(course:course[position].id,student: course[position].student,)));
                                        }
                                      },
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: 20,
                                              left: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.1,
                                              right: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.1),
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.primaries[Random()
                                                    .nextInt(Colors
                                                        .primaries.length)],
                                                offset: const Offset(
                                                  2.0,
                                                  2.0,
                                                ),
                                                blurRadius: 10.0,
                                                spreadRadius: 2.0,
                                              )
                                            ],
                                            color: Colors.primaries[Random()
                                                .nextInt(
                                                    Colors.primaries.length)],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          height: 250,
                                          child: Column(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20)),
                                                child: Image.network(
                                                    "https://res.cloudinary.com/phankieuphuicloud/image/upload/v1625397788/imgAvatar/49d9101a28f6dca885e71_zdsinb.jpg",
                                                    height: 200,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.8,
                                                    fit: BoxFit.fill),
                                              ),
                                              Container(
                                                  child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 15),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.65,
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.65,
                                                          child: Text(
                                                            "Khoá học: " +
                                                                course![position]
                                                                    .name
                                                                    .toString(),
                                                            style: TextStyle(
                                                                fontSize: 18),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textAlign:
                                                                TextAlign.start,
                                                          ),
                                                        ),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.65,
                                                          child: Text(
                                                              "Giá: " +
                                                                  course![position]
                                                                      .price
                                                                      .toString(),
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .yellow),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.1,
                                                    // margin: EdgeInsets.only(right: 10),
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: RaisedButton(
                                                        onPressed: () async {
                                                          final response =
                                                              await deleteCourse(
                                                                  course[position]
                                                                      .id);
                                                          print(response);
                                                          if (response ==
                                                              true) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text("Xoá khoá học thành công")));
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text("Xoá khoá học không thành công")));
                                                          }
                                                        },
                                                        child:
                                                            Icon(Icons.delete)),
                                                  )
                                                ],
                                              )),
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              );
                      },
                      itemCount: course!.length));
              // itemCount: course!.length));
            }
          }),
    );
  }
}


                        //     child: ItemCourse(
                        //   id: int.parse(course![position].id.toString()),
                        //   name: course![position].name.toString(),
                        //   author:
                        //       "https://res.cloudinary.com/phankieuphuicloud/image/upload/v1625397753/imgAvatar/img3_bbtdps.jpg",
                        //   description: course![position].description.toString(),
                        //   price: course![position].price.toString(),
                        // ));