class MyFavoriteModel {
  int? favoriteId;
  int? favoriteUsersid;
  int? favoriteItemsid;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  int? itemsCat;
  String? usersId;

  MyFavoriteModel(
      {this.favoriteId,
        this.favoriteUsersid,
        this.favoriteItemsid,
        this.itemsId,
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
        this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['id'];
    favoriteUsersid = json['user_id'];
    favoriteItemsid = json['book_id'];
    //itemsId = json['items_id'];
    itemsName = json['title'];
    // itemsNameAr = json['items_name_ar'];
    itemsDesc = json['description'];
    // itemsDescAr = json['items_desc_ar'];
    itemsImage = json['cover_image'];
    // itemsCount = json['items_count'];
    // itemsActive = json['items_active'];
    itemsPrice = json['price'];
    // itemsDiscount = json['items_discount'];
    //  itemsDate = json['items_date'];
    itemsCat = json['category_id'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.favoriteId;
    data['user_id'] = this.favoriteUsersid;
    data['book_id'] = this.favoriteItemsid;
    data['id'] = this.itemsId;
    data['title'] = this.itemsName;
    // data['items_name_ar'] = this.itemsNameAr;
    data['description'] = this.itemsDesc;
    // data['items_desc_ar'] = this.itemsDescAr;
    data['cover_image'] = this.itemsImage;
    data['count'] = this.itemsCount;
    //data['items_active'] = this.itemsActive;
    data['price'] = this.itemsPrice;
    //data['items_discount'] = this.itemsDiscount;
    //data['items_date'] = this.itemsDate;
    data['category_id'] = this.itemsCat;
    data['users_id'] = this.usersId;
    return data;
  }
}