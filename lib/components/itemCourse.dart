// import 'package:f_tutor_app/components/itemAcceptRequest.dart';
// import 'package:f_tutor_app/endPoints/dataCourse.dart';
// import 'package:flutter/material.dart';

// import '../screen/lession/lession.dart';

// class ItemCourse extends StatefulWidget {
//   const ItemCourse(
//       {Key? key,
//       required int this.id,
//       required String this.name,
//       required String this.author,
//       required String this.description,
//       required String this.price,
//       required String this.student});
//   final int id;
//   final String name;
//   final String author;
//   final String description;
//   final String price;
//   final String student;

//   State<ItemCourse> createState() => _ItemCourse(
//       id: this.id,
//       name: this.name,
//       author: this.author,
//       description: this.description,
//       price: this.price,
//       student: this.student);
// }

// class _ItemCourse extends State<ItemCourse> {
//   int _counter = 0;
//   _ItemCourse({
//     Key? key,
//     required int this.id,
//     required String this.name,
//     required String this.author,
//     required String this.description,
//     required String this.price,
//     required String this.student,
//   });
//   final int id;
//   final String name;
//   final String author;
//   final String description;
//   final String price;
//   final String student;
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => LessionScreen(course: cou,)));
//       },
//       child: Container(
//           width: MediaQuery.of(context).size.width,
//           margin: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8), color: Colors.blue),
//           child: Row(
//             children: [
//               Container(
//                   width: MediaQuery.of(context).size.width * 0.1,
//                   margin: EdgeInsets.all(10),
//                   child: CircleAvatar(backgroundImage: NetworkImage(author))),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.6,
//                 margin: EdgeInsets.all(10),
//                 child: Column(
//                   children: [
//                     Container(
//                       child: Row(
//                         children: [
//                           Text(name + " With:",
//                               style: const TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold)),
//                           Text(price + "\$",
//                               style: const TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.yellow))
//                         ],
//                       ),
//                     ),
//                     Text(
//                       description,
//                       style: const TextStyle(
//                           fontSize: 15, fontWeight: FontWeight.bold),
//                       textAlign: TextAlign.left,
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 width: MediaQuery.of(context).size.width * 0.1,
//                 child: IconButton(
//                   icon: Icon(Icons.delete),
//                   color: Colors.red,
//                   onPressed: () {
//                     deleteCourse(id);
//                     setState(() {
//                       _counter++;
//                     });
//                   },
//                   tooltip: "Delete this course!",
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }
