import 'dart:convert';

class News {
  final int id;
  final String title;
  final String content;

  News(this.id, this.title, this.content);


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      json['id']?.toInt() ?? 0,
      json['title'] ?? '',
      json['content'] ?? '',
    );
  }
}
