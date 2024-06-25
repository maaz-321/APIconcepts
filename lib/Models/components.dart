import 'dart:convert';

List<Information> informationFromJson(String str) => List<Information>.from(
    json.decode(str).map((x) => Information.fromJson(x)));

String informationToJson(List<Information> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Information {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Information({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory Information.fromJson(Map<String, dynamic> json) => Information(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
