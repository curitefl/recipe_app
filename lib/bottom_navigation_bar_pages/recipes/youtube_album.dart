class Album {
  final String title;
  final String description;


  const Album({
    required this.title,
    required this.description,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['items'][0]['snippet']['title'],
      description: json['items'][0]['snippet']['description'],
    );
  }
}