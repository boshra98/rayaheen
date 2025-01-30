import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaheen_bookstore/core/class/crud.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/cartservices.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cart_data.dart';
import '../data/model/cartmodel.dart';
import '../data/model/couponmodel.dart';

class CartController extends GetxController {
  late final CartService cartService;
  //late final CartData cartData;

  TextEditingController? controllercoupon;

  // CartController(this.cartService)
  //     : cartData = CartData(cartService as Crud); // Pass the service to CartData

  CartData cartData = CartData(Get.find());
  int? discountcoupon = 0;

  String? couponname;

  String? couponid;

  late StatusRequest statusRequest;

  CouponModel? couponModel;

  MyServices myServices = Get.find();

  List<CartModel> data = [];

  double priceorders = 0.0;

  int totalcountitems = 0;
  int cartItemCount = 0;


  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, "${itemsid}" );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {

      // Start backend
      if (response['status'] == "success") {
        cartService.increment(); // Increment the cart item count

       // cartItemCount++; // Increment the cart item count

        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goToPageCheckout() {
    if (data.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceorders.toString() ,
      "discountcoupon" : discountcoupon.toString()
    });
  }

  getTotalPrice() {
    return (priceorders - priceorders * discountcoupon! / 100);
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, "${itemsid}");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        // if (cartItemCount > 0) {
        //   cartItemCount--; // Decrement the cart item count
        // }
        cartService.decrement(); // Decrement the cart item count

        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة المنتج من السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.checkCoupon(controllercoupon!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount!);
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        // statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("Warning", "Coupon Not Valid") ;
      }
      // End
    }
    update();
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = (dataresponsecountprice['totalcount']);
          // Initialize the cart item count
      //    cartItemCount = totalcountitems;
          cartService.setCount(totalcountitems); // Sync cart item count on load


          priceorders = (dataresponsecountprice['totalprice'])-0.1;
          priceorders = double.parse(priceorders.toStringAsFixed(1));

          print(priceorders);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    cartService = Get.find<CartService>();
    cartData = CartData(cartService); // Pass the CartService instance to CartData
    super.onInit();
  }
}

// class CartController extends GetxController {
//   final RxList<CartModel> data = <CartModel>[].obs; // Use RxList for reactivity
//   final RxInt cartItemCount = 0.obs; // Reactive cart item count
//   final RxDouble priceOrders = 0.0.obs;
//   final RxInt totalItemCount = 0.obs;
//   final RxInt discountCoupon = 0.obs;
//
//   TextEditingController? controllercoupon;
//
//   CartData cartData = CartData(Get.find());
//   MyServices myServices = Get.find();
//
//   String? couponName;
//   String? couponId;
//
//   late StatusRequest statusRequest;
//
//   @override
//   void onInit() {
//     controllercoupon = TextEditingController();
//     view();
//     super.onInit();
//   }
//
//   Future<void> add(String itemsId) async {
//     var response = await cartData.addCart(
//         myServices.sharedPreferences.getString("id")!, itemsId);
//     if (response['status'] == 'success') {
//       cartItemCount.value++;
//       Get.rawSnackbar(
//         title: "Notification",
//         message: "Product added to cart!",
//       );
//       view(); // Refresh the data
//     }
//   }
//
//   Future<void> delete(String itemsId) async {
//     var response = await cartData.deleteCart(
//         myServices.sharedPreferences.getString("id")!, itemsId);
//     if (response['status'] == 'success') {
//       if (cartItemCount.value > 0) {
//         cartItemCount.value--;
//       }
//       Get.rawSnackbar(
//         title: "Notification",
//         message: "Product removed from cart!",
//       );
//       view();
//       // saveCartToStorage(); // Save state to local storage
// // Refresh the data
//     }
//   }
//
//   void view() async {
//     statusRequest = StatusRequest.loading;
//     var response =
//     await cartData.viewCart(myServices.sharedPreferences.getString("id")!);
//     if (response['status'] == 'success') {
//       List dataResponse = response['datacart']['data'];
//       Map dataResponseCountPrice = response['countprice'];
//       data.assignAll(dataResponse.map((e) => CartModel.fromJson(e)).toList()); // Use assignAll
//       totalItemCount.value = dataResponseCountPrice['totalcount'];
//       priceOrders.value =
//           double.parse(dataResponseCountPrice['totalprice'].toString());
//       cartItemCount.value = totalItemCount.value;
//     }
//   }
//
//   double getTotalPrice() {
//     return (priceOrders.value - (priceOrders.value * discountCoupon.value / 100));
//   }
//   goToPageCheckout() {
//     // if (data.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
//     // Get.toNamed(AppRoute.checkout, arguments: {
//     //   "couponid": couponid ?? "0",
//     //   "priceorder": priceorders.toString() ,
//     //   "discountcoupon" : discountcoupon.toString()
//     // });
//   }
// }
