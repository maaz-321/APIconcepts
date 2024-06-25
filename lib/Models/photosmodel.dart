// To parse this JSON data, do
//
//     final photosmodel = photosmodelFromJson(jsonString);

import 'dart:convert';

List<Photosmodel> photosmodelFromJson(String str) => List<Photosmodel>.from(
    json.decode(str).map((x) => Photosmodel.fromJson(x)));

String photosmodelToJson(List<Photosmodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Photosmodel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photosmodel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  factory Photosmodel.fromJson(Map<String, dynamic> json) => Photosmodel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}
