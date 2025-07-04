
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/address_data.dart';
import '../data/datasource/remote/checkout_date.dart';
import '../data/model/addressmodel.dart';
import 'package:url_launcher/url_launcher.dart';

import 'cart_controller.dart';




abstract class CheckoutController  extends GetxController{
  checkout();
}
class CheckoutControllerImp extends CheckoutController {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController Imara;

  late TextEditingController mantica;

  late TextEditingController sharae;
  late TextEditingController phone;


  // late String couponid;
  // late String coupondiscount;
  // late String priceorders;

  //AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;

 // String? deliveryAddress;
  //String addressid = "0";

  //List<AddressModel> dataaddress = [];


  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }
  PaymentMethod() {
    return paymentMethod;
  }
  // chooseDeliveryAddress(String val) {
  //   deliveryAddress = val;
  //   update();
  // }

  // chooseShippingAddress(String val) {
  //   addressid = val;
  //   update();
  // }

  // getShippingAddress() async {
  //   statusRequest = StatusRequest.loading;
  //
  //   // var response = await addressData
  //   //     .getData(myServices.sharedPreferences.getString("id")!);
  //
  // //  print("=============================== Controller $response ");
  //
  //   //statusRequest = handlingData(response);
  //
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     //if (response['status'] == "success") {
  //      // List listdata = response['data'];
  //      // dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
  //    // } else {
  //       statusRequest = StatusRequest.success;
  //     }
  //     // End
  //   }


    //update();


  // @override
  // checkout() async {
  //   update();
  //   if (PaymentMethod() == null) {
  //     return Get.snackbar("تنبيه", "اختر وسيلة الدفع أولاً ");
  //   }
  //
  //   if (formstate.currentState!.validate()) {
  //     statusRequest = StatusRequest.loading;
  //     update();
  //
  //     var response = await checkoutData.postdata(
  //         myServices.sharedPreferences.getString("id")!,
  //         Imara.text, sharae.text, mantica.text, paymentMethod!, phone.text, totalToSend,
  //     );
  //
  //     print("=============================== Controller $response ");
  //     statusRequest = handlingData(response);
  //
  //     if (StatusRequest.success == statusRequest) {
  //       if (response['status'] == "success") {
  //         Get.snackbar("32".tr, "90".tr);
  //
  //         // استدعاء دالة إرسال رسالة WhatsApp
  //         sendWhatsAppMessage();
  //
  //         Get.offAllNamed(AppRoute.homePage);
  //       } else {
  //         Get.defaultDialog(title: "78".tr, middleText: "79".tr);
  //         statusRequest = StatusRequest.failure;
  //       }
  //     }
  //     update();
  //   }
  // }

  @override
  checkout() async {
    update();

    if (PaymentMethod() == null) {
      return Get.snackbar("تنبيه", "اختر وسيلة الدفع أولاً ");
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      final cartController = Get.find<CartController>();

      // ✅ نحصل على السعر بعد الحسم إن وُجد، وإلا نستخدم السعر الأصلي
      double total = cartController.total > 0
          ? cartController.total
          : cartController.priceorders;

      var response = await checkoutData.postdata(
        myServices.sharedPreferences.getString("id")!,
        Imara.text,
        sharae.text,
        mantica.text,
        paymentMethod!,
        phone.text,
        total, // ✅ السعر النهائي بعد الخصم
      );

      print("=============================== Controller $response ");
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.snackbar("32".tr, "90".tr);

          // استدعاء دالة إرسال رسالة WhatsApp
          sendWhatsAppMessage();

          Get.offAllNamed(AppRoute.homePage);
        } else {
          Get.defaultDialog(title: "78".tr, middleText: "79".tr);
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    }
  }


  void sendWhatsAppMessage() async {
    final cartController = Get.find<CartController>();
    double totalprice = cartController.getTotalPrice();

    String adminPhone = "+971528816100"; // ضع هنا رقم مدير المتجر
    String message = Uri.encodeFull("🚀 طلب جديد تم بنجاح!\nرقم الهاتف: ${phone.text}\nالعنوان: ${Imara.text}, ${sharae.text}, ${mantica.text}\nطريقة الدفع: $paymentMethod السعر الكلي: \n${totalprice.toStringAsFixed(2)} درهم");
    String url = "https://wa.me/$adminPhone?text=$message";

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Get.snackbar("خطأ", "لا يمكن فتح WhatsApp");
    }
  }



  @override
  void onInit() {
    Imara=TextEditingController();
    mantica=TextEditingController();
    sharae=TextEditingController();
    phone=TextEditingController();
    super.onInit();


    // couponid = Get.arguments['couponid'];
    // priceorders = Get.arguments['priceorder'];
    // coupondiscount = Get.arguments['discountcoupon'].toString();
    //
    // getShippingAddress();
    // super.onInit();


  }
}
