class ItemsModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  int? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  int? itemsCat;
  int? categoriesId;
  String? categoriesName;
  String? categoriesNamaAr;
  String? categoriesImage;
  String? categoriesDatetime;

  ItemsModel(
      {this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsCat,
        this.categoriesId,
        this.categoriesName,
        this.categoriesNamaAr,
        this.categoriesImage,
        this.categoriesDatetime});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['id'];
    itemsName = json['title'];
    //itemsNameAr = json['items_name_ar'];
    itemsDesc = json['description'];
    //itemsDescAr = json['items_desc_ar'];
    itemsImage = json['cover_image'];
    itemsCount = json['count'];
    //itemsActive = json['items_active'];
    itemsPrice = json['price'];
    //itemsDiscount = json['items_discount'];
    //itemsDate = json['items_date'];
    itemsCat = json['category_id'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
   // categoriesNamaAr = json['categories_nama_ar'];
    categoriesImage = json['categories_image'];
    //categoriesDatetime = json['categories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_nama_ar'] = this.categoriesNamaAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}