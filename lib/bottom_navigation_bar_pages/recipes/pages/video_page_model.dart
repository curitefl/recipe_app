import 'package:flutter/cupertino.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPageModel extends ChangeNotifier {
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  YoutubePlayerController get controller => _controller;

  void listener() {
    if (_isPlayerReady && !_controller.value.isFullScreen) {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
        notifyListeners();
    }
  }
}