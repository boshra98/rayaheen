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

  factory ImageInfo.fromJson(dynamic json) {
    // إذا جاء كـ String فقط (مسار)
    if (json is String) {
      return ImageInfo(path: json);
    }
    // إذا جاء كـ Map يحتوي path
    else if (json is Map<String, dynamic>) {
      return ImageInfo(path: json['path'] ?? '');
    } else {
      throw Exception("Invalid image format");
    }
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
