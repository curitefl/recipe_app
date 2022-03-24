import 'package:flutter/cupertino.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPageModel extends ChangeNotifier {
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  final bool _isPlayerReady = false;

  late YoutubePlayerController _controller;

  YoutubePlayerController get controller => _controller;

  YoutubePlayerController initVideoID(String initialVideoId) {
    _controller = YoutubePlayerController(initialVideoId: initialVideoId);
    return controller;
  }

  void listener() {
    if (_isPlayerReady && !_controller.value.isFullScreen) {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
        notifyListeners();
    }
  }
}