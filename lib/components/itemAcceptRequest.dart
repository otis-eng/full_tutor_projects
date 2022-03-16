import 'package:f_tutor_app/endPoints/dataCourse.dart';
import 'package:f_tutor_app/endPoints/dataRequest.dart';
import 'package:flutter/material.dart';

import '../model/requestModal.dart';

class ItemAccept extends StatefulWidget {
  const ItemAccept({Key? key, required int this.id});
  final int id;

  State<ItemAccept> createState() => _ItemAccept(id: this.id);
}

class _ItemAccept extends State<ItemAccept> {
  int _counter = 0;
  _ItemAccept({
    Key? key,
    required int this.id,
  });
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Danh sách học viên")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<List<Request>>(
            future: getALlRequestWithCourse(id),
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
                              margin: EdgeInsets.all(10),
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 189, 213, 233),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    margin: EdgeInsets.all(10),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Text(
                                              "Học Viên: " +
                                                  request[position]
                                                      .student
                                                      .toString() +
                                                  " đang học khoá học: ",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              request[position]
                                                  .course
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.1,
                                    child: IconButton(
                                      icon: Icon(Icons.done_all_outlined),
                                      color: Colors.green,
                                      onPressed: () {
                                        doneRequest(int.parse(request[position].id.toString()));
                                        setState(() {
                                          _counter++;
                                        });
                                      },
                                      tooltip: "Done this lesson!",
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          );
                        }));
              }
            }),
      ),
    );
  }
}
