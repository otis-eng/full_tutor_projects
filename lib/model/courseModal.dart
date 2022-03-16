import 'dart:convert';

class Course {
  final int id;
  final String author;
  final String name;
  final String description;
  final String ageLimit;
  final String price;
  final String createdAt;
  final String updatedAt;
  final String student;
  Course({
    required this.id,
    required this.author,
    required this.name,
    required this.description,
    required this.ageLimit,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.student,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'author': author,
      'name': name,
      'description': description,
      'ageLimit': ageLimit,
      'price': price,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] ?? '',
      author: json['author'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      ageLimit: json['ageLimit'] ?? '',
      price: json['price'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      student: json['student'] ?? '',
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Course.fromJson(String source) => Course.fromMap(json.decode(source));
}
