import 'dart:convert';

List<Userdata> userdataFromJson(String str) =>
    List<Userdata>.from(json.decode(str).map((x) => Userdata.fromJson(x)));

String userdataToJson(List<Userdata> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Userdata {
  int? userId;
  int? id;
  String? title;

  Userdata({
    this.userId,
    this.id,
    this.title,
  });

  factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
