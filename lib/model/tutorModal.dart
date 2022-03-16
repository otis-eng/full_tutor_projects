import 'dart:convert';

class Tutor {
  final int id;
  final String name;
  final String bithDay;
  final String phone;
  final String avatar;
  final String email;
  final String password;
  final String status;
  final String address;
  final String languae;
  final String skill;
  final String education;
  final String gpa;
  Tutor({
    required this.id,
    required this.name,
    required this.bithDay,
    required this.phone,
    required this.avatar,
    required this.email,
    required this.password,
    required this.status,
    required this.address,
    required this.languae,
    required this.skill,
    required this.education,
    required this.gpa,
  });




  factory Tutor.fromJson(Map<String, dynamic> json) {
    return Tutor(
      id: json['id']?.toInt() ?? 0,
      name: json['name'] ?? '',
      bithDay: json['bithDay'] ?? '',
      phone: json['phone'] ?? '',
      avatar: json['avatar'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      status: json['status'] ?? '',
      address: json['address'] ?? '',
      languae: json['languae'] ?? '',
      skill: json['skill'] ?? '',
      education: json['education'] ?? '',
      gpa: json['gpa'] ?? '',
    );
  }
}
