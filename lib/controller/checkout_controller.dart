
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
    print("✅ وسيلة الدفع تم اختيارها: $paymentMethod");
    print("🎯 Payment method set in controller instance: ${this.hashCode}");

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

  // @override
  // checkout() async {
  //   update();
  //
  //   if (PaymentMethod() == null) {
  //     return Get.snackbar("تنبيه", "اختر وسيلة الدفع أولاً ");
  //   }
  //
  //   if (formstate.currentState!.validate()) {
  //     statusRequest = StatusRequest.loading;
  //     update();
  //
  //     final cartController = Get.find<CartController>();
  //
  //     // ✅ نحصل على السعر بعد الحسم إن وُجد، وإلا نستخدم السعر الأصلي
  //     double total = cartController.total > 0
  //         ? cartController.total
  //         : cartController.priceorders;
  //
  //     var response = await checkoutData.postdata(
  //       myServices.sharedPreferences.getString("id")!,
  //       Imara.text,
  //       sharae.text,
  //       mantica.text,
  //       paymentMethod!,
  //       phone.text,
  //       total, // ✅ السعر النهائي بعد الخصم
  //     );
  //     print("🚀 Payment method to be sent: $paymentMethod");
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
  //
  //     update();
  //   }
  // }
  @override
  checkout() async {
    update();

    print("🛠️ بدء عملية الشيك آوت");
    print("📦 paymentMethod الحالي: $paymentMethod");
    print("🧾 Checkout called from controller instance: ${this.hashCode}");

    if (PaymentMethod() == null) {
      print("❌ لم يتم اختيار وسيلة الدفع.");
      return Get.snackbar("تنبيه", "اختر وسيلة الدفع أولاً ");
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      final cartController = Get.find<CartController>();

      double total = cartController.total > 0
          ? cartController.total
          : cartController.priceorders;

      print("🧾 السعر النهائي المُرسل: $total");
      print("📞 رقم الهاتف: ${phone.text}");
      print("📍 العنوان: ${Imara.text}, ${sharae.text}, ${mantica.text}");
      print("💰 وسيلة الدفع المُرسلة: $paymentMethod");

      var response = await checkoutData.postdata(
        myServices.sharedPreferences.getString("id")!,
        Imara.text,
        sharae.text,
        mantica.text,
        paymentMethod!,
        phone.text,
        total,
      );

      print("📤 تم إرسال الطلب إلى السيرفر...");
      print("=============================== Controller Response:");
      print(response);

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          print("✅ الطلب تم بنجاح.");
          Get.snackbar("32".tr, "90".tr);

          sendWhatsAppMessage();

          Get.offAllNamed(AppRoute.homePage);
        } else {
          print("❌ فشل في تنفيذ الطلب من السيرفر.");
          Get.defaultDialog(title: "78".tr, middleText: "79".tr);
          statusRequest = StatusRequest.failure;
        }
      } else {
        print("❌ حدث خطأ في معالجة الطلب.");
      }

      update();
    } else {
      print("❌ النموذج غير صالح (formstate.validate = false)");
    }
  }


  // void sendWhatsAppMessage() async {
  //   final cartController = Get.find<CartController>();
  //   double totalprice = cartController.getTotalPrice();
  //
  //   String adminPhone = "+971528816100"; // ضع هنا رقم مدير المتجر
  //   //
  //   //
  //   //
  //    String message = Uri.encodeFull("🚀 طلب جديد تم بنجاح!\nرقم الهاتف: ${phone.text}\nالعنوان: ${Imara.text}, ${sharae.text}, ${mantica.text}\nطريقة الدفع: $paymentMethod السعر الكلي: \n${totalprice.toStringAsFixed(2)} درهم");
  //
  //
  //
  //   String url = "https://wa.me/$adminPhone?text=$message";
  //
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     Get.snackbar("خطأ", "لا يمكن فتح WhatsApp");
  //   }
  // }

  void sendWhatsAppMessage() async {
    final cartController = Get.find<CartController>();
    double totalprice = cartController.getTotalPrice();

    String adminPhone = "+971528816100"; // رقم مدير المتجر

    // 🟢 تحويل كود الدفع إلى نص
    String paymentMethodText = "غير محدد";
    if (paymentMethod == '0') {
      paymentMethodText = "كاش";
    } else if (paymentMethod == '1') {
      paymentMethodText = "تحويل";
    }

    // 🟢 إنشاء الرسالة مع النص الصحيح
    String message = Uri.encodeFull(
        "🚀 طلب جديد تم بنجاح!\n"
            "رقم الهاتف: ${phone.text}\n"
            "العنوان: ${Imara.text}, ${sharae.text}, ${mantica.text}\n"
            "طريقة الدفع: $paymentMethodText\n"
            "السعر الكلي: ${totalprice.toStringAsFixed(2)} درهم"
    );

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
