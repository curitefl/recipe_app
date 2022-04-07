import 'package:flutter/cupertino.dart';
import 'package:recipe_app/text_data.dart';
import 'package:recipe_app/youtube_api.dart';

class RecipePageModel extends ChangeNotifier {
  final YoutubeAPI _youtube = YoutubeAPI(TextData.youtubeV3APIKey);
  List<YouTubeVideo> _videoResult = [];
  bool isLoading = true;

  List<YouTubeVideo> get videoResult => _videoResult;

  Future<void> callAPI(String queryKeyword) async {
    isLoading = true;
    _videoResult = await _youtube.search(
      queryKeyword,
      order: TextData.relevance,
      videoDuration: TextData.any,
      channelId: TextData.youtubeChannelID,
    );
    isLoading = false;
    notifyListeners();
  }
}