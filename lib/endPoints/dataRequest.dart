import 'dart:convert';
import 'package:f_tutor_app/model/requestModal.dart';
import 'package:http/http.dart' as http;

Future<List<Request>> fetchRequesetBydId(int id) async {
  const String domain = "http://homepagetutor.cleverapps.io/";
  final response = await http.get(
      Uri.parse("http://homepagetutor.cleverapps.io/request/getRequest/$id"),
      headers: {"Accept": "application/json"});
  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);
    List<Request> request =
        body.map((dynamic item) => Request.fromJson(item)).toList();
    return request;
  } else {
    throw Exception("Faid to load course");
  }
}

Future<List<Request>> getALlRequestWithCourse(int id) async {
  final response = await http.get(
      Uri.parse(
          "http://homepagetutor.cleverapps.io/request/getAllRequestWithCourse/$id"),
      headers: {"Accept": "application/json"});
  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);
    List<Request> request =
        body.map((dynamic item) => Request.fromJson(item)).toList();
    return request;
  } else {
    return throw Exception("Faild to laod data");
  }
}

Future<bool> acceptRequest(int id) async {
  final response = await http.post(
      Uri.parse("http://homepagetutor.cleverapps.io/request/acceptRequest/$id"),
      headers: {"Accept": "application/json"});
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<bool> cancelRequest(int id) async {
  final response = await http.post(
      Uri.parse("http://homepagetutor.cleverapps.io/request/cancelRequest/$id"),
      headers: {"Accept": "application/json"});
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<bool> doneRequest(int course) async {
  final request = {"course": course};
  final response = await http.post(
      Uri.parse("http://homepagetutor.cleverapps.io/request/doneRequest"),
      headers: {"Accept": "application/json"},
      body: request);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<List<Request>> getRequestDone(int id) async {
  final response = await http.get(
      Uri.parse(
          "http://homepagetutor.cleverapps.io/request/getRequestDone/$id"),
      headers: {"Accept": "application/json"});
  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);
    List<Request> request =
        body.map((dynamic item) => Request.fromJson(item)).toList();
    return request;
  } else {
    return throw Exception("Faild to laod data");
  }
}
