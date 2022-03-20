import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/recipes/pages/video_page_model.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/recipes/youtube_album.dart';

class VideoPage extends StatelessWidget {
  final String title;
  const VideoPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Center(
        child: Consumer<VideoPageModel>(
            builder: (context, model, child) {
              return FutureBuilder<Album>(
                future: model.futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView(
                        children: [
                          Text(snapshot.data!.title),
                          Text(snapshot.data!.description),
                        ]
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              );
            }
        ),
      ),
    );
  }
}
