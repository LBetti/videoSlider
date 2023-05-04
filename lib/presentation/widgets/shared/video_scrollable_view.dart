import 'package:flutter/material.dart';
import 'package:video_slider/presentation/widgets/shared/video_buttons.dart';
import 'package:video_slider/presentation/widgets/video/full_screen.dart';

import '../../../domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;
  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final videoPost = videos[index];
          return Stack(children: [
            SizedBox.expand(
                child: FullScreenPlayer(
              caption: videoPost.caption,
              videoURL: videoPost.videoUrl,
            )),
            Positioned(
                bottom: 40, right: 20, child: VideoButtons(video: videoPost))
          ]);
        });
  }
}
