// // class CouponModel {
// //   String? couponId;
// //   String? couponName;
// //   String? couponCount;
// //   String? couponDiscount;
// //   String? couponExpiredate;
// //
// //   CouponModel(
// //       {this.couponId,
// //       this.couponName,
// //       this.couponCount,
// //       this.couponDiscount,
// //       this.couponExpiredate});
// //
// //   CouponModel.fromJson(Map<String, dynamic> json) {
// //     couponId = json['coupon_id'];
// //     couponName = json['coupon_name'];
// //     couponCount = json['coupon_count'];
// //     couponDiscount = json['coupon_discount'];
// //     couponExpiredate = json['coupon_expiredate'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['coupon_id'] = this.couponId;
// //     data['coupon_name'] = this.couponName;
// //     data['coupon_count'] = this.couponCount;
// //     data['coupon_discount'] = this.couponDiscount;
// //     data['coupon_expiredate'] = this.couponExpiredate;
// //     return data;
// //   }
// // }
//
// class CouponModel {
//   String? couponId;
//   String? couponName;
//   String? couponCount;
//   String? couponDiscount;
//   String? couponExpiredate;
//
//   String? discountType;
//   String? discountValue;
//   int? discountAmount;
//   int? newTotal;
//   String? expiresAt;
//   String? message;
//
//   CouponModel({
//     this.couponId,
//     this.couponName,
//     this.couponCount,
//     this.couponDiscount,
//     this.couponExpiredate,
//     this.discountType,
//     this.discountValue,
//     this.discountAmount,
//     this.newTotal,
//     this.expiresAt,
//     this.message,
//   });
//
//   CouponModel.fromJson(Map<String, dynamic> json) {
//     couponId = json['coupon_id'];
//     couponName = json['coupon_name'] ?? json['discount_code'];
//     couponCount = json['coupon_count'];
//     couponDiscount = json['coupon_discount'] ?? json['discount_value'];
//     couponExpiredate = json['coupon_expiredate'];
//
//     discountType = json['discount_type'];
//     discountValue = json['discount_value'];
//     discountAmount = json['discount_amount'];
//     newTotal = json['new_total'];
//     expiresAt = json['expires_at'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'coupon_id': couponId,
//       'coupon_name': couponName,
//       'coupon_count': couponCount,
//       'coupon_discount': couponDiscount,
//       'coupon_expiredate': couponExpiredate,
//       'discount_type': discountType,
//       'discount_value': discountValue,
//       'discount_amount': discountAmount,
//       'new_total': newTotal,
//       'expires_at': expiresAt,
//       'message': message,
//     };
//   }
// }

class CouponModel {
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponDiscount;
  String? couponExpiredate;

  String? discountType;
  String? discountValue;
  int? discountAmount;
  int? newTotal;
  String? expiresAt;
  String? message;

  CouponModel({
    this.couponId,
    this.couponName,
    this.couponCount,
    this.couponDiscount,
    this.couponExpiredate,
    this.discountType,
    this.discountValue,
    this.discountAmount,
    this.newTotal,
    this.expiresAt,
    this.message,
  });

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'] ?? json['discount_code'] ?? '';
    couponCount = json['coupon_count'];
    couponDiscount = json['coupon_discount'] ?? json['discount_value'] ?? '';
    couponExpiredate = json['coupon_expiredate'];

    discountType = json['discount_type'];
    discountValue = json['discount_value'];
    discountAmount = (json['discount_amount'] as num?)?.toInt();
    newTotal = (json['new_total'] as num?)?.toInt();
    expiresAt = json['expires_at'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    return {
      'coupon_id': couponId,
      'coupon_name': couponName,
      'coupon_count': couponCount,
      'coupon_discount': couponDiscount,
      'coupon_expiredate': couponExpiredate,
      'discount_type': discountType,
      'discount_value': discountValue,
      'discount_amount': discountAmount,
      'new_total': newTotal,
      'expires_at': expiresAt,
      'message': message,
    };
  }
}

class CouponResponseModel {
  final bool success;
  final String? message;
  final CouponModel? data;
  final String? minOrderAmount; // ✅ الحقل الجديد

  CouponResponseModel({
    required this.success,
    this.message,
    this.data,
    this.minOrderAmount,
  });

  factory CouponResponseModel.fromJson(Map<String, dynamic> json) {
    return CouponResponseModel(
      success: json['success'] ?? false,
      message: json['message'],
      minOrderAmount: json['min_order_amount'], // ✅ التقاط الحقل الجديد
      data: json['success'] == true ? CouponModel.fromJson(json) : null,
    );
  }
}


