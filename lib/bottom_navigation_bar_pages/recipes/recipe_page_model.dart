import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipe_app/text_data.dart';
import 'package:recipe_app/youtube_api.dart';

class RecipePageModel extends ChangeNotifier {
  List<YouTubeVideo> _videoResult = [];
  bool isLoading = true;

  List<YouTubeVideo> get videoResult => _videoResult;

  Future<void> callAPI(String queryKeyword) async {
    final String youtubeApiKey = await _fetchYoutubeApiKey();
    final YoutubeAPI youtubeApi = _initializeYoutubeApi(youtubeApiKey);
    isLoading = true;
    _videoResult = await youtubeApi.search(
      queryKeyword,
      order: TextData.relevance,
      videoDuration: TextData.any,
      channelId: TextData.youtubeChannelID,
    );
    isLoading = false;
    notifyListeners();
  }

  Future<String> _fetchYoutubeApiKey() async {
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection(TextData.api)
        .doc(TextData.youtubeV3APIKey)
        .get();
    final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return data[TextData.youtubeV3APIKey];
  }

  YoutubeAPI _initializeYoutubeApi(final String youtubeApiKey) {
    return YoutubeAPI(youtubeApiKey);
  }
}