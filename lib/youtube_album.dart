class YoutubeAlbum {
  final String description;


  const YoutubeAlbum({
    required this.description,
  });

  factory YoutubeAlbum.fromJson(Map<String, dynamic> json) {
    return YoutubeAlbum(
      description: json['items'][0]['snippet']['description'],
    );
  }
}