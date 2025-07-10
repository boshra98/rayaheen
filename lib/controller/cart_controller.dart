import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaheen_bookstore/core/class/crud.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/color.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/cartservices.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cart_data.dart';
import '../data/model/cartmodel.dart';
import '../data/model/couponmodel.dart';

class CartController extends GetxController {
  //late final CartService cartService;
  final CartService cartService = Get.find<CartService>();

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

  var data = <CartModel>[].obs; // ✅ استخدم `RxList` لتحديث الواجهة تلقائيًا

  double priceorders = 0.0;

  int totalcountitems = 0;
  int cartItemCount = 0;
  double total = 0.0;


  add(String itemsid) async {
    if (myServices.sharedPreferences.getString("id") == "guest") {
      Get.snackbar("تسجيل الدخول مطلوب", "الرجاء تسجيل الدخول لإضافة منتجات إلى السلة");
      Future.delayed(Duration(seconds: 1), () {
        Get.toNamed(AppRoute.login);
      });
      return;
    }
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, "${itemsid}" );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {

      // Start backend
      if (response['status'] == "success") {
        cartService.increment();

        // Increment the cart item count
       // update();
        view();
        // ✅ تمرير `itemsid` بشكل صحيح إلى `addToCart()`
       // await cartService.addToCart(int.parse(itemsid));

        // ✅ تحديث السلة مباشرة بعد الإضافة
       // await fetchCartItems();

       // cartItemCount++; // Increment the cart item count

        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى السلة ",style: TextStyle(color: AppColor.secondColor2),
              textAlign: TextAlign.right,
            )
        );
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  goToPageCheckout() {
    if (myServices.sharedPreferences.getString("id") == "guest") {
      Get.snackbar("تنبيه", "الرجاء تسجيل الدخول لمتابعة عملية الشراء");
      Future.delayed(Duration(seconds: 1), () {
        Get.toNamed(AppRoute.login);
      });
      return;
    }

    if (data.isEmpty) return Get.snackbar("تنبيه", "السله فارغه");
    Get.toNamed(AppRoute.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceorders.toString() ,
      "discountcoupon" : discountcoupon.toString()
    });
  }

  // getTotalPrice() {
  //   return (priceorders - priceorders * discountcoupon! / 100);
  // }

  // getTotalPrice() {
  //   if (couponModel != null) {
  //     if (couponModel!.discountType == "percent") {
  //       return priceorders - (priceorders * double.parse(couponModel!.discountValue!) / 100);
  //     } else if (couponModel!.discountType == "fixed") {
  //       return priceorders - double.parse(couponModel!.discountValue!);
  //     }
  //   }
  //   return priceorders;
  // }
  double getTotalPrice() {
    return total > 0 ? total : priceorders;
  }


  delete(String itemsid) async {
    if (myServices.sharedPreferences.getString("id") == "guest") {
      Get.snackbar("تسجيل الدخول مطلوب", "الرجاء تسجيل الدخول لإضافة منتجات إلى السلة");
      Future.delayed(Duration(seconds: 1), () {
        Get.toNamed(AppRoute.login);
      });
      return;
    }
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
       // update();

        view(); // ✅ تحديث السلة مباشرة بعد الإضافة


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

  // checkcoupon() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //
  //   var response = await cartData.checkCoupon(controllercoupon!.text);
  //   print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       Map<String, dynamic> datacoupon = response['data'];
  //       couponModel = CouponModel.fromJson(datacoupon);
  //       discountcoupon = int.parse(couponModel!.couponDiscount!);
  //       couponname = couponModel!.couponName;
  //       couponid = couponModel!.couponId;
  //     } else {
  //       // statusRequest = StatusRequest.failure;
  //       discountcoupon = 0;
  //       couponname = null;
  //       couponid = null;
  //       Get.snackbar("Warning", "Coupon Not Valid") ;
  //     }
  //     // End
  //   }
  //
  //
  //   statusRequest = StatusRequest.success;
  //
  //   update();
  // }

  // ========== مؤقتًا بدل الاتصال الحقيقي ========== //
  // String code = controllercoupon!.text.trim();
  // if (code == "SAVE10") {
  //   discountcoupon = 10;
  //   couponname = code;
  //   couponid = "1"; // أي رقم وهمي
  //   Get.snackbar("نجاح", "تم تطبيق الكوبون");
  // } else {
  //   discountcoupon = 0;
  //   couponname = null;
  //   couponid = null;
  //   Get.snackbar("خطأ", "الكوبون غير صالح");
  // }
  // // =============================================== //



  // checkcoupon() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //
  //   var response = await cartData.checkCoupon(controllercoupon!.text,  priceorders // ← يجب أن تحسب السعر الإجمالي مسبقاً
  //   );
  //   print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['success'] == true) {
  //       Map<String, dynamic> datacoupon = response;
  //       couponModel = CouponModel.fromJson(datacoupon);
  //
  //       // إذا أردت استخدام القيم لاحقًا في التطبيق:
  //       discountcoupon = couponModel!.discountAmount ?? 0;
  //       couponname = couponModel!.couponName;
  //       couponid = couponModel!.couponId;
  //
  //       Get.snackbar("تم الحسم", couponModel!.message ?? "تم تطبيق الحسم بنجاح");
  //     } else {
  //       discountcoupon = 0;
  //       couponname = null;
  //       couponid = null;
  //
  //       Get.snackbar("تحذير", response['message'] ?? "كوبون غير صالح");
  //     }
  //   }
  //
  //   statusRequest = StatusRequest.success;
  //   update();
  // }

  // checkcoupon() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //
  //   var rawResponse = await cartData.checkCoupon(controllercoupon!.text, priceorders);
  //   print("================ Controller $rawResponse");
  //   statusRequest = handlingData(rawResponse);
  //
  //   if (StatusRequest.success == statusRequest) {
  //     CouponResponseModel response = CouponResponseModel.fromJson(rawResponse);
  //
  //     if (response.success) {
  //       couponModel = response.data;
  //       discountcoupon = couponModel!.discountAmount ?? 0;
  //       couponname = couponModel!.couponName;
  //       couponid = couponModel!.couponId;
  //
  //       Get.snackbar("تم الحسم", couponModel!.message ?? "تم تطبيق الكوبون بنجاح");
  //     } else {
  //       discountcoupon = 0;
  //       couponname = null;
  //       couponid = null;
  //
  //       Get.snackbar("تحذير", response.message ?? "كوبون غير صالح");
  //     }
  //   }
  //
  //   statusRequest = StatusRequest.success;
  //   update();
  // }

  // checkcoupon() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //
  //   var rawResponse = await cartData.checkCoupon(controllercoupon!.text, priceorders);
  //   print("================ Controller $rawResponse");
  //   statusRequest = handlingData(rawResponse);
  //
  //   if (StatusRequest.success == statusRequest) {
  //     CouponResponseModel response = CouponResponseModel.fromJson(rawResponse);
  //
  //     if (response.success) {
  //       couponModel = response.data;
  //       discountcoupon = couponModel!.discountAmount ?? 0;
  //       couponname = couponModel!.couponName;
  //       couponid = couponModel!.couponId;
  //
  //       Get.snackbar("تم الحسم", couponModel!.message ?? "تم تطبيق الكوبون بنجاح");
  //     } else {
  //       // ✅ تحقق إن كانت الرسالة بسبب الحد الأدنى
  //       if (rawResponse.containsKey('min_order_amount')) {
  //         Get.snackbar(
  //           "تنبيه",
  //           "${rawResponse['message']} (الحد الأدنى: ${rawResponse['min_order_amount']} درهم)",
  //         );
  //       } else {
  //         Get.snackbar("تحذير", response.message ?? "كوبون غير صالح");
  //       }
  //
  //       discountcoupon = 0;
  //       couponname = null;
  //       couponid = null;
  //     }
  //   }
  //
  //   statusRequest = StatusRequest.success;
  //   update();
  // }

  // checkcoupon() async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   String discountMessage = "";
  //   if (couponModel!.discountType == "percent") {
  //     discountMessage =
  //     "تم تطبيق خصم بنسبة ${couponModel!.discountValue}% على طلبك.";
  //   } else if (couponModel!.discountType == "fixed") {
  //     discountMessage =
  //     "تم تطبيق خصم بقيمة ${couponModel!.discountValue} درهم على طلبك.";
  //   } else {
  //     discountMessage = "تم تطبيق الكوبون بنجاح.";
  //   }
  //
  //   Get.snackbar("✅ تم الحسم", discountMessage);
  //
  //   var rawResponse = await cartData.checkCoupon(controllercoupon!.text, priceorders);
  //   print("================ Controller $rawResponse");
  //   statusRequest = handlingData(rawResponse);
  //
  //   if (StatusRequest.success == statusRequest) {
  //     CouponResponseModel response = CouponResponseModel.fromJson(rawResponse);
  //
  //     if (response.success) {
  //       couponModel = response.data;
  //       discountcoupon = couponModel!.discountAmount ?? 0;
  //       couponname = couponModel!.couponName;
  //       couponid = couponModel!.couponId;
  //
  //       // ✅ حساب السعر بعد الخصم
  //       if (couponModel!.discountType == "percent") {
  //         total = priceorders -
  //             (priceorders * double.parse(couponModel!.discountValue!) / 100);
  //       } else if (couponModel!.discountType == "fixed") {
  //         total = priceorders -
  //             double.parse(couponModel!.discountValue!);
  //       } else {
  //         total = priceorders;
  //       }
  //
  //       Get.snackbar("تم الحسم", couponModel!.message ?? "تم تطبيق الكوبون بنجاح");
  //     } else {
  //       // ✅ تحقق من وجود حد أدنى للطلب
  //       if (rawResponse.containsKey('min_order_amount')) {
  //         Get.snackbar(
  //           "تنبيه",
  //           "${rawResponse['message']} (الحد الأدنى: ${rawResponse['min_order_amount']} درهم)",
  //         );
  //       } else {
  //         Get.snackbar("تحذير", response.message ?? "كوبون غير صالح");
  //       }
  //
  //       // ✅ إعادة التعيين عند الفشل
  //       discountcoupon = 0;
  //       couponname = null;
  //       couponid = null;
  //       total = 0.0;
  //     }
  //   }
  //
  //   statusRequest = StatusRequest.success;
  //   update();
  // }
  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();

    var rawResponse = await cartData.checkCoupon(controllercoupon!.text, priceorders);
    print("================ Controller $rawResponse");
    statusRequest = handlingData(rawResponse);

    if (StatusRequest.success == statusRequest) {
      CouponResponseModel response = CouponResponseModel.fromJson(rawResponse);

      if (response.success) {
        couponModel = response.data;
        discountcoupon = couponModel!.discountAmount ?? 0;
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;

        // ✅ حساب السعر بعد الخصم
        if (couponModel!.discountType == "percent") {
          total = priceorders -
              (priceorders * double.parse(couponModel!.discountValue!) / 100);
        } else if (couponModel!.discountType == "fixed") {
          total = priceorders - double.parse(couponModel!.discountValue!);
        } else {
          total = priceorders;
        }

        // ✅ عرض رسالة الخصم بعد التحقق من نجاح الكوبون
        String discountMessage = "";
        if (couponModel!.discountType == "percent") {
          discountMessage =
          "تم تطبيق خصم بنسبة ${couponModel!.discountValue}% على طلبك.";
        } else if (couponModel!.discountType == "fixed") {
          discountMessage =
          "تم تطبيق خصم بقيمة ${couponModel!.discountValue} درهم على طلبك.";
        } else {
          discountMessage = "تم تطبيق الكوبون بنجاح.";
        }

        Get.snackbar("✅ تم الحسم", discountMessage);

      } else {
        // ✅ تحقق من وجود حد أدنى للطلب
        if (rawResponse.containsKey('min_order_amount')) {
          Get.snackbar(
            "❗ الكوبون غير قابل للتطبيق",
            "يجب أن تكون قيمة الطلب على الأقل ${rawResponse['min_order_amount']} درهم لتفعيل هذا الكوبون.",
          );
        } else {
          Get.snackbar(
            "⚠️ كوبون غير صالح",
            response.message ?? "الرجاء التحقق من رمز الكوبون والمحاولة مرة أخرى.",
          );
        }


        // ✅ إعادة التعيين عند الفشل
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        total = 0.0;
      }
    }

    statusRequest = StatusRequest.success;
    update();
  }

  // void cancelCoupon() {
  //   couponModel = null;
  //   discountcoupon = 0;
  //   couponname = null;
  //   couponid = null;
  //   update(); // لتحديث الواجهة
  // }

  void cancelCoupon() {
    couponModel = null;
    couponname = null;
    couponid = null;
    discountcoupon = 0;
    total = priceorders; // ← رجّع السعر الأساسي

    update(); // ✅ لتحديث الواجهة مباشرة
  }


  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0.0;
    data.clear();
  }

  refreshPage() {
    //resetVarCart();
    view();
    update(); // ✅ إجبار الواجهة على التحديث

  }

  void view() async {
    String? userId = myServices.sharedPreferences.getString("id");

    if (userId == "guest") {
      statusRequest = StatusRequest.none;
      update();
      return;
    }
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.viewCart(userId!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];

          // ✅ Correct way to update RxList
          data.assignAll(dataresponse.map((e) => CartModel.fromJson(e)).toList());

          totalcountitems = dataresponsecountprice['totalcount'];
          cartService.setCount(totalcountitems);

          priceorders = double.parse((dataresponsecountprice['totalprice'] - 0.1).toStringAsFixed(1));
          total= 0.0; // ✅ إعادة تعيين أي خصم سابق عند تحديث السلة

          print(priceorders);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }



  @override
  void onInit() {
    controllercoupon = TextEditingController();
    view();
    //fetchCartItems(); // ✅ تحميل العناصر عند فتح الصفحة
    //cartService.getCartItemCount(); // ✅ تحميل عدد المنتجات في البداية

    //cartData = CartData(cartService); // Pass the CartService instance to CartData
    super.onInit();
  }


  /// ✅ **جلب المنتجات في السلة**
  // Future<void> fetchCartItems() async {
  //   List<CartModel> newData = await cartService.getCartItems();
  //   data.assignAll(newData); // ✅ تحديث القائمة مباشرة
  // }

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
