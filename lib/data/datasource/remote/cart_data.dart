import 'package:rayaheen_bookstore/core/class/crud.dart';
import 'package:rayaheen_bookstore/linkapi.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartadd, {"user_id": "${usersid}", "book_id": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String usersid, String itemsid) async {
    var response = await crud
        .postData(AppLink.cartdelete, {"user_id": usersid, "book_id": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(String usersid, int itemsid) async {
    var response = await crud.postData(
        AppLink.cartgetcountitems, {"user_id": usersid, "book_id": "${itemsid}"});
    return response.fold((l) => l, (r) => r);
  }
  viewCart(String usersid) async {
    var response = await crud.postData(AppLink.cartview, {
      "user_id": usersid,
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response =
    await crud.postData(AppLink.checkcoupon, {"couponname": couponname});
    return response.fold((l) => l, (r) => r);
  }
}
