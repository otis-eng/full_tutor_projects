class Lession {
  int? id;
  int? course;
  String? student;
  String? linkMeet;
  String? timeStart;
  String? timeEnd;
  String? date;
  String? description;
  String? status;
  String? createdAt;
  String? updatedAt;

  Lession(
      {this.id,
      this.course,
      this.student,
      this.linkMeet,
      this.timeStart,
      this.timeEnd,
      this.date,
      this.description,
      this.status,
      this.createdAt,
      this.updatedAt});

  static fromJson(Map<String, dynamic> json) {
    Lession lession = new Lession();
    lession.id = json['id'];
    lession.course = json['course'];
    lession.student = json['student'];
    lession.linkMeet = json['linkMeet'];
    lession.timeStart = json['timeStart'];
    lession.timeEnd = json['timeEnd'];
    lession.date = json['date'];
    lession.description = json['description'];
    lession.status = json['status'];
    lession.createdAt = json['createdAt'];
    lession.updatedAt = json['updatedAt'];
    return lession;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['course'] = this.course;
    data['student'] = this.student;
    data['linkMeet'] = this.linkMeet;
    data['timeStart'] = this.timeStart;
    data['timeEnd'] = this.timeEnd;
    data['date'] = this.date;
    data['description'] = this.description;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
