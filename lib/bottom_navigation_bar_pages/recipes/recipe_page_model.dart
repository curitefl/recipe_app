import 'package:flutter/cupertino.dart';
import 'package:recipe_app/bottom_navigation_bar_pages/recipes/youtube_album.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RecipePageModel extends ChangeNotifier {
  late Future<Album> futureAlbum;

  void initFutureAlbum() {
    futureAlbum = fetchAlbum();
  }

  Future<Album> fetchAlbum() async {
    const id = "X48VuDVv0do";
    const key = "AIzaSyAvdhPss_s6AoxEjmZumJxS8-5HExH9J2Q";
    const part = "snippet";

    final url =
        Uri.parse('https://www.googleapis.com/youtube/v3/videos?id=$id&key=$key&part=$part');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
