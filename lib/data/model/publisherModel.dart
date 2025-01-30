class PublisherModel {
  String? publisherName;
  //String? categoriesNamaAr;
  // String? categoriesDatetime;

  PublisherModel(
      {
        this.publisherName,
        //  this.categoriesNamaAr,
        //this.categoriesDatetime
      });

  PublisherModel.fromJson(Map<String, dynamic> json) {
    publisherName = json['name'];
    // categoriesNamaAr = json['categories_nama_ar'];
    //categoriesDatetime = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.publisherName;
    //data['categories_nama_ar'] = this.categoriesNamaAr;

    // data['categories_datetime'] = this.categoriesDatetime;
    return data;
  }
}