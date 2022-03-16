import 'dart:convert';
import 'package:f_tutor_app/model/courseModal.dart';
import 'package:http/http.dart' as http;

Future<List<Course>> fetchCourseById(int id) async {
  const String domain = "http://homepagetutor.cleverapps.io/";
  final response = await http.get(
      Uri.parse("http://homepagetutor.cleverapps.io/course/getCourse/$id"),
      headers: {"Accept": "application/json"});
  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);
    List<Course> course =
        body.map((dynamic item) => Course.fromJson(item)).toList();
    return course;
  } else {
    throw Exception("Faid to load course");
  }
}

Future<bool> deleteCourse(int id) async {
  final response = await http.delete(
      Uri.parse("http://homepagetutor.cleverapps.io/course/deleteCourse/$id"));
  if (response.statusCode == 200) {
    return true;
  } else {
    throw false;
  }
}

Future<bool> addCoruse(String author, String nameCourse, String description,
    String ageLimit, String price) async {
  final course = {
    "author": author,
    "name": nameCourse,
    "description": description,
    "ageLimit": ageLimit,
    "price": price,
  };
  final response = await http.post(
      Uri.parse("http://homepagetutor.cleverapps.io/course/createCourse"),
      body: course);
  if (response.statusCode == 200) {
    print("True");
    return true;
  } else {
    return false;
  }
}
