import 'package:flutter/cupertino.dart';
import 'package:recipe_app/text_data.dart';
import 'package:recipe_app/youtube_api.dart';

class RecipePageModel extends ChangeNotifier {
  YoutubeAPI youtube = YoutubeAPI(TextData.youtubeV3APIKey);
  List<YouTubeVideo> videoResult = [];

  Future<void> callAPI() async {
    String query = TextData.queryKeyword;
    videoResult = await youtube.search(
      query,
      order: TextData.relevance,
      videoDuration: TextData.any,
      channelId: TextData.youtubeChannelID,
    );
    videoResult = await youtube.nextPage();
    notifyListeners();
  }
}