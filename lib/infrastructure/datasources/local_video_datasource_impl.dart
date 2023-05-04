import 'package:video_slider/domain/entities/video_post.dart';
import 'package:video_slider/infrastructure/models/local_video_model.dart';

import '../../domain/datasources/video_posts_datasource.dart';
import '../../shared/data/local_video_posts.dart';

class LocalVideosDatasource implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 2));
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();
    return newVideos;
  }
}
