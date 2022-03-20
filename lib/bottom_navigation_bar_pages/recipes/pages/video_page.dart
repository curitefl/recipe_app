import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/recipes/pages/video_page_model.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/recipes/youtube_album.dart';

class VideoPage extends StatelessWidget {
  final String title;

  const VideoPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        child: Consumer<VideoPageModel>(builder: (context, model, child) {
          return FutureBuilder<Album>(
            future: model.futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(children: [
                  Text(
                    snapshot.data!.title,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 24.0.h),
                  Text(
                    snapshot.data!.description,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ]);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          );
        }),
      ),
    );
  }
}
