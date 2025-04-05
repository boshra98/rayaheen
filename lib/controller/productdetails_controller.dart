import 'package:rayaheen_bookstore/core/class/statusrequest.dart';
import 'package:rayaheen_bookstore/core/functions/handlingdatacontroller.dart';
import 'package:rayaheen_bookstore/core/services/services.dart';
import 'package:rayaheen_bookstore/data/datasource/remote/cart_data.dart';
import 'package:rayaheen_bookstore/data/model/itemsmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/color.dart';
import '../core/constant/routes.dart';
import '../core/services/cartservices.dart';
import '../data/model/cartmodel.dart';
import 'cart_controller.dart';

abstract class ProductDetailsController extends GetxController {}
late ScrollController scrollController;
// @override
// void onInit() {
//   scrollController = ScrollController();
//   super.onInit();
//
// }

// @override
// void onClose() {
//   scrollController.dispose();
//   super.onClose();
// }


class ProductDetailsControllerImp extends ProductDetailsController {
  // CartController cartController = Get.put(CartController());
  final CartService cartService = Get.find(); // Get the CartService instance

  late ItemsModel itemsModel;
  // late ScrollController scrollController;

  PageController pageController = PageController();

  CartData cartData = CartData(Get.find());
  var data = <CartModel>[].obs; // ✅ استخدم `RxList` لتحديث الواجهة تلقائيًا

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();
  ScrollController scrollController = ScrollController();


  int countitems = 1;

  // intialData() async {
  //   statusRequest = StatusRequest.loading;
  //   itemsModel = Get.arguments['itemsmodel'];
  //   countitems = await getCountItems(itemsModel.itemsId! );
  //   statusRequest = StatusRequest.success;
  //   update();
  // }
  Future<void> intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems = await getCountItems(itemsModel.itemsId!);
    statusRequest = StatusRequest.success;
    update();
  }


  // getCountItems(int itemsid) async {
  //   statusRequest = StatusRequest.loading;
  //   var response = await cartData.getCountCart(
  //       myServices.sharedPreferences.getString("id")!, itemsid);
  //   print("=============================== Controller getCountItems  $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       int countitems = 0;
  //       countitems = response['data'];
  //       print("==================================");
  //       print("$countitems");
  //
  //       return countitems;
  //       // data.addAll(response['data']);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //     // End
  //   }
  // }

  Future<int> getCountItems(int itemsid) async {
    String userId = myServices.sharedPreferences.getString("id") ?? "";

    if (userId == "guest") {
      return 0; // Guest has no cart, so 0 is safe
    }

    try {
      var response = await cartData.getCountCart(userId, itemsid);
      if (response['status'] == "success" && response['data'] != null) {
        return response['data'];
      }
    } catch (e) {
      print("Error in getCountItems: $e");
    }

    return 0;
  }


  // addItems(int itemsid) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   print(countitems);
  //   var response = await cartData.addCart(
  //       myServices.sharedPreferences.getString("id")! , "${itemsid}");
  //   print("=============================== Controller addItems $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     if (response['status'] == "success") {
  //       Get.rawSnackbar(
  //           titleText: const Text(
  //             textAlign: TextAlign.right,
  //               "اشعار",
  //               style: TextStyle(
  //                 color: AppColor.secondColor2, // Custom title color
  //                 fontWeight: FontWeight.bold, // You can add more styling like bold
  //                 fontSize: 16, // Custom font size
  //               ),),
  //           messageText: const Text("تم اضافة المنتج الى السلة ",style:TextStyle(color:AppColor.secondColor2,),textAlign: TextAlign.right, // Aligning description to the left
  //           ));
  //       // data.addAll(response['data']);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //     // End
  //   }
  //   update();
  // }
  addItems(int itemsid) async {
    if (myServices.sharedPreferences.getString("id") == "guest") {
      Get.snackbar("تنبيه", "يرجى تسجيل الدخول لإضافة المنتجات");
      Future.delayed(Duration(seconds: 1), () {
        Get.toNamed(AppRoute.login);
      });
      return;
    }


    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.addCart(
      myServices.sharedPreferences.getString("id")!,
      "$itemsid",
    );

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          titleText: const Text(
            "إشعار",
            style: TextStyle(
              color: AppColor.secondColor2,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.right,
          ),
          messageText: const Text(
            "تم إضافة المنتج إلى السلة",
            style: TextStyle(color: AppColor.secondColor2),
            textAlign: TextAlign.right,
          ),
        );// ✅ تحديث `CartController` بعد الإضافة
        if (Get.isRegistered<CartController>()) {
          Get.find<CartController>().view(); // تحديث بيانات السلة فورًا
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteitems(int itemsid) async {
    if (myServices.sharedPreferences.getString("id") == "guest") {
      Get.snackbar("تنبيه", "يرجى تسجيل الدخول لإضافة المنتجات");
      Future.delayed(Duration(seconds: 1), () {
        Get.toNamed(AppRoute.login);
      });
      return;
    }

    statusRequest = StatusRequest.loading;
    update();
// if(getCountItems(itemsid)>1)
    {var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, "${itemsid}");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة المنتج من السلة ")
        );
        // data.addAll(response['data']);
      } // ✅ تحديث `CartController` بعد الحذف
      if (Get.isRegistered<CartController>()) {
        Get.find<CartController>().view(); // تحديث بيانات السلة فورًا
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    }
    update();
  }
  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  add() {
    addItems(itemsModel.itemsId! );
    countitems++;
    cartService.increment(); // Increment the cart item count
    if (Get.isRegistered<CartController>()) {
      Get.find<CartController>().view(); // ✅ تحديث السلة فورًا بعد الإضافة
    }

    update();
  }

  remove() {
    if (countitems > 0) {
      deleteitems(itemsModel.itemsId! );
      countitems--;
      cartService.decrement(); // Decrement the cart item count
      if (Get.isRegistered<CartController>()) {
        Get.find<CartController>().view(); // ✅ تحديث السلة فورًا بعد الحذف
      }
      update();
    }
  }

  @override
  void onInit() {
    intialData();
    scrollController = ScrollController();

    super.onInit();

  }


  @override
 void onClose() {
  scrollController.dispose();
  super.onClose();
}


}
