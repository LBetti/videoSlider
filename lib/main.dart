import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_slider/config/theme/app_theme.dart';
import 'package:video_slider/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:video_slider/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:video_slider/presentation/providers/discover_provider.dart';
import 'package:video_slider/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videosDatasource: LocalVideosDatasource());
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                DiscoverProvider(videosRepository: videoPostRepository)
                  ..loadNextPage()),
      ],
      child: MaterialApp(
        title: 'Slider',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
