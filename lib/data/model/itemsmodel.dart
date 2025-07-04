import 'discountmodel.dart';
import 'imageinfomodel.dart';

class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;

  String? author;
  int? year;
  String? publisher;

  List<ImageInfo>? itemsImages; // Updated field

  String? itemsImage;
  int? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  // String? itemsDiscount;
  String? itemsDate;
  int? itemsCat;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNamaAr;
  String? categoriesImage;
  String? categoriesDatetime;

  DiscountModel? discount; // ✅ إضافة متغير الحسومات

  ItemsModel({
    this.itemsId,
    this.itemsName,
    this.itemsNameAr,
    this.itemsDesc,
    this.itemsDescAr,
    this.year,
    this.publisher,
    this.author,
    this.itemsImages,
    this.itemsImage,
    this.itemsCount,
    this.itemsActive,
    this.itemsPrice,
    // this.itemsDiscount,
    this.itemsDate,
    this.itemsCat,
    this.categoriesId,
    this.categoriesName,
    this.categoriesNamaAr,
    this.categoriesImage,
    this.categoriesDatetime,
    this.discount, // ✅ إضافة الحسومات هنا
  });

  ItemsModel.fromJson(Map<dynamic, dynamic> json) {
    itemsId = json['id'];
    itemsName = json['title'];
    author = json['author'];
    year = json['year'];
    publisher = json['publisher'];
    itemsDesc = json['description'];

    if (json['images'] != null && json['images'] is List) {
      itemsImages = (json['images'] as List)
          .map((imageJson) => ImageInfo.fromJson(imageJson))
          .toList();
    } else {
      itemsImages = [];
    }


    itemsImage = json['cover_image'];
    itemsCount = json['count'];
    itemsPrice = json['price'];
    itemsCat = json['category_id'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesImage = json['categories_image'];

    // ✅ التحقق من وجود بيانات الخصم وإضافتها
    if (json['discount'] != null) {
      print("📢 بيانات الحسم القادمة من الباكند: ${json['discount']}"); // ✅ طباعة بيانات الحسم للتحقق
      discount = DiscountModel.fromJson(json['discount']);
    } else {
      print("⚠️ لا يوجد بيانات للحسم في الاستجابة");
    }



  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['author'] = author;
    data['publisher'] = publisher;
    data['year'] = year;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;

    // ✅ تحويل الصور إلى JSON
    if (itemsImages != null) {
      data['images'] = itemsImages!.map((image) => image.toJson()).toList();
    }

    data['items_image'] = itemsImage;
    data['items_count'] = itemsCount;
    data['items_active'] = itemsActive;
    data['items_price'] = itemsPrice;
    // data['items_discount'] = itemsDiscount;
    data['items_date'] = itemsDate;
    data['items_cat'] = itemsCat;
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_nama_ar'] = categoriesNamaAr;
    data['categories_image'] = categoriesImage;
    data['categories_datetime'] = categoriesDatetime;

    // ✅ إضافة بيانات الخصم إذا كانت موجودة
    if (discount != null) {
      data['discount'] = discount!.toJson();
    }

    return data;
  }
}
