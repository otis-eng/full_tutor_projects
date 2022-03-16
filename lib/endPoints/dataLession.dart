import 'dart:convert';

import 'package:f_tutor_app/model/lessionModal.dart';
import 'package:http/http.dart' as http;

Future<List<Lession>> getAllLession(int id) async {
  // const String domain = "http://homepagetutor.cleverapps.io/";
  final response = await http.get(
      Uri.parse("http://homepagetutor.cleverapps.io/lession/getAll/$id"),
      headers: {"Accept": "application/json"});
  if (response.statusCode == 200) {
    List<Lession> lession;
    Iterable l = json.decode(response.body).toList();
    lession = List<Lession>.from(l.map((model) => Lession.fromJson(model)));
    return lession;
  } else {
    throw Exception("Faid to load course");
  }
}

Future<bool> addLession(int course, String student, String timeStart,
    String timeEnd, String linkMeet, String description, String date) async {
  final lession = {
    "students": student,
    "timeStart": timeStart,
    "timeEnd": timeEnd,
    "linkMeet": linkMeet,
    "date": date,
    "description": description
  };
  final response = await http.post(
      Uri.parse(
          "http://homepagetutor.cleverapps.io/lession/addLession/$course"),
      body: lession);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
