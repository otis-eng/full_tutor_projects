import 'dart:convert';
import 'package:f_tutor_app/model/tutorModal.dart';
import 'package:http/http.dart' as http;

// final url = "http://homepagetutor.cleverapps.io/request/getRequest/id";

Future<bool> Register(
    String name,
    String bithday,
    String phone,
    String email,
    String password,
    String addRess,
    String languae,
    String skill,
    String education,
    String gpa) async {
  final tutor = {
    "name": name,
    "bithday": bithday,
    "phone": phone,
    "email": email,
    "password": password,
    "addRess": addRess,
    "languae": languae,
    "skill": skill,
    "education": education,
    "gpa": gpa
  };
  // final totorJson = json.encode(tutor);

  final response = await http.post(
      Uri.parse("http://homepagetutor.cleverapps.io/tutor/registerTutor"),
      headers: {"Accept": "application/json"},
      body: tutor);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<bool> login(String email, String password) async {
  final user = {"email": email, "password": password};
  final response = await http.post(
      Uri.parse("http://homepagetutor.cleverapps.io/tutor/login"),
      headers: {"Accept": "application/json"},
      body: user);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<List<Tutor>> getTutorProfile(String email) async {
  final response = await http.get(
      Uri.parse(
          "http://homepagetutor.cleverapps.io/tutor/getTutorProfile/$email"),
      headers: {"Accept": "application/json"});
  if (response.statusCode == 200) {
    final jsons = "[" + response.body + "]";
    List<dynamic> bodys = json.decode(jsons);
    List<Tutor> tutor =
        bodys.map((dynamic item) => Tutor.fromJson(item)).toList();
    return tutor;
  } else {
    return throw Exception("Faild to laod data");
  }
}

Future<bool> updateProfile(
  int idTutor,
  String name,
  String email,
  String phone,
  String avatar,
  String education,
  String skill,
) async {
  final body = {
    "name": name,
    "phone": phone,
    "email": email,
    "skill": skill,
    "education": education,
    "avatar": avatar,
  };
  final response = await http.put(
      Uri.parse(
          "http://homepagetutor.cleverapps.io/tutor/updateTutor/$idTutor"),
      headers: {"Accept": "application/json"},
      body: body);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
