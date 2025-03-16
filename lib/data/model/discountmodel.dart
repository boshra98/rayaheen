class DiscountModel {
  int? id;
  int? bookId;
  String? discountPercentage;

  DiscountModel({
    this.id,
    this.bookId,
    this.discountPercentage,
  });

  factory DiscountModel.fromJson(Map<String, dynamic> json) {
    print("🛠️ يتم تحويل بيانات الحسم: ${json.toString()}"); // ✅ طباعة البيانات للتحقق
    return DiscountModel(
      id: json['id'],
      bookId: json['book_id'],
      discountPercentage: json['discount_percentage']?.toString(), // ✅ استخدمي الاسم الصحيح
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'book_id': bookId,
      'discount_persentage': discountPercentage,
    };
  }
}
