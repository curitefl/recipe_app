import 'package:flutter/cupertino.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/recipes/youtube_album.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_app/text_data.dart';

class VideoPageModel extends ChangeNotifier {
  late Future<Album> futureAlbum;

  void initFutureAlbum() {
    futureAlbum = fetchAlbum();
  }

  Future<Album> fetchAlbum() async {
    final url = Uri.parse(
        '${TextData.youtubeV3APIURL}${TextData.youtubeVideoID}&key=${TextData.youtubeV3APIKey}&part=${TextData.youtubeURLPart}');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception(TextData.failedToLoadAlbum);
    }
  }
}
