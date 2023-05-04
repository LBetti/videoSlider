import 'dart:convert';

import 'package:video_slider/domain/entities/video_post.dart';

LocalVideoModel videoModelFromJson(String str) =>
    LocalVideoModel.fromJson(json.decode(str));

String videoModelToJson(LocalVideoModel data) => json.encode(data.toJson());

class LocalVideoModel {
  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        name: json['name'] ?? 'No name',
        videoUrl: json['videoUrl'] ?? 'No URL',
        likes: json['likes'],
        views: json['views'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'videoUrl': videoUrl,
        'likes': likes,
        'views': views,
      };

  VideoPost toVideoPostEntity() =>
      VideoPost(caption: name, videoUrl: videoUrl, likes: likes, views: views);
}
