import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipe_app/text_data.dart';
import 'package:recipe_app/youtube_album.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:http/http.dart' as http;

class VideoPageModel extends ChangeNotifier {
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  final bool _isPlayerReady = false;
  late Future<YoutubeAlbum> futureAlbum;

  late YoutubePlayerController _controller;

  YoutubePlayerController get controller => _controller;

  YoutubePlayerController initVideoID(String initialVideoId) {
    _controller = YoutubePlayerController(initialVideoId: initialVideoId);
    initFutureAlbum();
    return controller;
  }

  void listener() {
    if (_isPlayerReady && !_controller.value.isFullScreen) {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
        notifyListeners();
    }
  }

  void initFutureAlbum() {
    futureAlbum = fetchAlbum();
  }

  Future<YoutubeAlbum> fetchAlbum() async {
    final youtubeApiKey = await _fetchYoutubeApiKey();
    final url = Uri.parse(
        '${TextData.youtubeV3APIURL}${controller.initialVideoId}&key=$youtubeApiKey&part=${TextData.youtubeURLPart}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return YoutubeAlbum.fromJson(jsonDecode(response.body));
    }
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception(TextData.failedToLoadAlbum);
  }

  Future<String> _fetchYoutubeApiKey() async {
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection(TextData.api)
        .doc(TextData.youtubeV3APIKey)
        .get();
    final Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return data[TextData.youtubeV3APIKey];
  }
}
