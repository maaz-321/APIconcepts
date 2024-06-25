// To parse this JSON data, do
//
//     final youtubeApi = youtubeApiFromJson(jsonString);

import 'dart:convert';

YoutubeApi youtubeApiFromJson(String str) =>
    YoutubeApi.fromJson(json.decode(str));

String youtubeApiToJson(YoutubeApi data) => json.encode(data.toJson());

class YoutubeApi {
  String? kind;
  String? etag;
  PageInfo? pageInfo;
  List<Item>? items;

  YoutubeApi({
    this.kind,
    this.etag,
    this.pageInfo,
    this.items,
  });

  factory YoutubeApi.fromJson(Map<String, dynamic> json) => YoutubeApi(
        kind: json["kind"],
        etag: json["etag"],
        pageInfo: PageInfo.fromJson(json["pageInfo"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "pageInfo": pageInfo?.toJson(),
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  String? kind;
  String? etag;
  String? id;
  Snippet? snippet;
  ContentDetails? contentDetails;
  Statistics? statistics;

  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
    this.contentDetails,
    this.statistics,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        kind: json["kind"],
        etag: json["etag"],
        id: json["id"],
        snippet: Snippet.fromJson(json["snippet"]),
        contentDetails: ContentDetails.fromJson(json["contentDetails"]),
        statistics: Statistics.fromJson(json["statistics"]),
      );

  Map<String, dynamic> toJson() => {
        "kind": kind,
        "etag": etag,
        "id": id,
        "snippet": snippet?.toJson(),
        "contentDetails": contentDetails?.toJson(),
        "statistics": statistics?.toJson(),
      };
}

class ContentDetails {
  RelatedPlaylists? relatedPlaylists;

  ContentDetails({
    this.relatedPlaylists,
  });

  factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
        relatedPlaylists: RelatedPlaylists.fromJson(json["relatedPlaylists"]),
      );

  Map<String, dynamic> toJson() => {
        "relatedPlaylists": relatedPlaylists?.toJson(),
      };
}

class RelatedPlaylists {
  String? likes;
  String? uploads;

  RelatedPlaylists({
    this.likes,
    this.uploads,
  });

  factory RelatedPlaylists.fromJson(Map<String, dynamic> json) =>
      RelatedPlaylists(
        likes: json["likes"],
        uploads: json["uploads"],
      );

  Map<String, dynamic> toJson() => {
        "likes": likes,
        "uploads": uploads,
      };
}

class Snippet {
  String? title;
  String? description;
  String? customUrl;
  DateTime? publishedAt;
  Thumbnails? thumbnails;
  Localized? localized;
  String? country;

  Snippet({
    this.title,
    this.description,
    this.customUrl,
    this.publishedAt,
    this.thumbnails,
    this.localized,
    this.country,
  });

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
        title: json["title"],
        description: json["description"],
        customUrl: json["customUrl"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        thumbnails: Thumbnails.fromJson(json["thumbnails"]),
        localized: Localized.fromJson(json["localized"]),
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "customUrl": customUrl,
        "publishedAt": publishedAt?.toIso8601String(),
        "thumbnails": thumbnails?.toJson(),
        "localized": localized?.toJson(),
        "country": country,
      };
}

class Localized {
  String? title;
  String? description;

  Localized({
    this.title,
    this.description,
  });

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
      };
}

class Thumbnails {
  Default? thumbnailsDefault;
  Default? medium;
  Default? high;

  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
  });

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
        thumbnailsDefault: Default.fromJson(json["default"]),
        medium: Default.fromJson(json["medium"]),
        high: Default.fromJson(json["high"]),
      );

  Map<String, dynamic> toJson() => {
        "default": thumbnailsDefault?.toJson(),
        "medium": medium?.toJson(),
        "high": high?.toJson(),
      };
}

class Default {
  String? url;
  int? width;
  int? height;

  Default({
    this.url,
    this.width,
    this.height,
  });

  factory Default.fromJson(Map<String, dynamic> json) => Default(
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
      };
}

class Statistics {
  String? viewCount;
  String? subscriberCount;
  bool? hiddenSubscriberCount;
  String? videoCount;

  Statistics({
    this.viewCount,
    this.subscriberCount,
    this.hiddenSubscriberCount,
    this.videoCount,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        viewCount: json["viewCount"],
        subscriberCount: json["subscriberCount"],
        hiddenSubscriberCount: json["hiddenSubscriberCount"],
        videoCount: json["videoCount"],
      );

  Map<String, dynamic> toJson() => {
        "viewCount": viewCount,
        "subscriberCount": subscriberCount,
        "hiddenSubscriberCount": hiddenSubscriberCount,
        "videoCount": videoCount,
      };
}

class PageInfo {
  int? totalResults;
  int? resultsPerPage;

  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
        totalResults: json["totalResults"],
        resultsPerPage: json["resultsPerPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalResults": totalResults,
        "resultsPerPage": resultsPerPage,
      };
}
