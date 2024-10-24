class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String content;
  final String time;
  final String source;
  final String author;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.content,
    required this.time,
    required this.source,
    required this.author,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? '',
      content: json['content'] ?? '',
      time: json['publishedAt'] ?? '',
      source: json['source']['name'] ?? '',
      author: json['author'] ?? '',
    );
  }
}
