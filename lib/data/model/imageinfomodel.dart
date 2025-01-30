class ImageInfo {
  // final String id;
  // final String bookId;
  final String path;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  ImageInfo({
    // required this.id,
    // required this.bookId,
    required this.path,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory ImageInfo.fromJson(Map<String, dynamic> json) {
    return ImageInfo(
      // id: json['id'],
      // bookId: json['book_id'],
      path: json['path'],
      // createdAt: DateTime.parse(json['created_at']),
      // updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'id': id,
      // 'book_id': bookId,
      'path': path,
      // 'created_at': createdAt.toIso8601String(),
      // 'updated_at': updatedAt.toIso8601String(),
    };
  }
}
