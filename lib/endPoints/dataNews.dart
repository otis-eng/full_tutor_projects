import 'dart:convert';
import "package:http/http.dart" as http;

import '../model/newsModal.dart';

Future<List<News>> fetchNews() async {
  final response = await http.get(
      Uri.parse("http://homepagetutor.cleverapps.io/news/getAllNews"),
      headers: {"Accept": "application/json"});
  if (response.statusCode == 200) {
    List<dynamic> body = json.decode(response.body);
    List<News> news = body.map((dynamic item) => News.fromJson(item)).toList();
    return news;
  } else {
    throw Exception("Faid to load news");
  }
}
