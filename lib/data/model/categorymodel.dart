class CategoriesModel {
  int? categoriesId;
  String? categoriesName;
  //String? categoriesNamaAr;
  String? categoriesImage;
 // String? categoriesDatetime;

  CategoriesModel(
      {this.categoriesId,
        this.categoriesName,
      //  this.categoriesNamaAr,
        this.categoriesImage,
        //this.categoriesDatetime
      });

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId =json['id']  ;
    categoriesName = json['name'];
   // categoriesNamaAr = json['categories_nama_ar'];
    categoriesImage = json['cover_image'];
    //categoriesDatetime = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.categoriesId ;
    data['name'] = this.categoriesName;
    //data['categories_nama_ar'] = this.categoriesNamaAr;
    data['cover_image'] = this.categoriesImage;
   // data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}