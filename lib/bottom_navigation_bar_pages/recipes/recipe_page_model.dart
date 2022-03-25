import 'package:flutter/cupertino.dart';
import 'package:recipe_app/text_data.dart';
import 'package:recipe_app/youtube_api.dart';

class RecipePageModel extends ChangeNotifier {
  final YoutubeAPI _youtube = YoutubeAPI(TextData.youtubeV3APIKey);
  List<YouTubeVideo> _videoResult = [];

  List<YouTubeVideo> get videoResult => _videoResult;

  Future<void> callAPI() async {
    String query = TextData.queryKeyword;
    _videoResult = await _youtube.search(
      query,
      order: TextData.relevance,
      videoDuration: TextData.any,
      channelId: TextData.youtubeChannelID,
    );
    notifyListeners();
  }
}