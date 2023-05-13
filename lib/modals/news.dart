class News {
  final String sourceName;
  final String author;
  final String title;
  final String description;
  final String image;
  final String url;
  final String publishAtTime;
  final String content;

  News({
    required this.sourceName,
    required this.author,
    required this.title,
    required this.description,
    required this.image,
    required this.url,
    required this.publishAtTime,
    required this.content,
  });

  factory News.fromMap({required Map data}) {
    return News(
      sourceName: data["source"]["name"].toString(),
      author: data["author"].toString(),
      title: data["title"].toString(),
      description: data["description"].toString(),
      image: data["urlToImage"].toString(),
      url: data["url"].toString(),
      publishAtTime: data["publishedAt"].toString(),
      content: data["content"].toString(),
    );
  }
}
