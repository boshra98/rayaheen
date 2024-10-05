class OrdersModel {
  int? ordersId;
  int? ordersUsersid;
  //String? ordersAddress;
  String? ordersType;
  // String? ordersPricedelivery;
  // String? ordersPrice;
  String? ordersTotalprice;
  //String? ordersCoupon;
  String? ordersPaymentmethod;
  String? ordersStatus;
  String? ordersDatetime;
  // String? addressId;
  // String? addressUsersid;
  //String? addressName;
  String? addressCity;
  String? addressStreet;
//  String? addressLat;
  //String? addressLong;

  OrdersModel(
  {this.ordersId,
  this.ordersUsersid,
  //   this.ordersAddress,
  this.ordersType,
  //  this.ordersPricedelivery,
  // this.ordersPrice,
  this.ordersTotalprice,
  // this.ordersCoupon,
  this.ordersPaymentmethod,
  this.ordersStatus,
  this.ordersDatetime,
  // this.addressId,
  // this.addressUsersid,
  // this.addressName,
  this.addressCity,
  this.addressStreet,
  //  this.addressLat,
  //  this.addressLong
  }
  );

  OrdersModel.fromJson(Map<String, dynamic> json) {
  ordersId = json['id'];
  ordersUsersid = json['user_id'];
  //ordersAddress = json['orders_address'];
 ordersType = json['orders_type'];
 //  ordersPricedelivery = json['orders_pricedelivery'];
 //  ordersPrice = json['orders_price'];
  ordersTotalprice = json['total'];
  // ordersCoupon = json['orders_coupon'];
  ordersPaymentmethod = json['payment_method'];
  ordersStatus = json['status'];
  ordersDatetime = json['created_at'];
  // addressId = json['address_id'];
  // addressUsersid = json['address_usersid'];
  // addressName = json['address_name'];
  addressCity = json['city'];
  addressStreet = json['street'];
  // addressLat = json['address_lat'];
  // addressLong = json['address_long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.ordersId;
    data['users_id'] = this.ordersUsersid;
    // data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    // data['orders_pricedelivery'] = this.ordersPricedelivery;
    // data['orders_price'] = this.ordersPrice;
    data['total'] = this.ordersTotalprice;
    // data['orders_coupon'] = this.ordersCoupon;
    data['payment_method'] = this.ordersPaymentmethod;
    data['status'] = this.ordersStatus;
    data['created_at'] = this.ordersDatetime;
    // data['address_id'] = this.addressId;
    // data['address_usersid'] = this.addressUsersid;
    // data['address_name'] = this.addressName;
    data['city'] = this.addressCity;
    data['street'] = this.addressStreet;
    // data['address_lat'] = this.addressLat;
    // data['address_long'] = this.addressLong;
    return data;
  }
}