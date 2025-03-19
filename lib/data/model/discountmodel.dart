class DiscountModel {
  int? id;
  int? bookId;
  String? discountPercentage;
  String? expiresAt; // 🆕 تاريخ انتهاء الحسم

  DiscountModel({
    this.id,
    this.bookId,
    this.discountPercentage,
    this.expiresAt, // 🆕
  });

  factory DiscountModel.fromJson(Map<String, dynamic> json) {
    print("🛠️ يتم تحويل بيانات الحسم: ${json.toString()}"); // ✅ طباعة البيانات للتحقق

    return DiscountModel(
      id: json['id'],
      bookId: json['book_id'],
      discountPercentage: json['discount_percentage']?.toString(),
      expiresAt: json['expires_at'], // ✅ تأكد من استخراج expires_at
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'book_id': bookId,
      'discount_percentage': discountPercentage,
      'expires_at': expiresAt, // 🆕 تضمين تاريخ انتهاء الحسم
    };
  }
}
