import 'dart:convert';

class Request {
  final int id;
  final String author;
  final int course;
  final String student;
  final String status;
  Request({
    required this.id,
    required this.author,
    required this.course,
    required this.student,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author, 
      'course': course,
      'status': status,
    };
  }

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      id: json['id']?.toInt() ?? 0,
      author: json['author'] ?? '',
      course: json['course']?.toInt() ?? 0,
      status: json['status'] ?? '',
      student: json['student'] ?? '',
    );
  }
}
