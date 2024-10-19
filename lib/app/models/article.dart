class Article {
  final int? id;
  final String title;
  final String? aiTitle;
  final String content;
  final String? aiContent;
  final String? htmlContent;
  final String url;
  final String? imageUrl;
  final String? imagePath;
  final String? screenshotPath;
  final int isRead;
  final int isFavorite;
  final DateTime? pubDate;
  final String? comment;
  final int? tagId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Article({
    this.id,
    required this.title,
    this.aiTitle,
    required this.content,
    this.aiContent,
    this.htmlContent,
    required this.url,
    this.imageUrl,
    this.imagePath,
    this.screenshotPath,
    this.isRead = 0,
    this.isFavorite = 0,
    this.pubDate,
    this.comment,
    this.tagId,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      id: map['id'] as int?,
      title: map['title'] as String,
      aiTitle: map['ai_title'] as String?,
      content: map['content'] as String,
      aiContent: map['ai_content'] as String?,
      htmlContent: map['html_content'] as String?,
      url: map['url'] as String,
      imageUrl: map['image_url'] as String?,
      imagePath: map['image_path'] as String?,
      screenshotPath: map['screenshot_path'] as String?,
      isRead: map['is_read'] as int? ?? 0,
      isFavorite: map['is_favorite'] as int? ?? 0,
      pubDate:
          map['pub_date'] != null ? DateTime.tryParse(map['pub_date']) : null,
      comment: map['comment'] as String?,
      tagId: map['tag_id'] as int?,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'ai_title': aiTitle,
      'content': content,
      'ai_content': aiContent,
      'html_content': htmlContent,
      'url': url,
      'image_url': imageUrl,
      'image_path': imagePath,
      'screenshot_path': screenshotPath,
      'is_read': isRead,
      'is_favorite': isFavorite,
      'pub_date': pubDate?.toIso8601String(),
      'comment': comment,
      'tag_id': tagId,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}