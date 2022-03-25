import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/food_stuffs/food_stuffs_page_model.dart';
import 'package:recipe_app/text_data.dart';
import 'package:recipe_app/youtube_api.dart';

class RecipePageModel extends ChangeNotifier {
  final YoutubeAPI _youtube = YoutubeAPI(TextData.youtubeV3APIKey);
  List<YouTubeVideo> _videoResult = [];

  List<YouTubeVideo> get videoResult => _videoResult;

  Future<void> callAPI(String queryKeyword) async {
    _videoResult = await _youtube.search(
      queryKeyword,
      order: TextData.relevance,
      videoDuration: TextData.any,
    );
    notifyListeners();
  }
}