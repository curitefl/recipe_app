import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/video_arguments.dart';

class VideoPage extends StatelessWidget {
  final String title;

  const VideoPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as VideoArguments;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0.h),
        child: AppBar(
          centerTitle: true,
          title: Text(title),
          titleTextStyle: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Image.network(
              args.youtubeVideo.thumbnail.medium.url ?? '',
              width: 120.0.w,
            ),
            SizedBox(height: 24.0.h),
            Text(
              args.youtubeVideo.title,
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 24.0.h),
            Text(
              args.youtubeVideo.description.toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
