import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/checkephone.dart';
import '../../data/datasource/remote/auth/resetpassword.dart';

abstract class ForgetPasswordController extends GetxController{
  checkphone();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController{
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  CheckphoneData checkphoneData  = CheckphoneData(Get.find()) ;


  StatusRequest statusRequest  = StatusRequest.none ;
  late TextEditingController phone ;
  late TextEditingController code;  // Controller for country code
  late TextEditingController email ;


  // @override
  // checkphone()async  {
  //   if (formstate.currentState!.validate()){
  //     statusRequest = StatusRequest.loading;
  //     update() ;
  //
  //     if (code.text.isEmpty) {
  //       Get.snackbar(
  //         "رمز الدولة مطلوب",
  //         "يرجى اختيار رمز الدولة قبل المتابعة.",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.orange.shade100,
  //         colorText: Colors.black,
  //       );
  //       return;
  //     }
  //     final fullPhone = "${code.text.replaceAll('+', '')}${phone.text}";
  //
  //     print("📞 الهاتف: $fullPhone");
  //
  //     var response = await checkphoneData.postdata(
  //       fullPhone,
  //       email.text,
  //     );
  //
  //     //var response = await checkphoneData.postdata( "${code.text}${phone.text}".substring(1),"${email.text}");
  //     //print("${code.text}${phone.text}".substring(1),);
  //
  //     print("=============================== Controller $response ");
  //     statusRequest = handlingData(response);
  //     if (StatusRequest.success == statusRequest) {
  //       if (response['status'] == "success") {
  //         // data.addAll(response['data']);
  //         Get.offNamed(AppRoute.verifycode , arguments: {
  //           "phone" :fullPhone ,
  //           "email" : email.text
  //         });
  //
  //
  //       }
  //       else {
  //         // 👇 التعديل هنا بدلاً من Get.defaultDialog السابق
  //         final bool emailValid = email.text.contains("@") && email.text.contains(".");
  //         final bool phoneValid = phone.text.length >= 6;
  //
  //         String errorMessage = "حدث خطأ أثناء التحقق.";
  //
  //         if (!emailValid && !phoneValid) {
  //           errorMessage = "الرجاء إدخال بريد إلكتروني ورقم هاتف صحيحين.";
  //         } else if (!emailValid) {
  //           errorMessage = "البريد الإلكتروني غير صحيح أو غير مسجل.";
  //         } else if (!phoneValid) {
  //           errorMessage = "رقم الهاتف غير صحيح أو غير مسجل.";
  //         } else {
  //           errorMessage = "لم يتم العثور على البيانات. تأكد من صحة الهاتف أو البريد.";
  //         }
  //
  //         Get.defaultDialog(
  //           title: "خطأ في التحقق",
  //           middleText: errorMessage,
  //           textConfirm: "موافق",
  //           confirmTextColor: Colors.white,
  //           buttonColor: Colors.red,
  //           onConfirm: () => Get.back(),
  //         );
  //
  //         statusRequest = StatusRequest.failure;
  //       }
  //     }
  //     update();
  //   }
  // }
  @override
  checkphone() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      if (code.text.isEmpty) {
        Get.snackbar(
          "رمز الدولة مطلوب",
          "يرجى اختيار رمز الدولة قبل المتابعة.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange.shade100,
          colorText: Colors.black,
        );
        return;
      }

      final fullPhone = "${code.text.replaceAll('+', '')}${phone.text}";
      print("📞 الهاتف: $fullPhone");

      var response = await checkphoneData.postdata(
        fullPhone,
        email.text,
      );

      print("=============================== Controller $response ");
      statusRequest = handlingData(response);

      // ✅ التحقق من فشل الاتصال بالسيرفر أو بيانات غير صحيحة
      if (statusRequest == StatusRequest.serverfailure) {
        Get.defaultDialog(
          title: "149".tr,
          middleText: "150".tr,
          textConfirm: "86".tr,
          confirmTextColor: Colors.white,
          buttonColor: Colors.red,
          onConfirm: () => Get.back(),
        );
        update();
        return;
      }

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.verifycode, arguments: {
            "phone": fullPhone,
            "email": email.text,
          });
        } else {
          // ✅ عرض رسالة مخصصة إذا لم يتم العثور على البيانات رغم نجاح الاستجابة
          Get.defaultDialog(
            title: "فشل التحقق",
            middleText: "لم يتم العثور على البيانات. تأكد من صحة رقم الهاتف أو البريد الإلكتروني.",
            textConfirm: "موافق",
            confirmTextColor: Colors.white,
            buttonColor: Colors.red,
            onConfirm: () => Get.back(),
          );
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    }
  }


  // @override
  // checkphone() async {
  //   if (formstate.currentState!.validate()) {
  //     statusRequest = StatusRequest.loading;
  //     update();
  //
  //     if (code.text.isEmpty) {
  //       Get.snackbar(
  //         "رمز الدولة مطلوب",
  //         "يرجى اختيار رمز الدولة قبل المتابعة.",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.orange.shade100,
  //         colorText: Colors.black,
  //       );
  //       return;
  //     }
  //
  //     final fullPhone = "${code.text.replaceAll('+', '')}${phone.text}";
  //     print("📞 الهاتف: $fullPhone");
  //
  //     var response = await checkphoneData.postdata(fullPhone, email.text);
  //     print("=============================== Controller $response ");
  //     statusRequest = handlingData(response);
  //
  //     if (StatusRequest.success == statusRequest) {
  //       if (response['status'] == "success") {
  //         Get.offNamed(AppRoute.verifycode, arguments: {
  //           "phone": fullPhone,
  //           "email": email.text,
  //         });
  //       } else {
  //         // استخدم رسالة الخطأ من السيرفر إن توفرت
  //         final serverMessage = response['message']?.toString();
  //
  //         String errorMessage = "حدث خطأ أثناء التحقق.";
  //         if (serverMessage != null && serverMessage.isNotEmpty) {
  //           errorMessage = serverMessage;
  //         }
  //
  //         Get.defaultDialog(
  //           title: "خطأ في التحقق",
  //           middleText: errorMessage,
  //           textConfirm: "موافق",
  //           confirmTextColor: Colors.white,
  //           buttonColor: Colors.red,
  //           onConfirm: () => Get.back(),
  //         );
  //
  //         statusRequest = StatusRequest.failure;
  //       }
  //     }
  //
  //     update();
  //   }
  // }


  // @override
  // goToVerfiyCode() {
  //   if (formstate.currentState!.validate()) {
  //     // ✅ تحقق إضافي من صحة البريد والهاتف (بشكل بسيط)
  //     if (!GetUtils.isEmail(email.text)) {
  //       Get.snackbar(
  //         "بريد إلكتروني غير صالح",
  //         "يرجى إدخال بريد إلكتروني صحيح.",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.orange.shade100,
  //         colorText: Colors.black,
  //       );
  //       return;
  //     }
  //
  //     if (phone.text.length < 7 || phone.text.length > 15) {
  //       Get.snackbar(
  //         "رقم هاتف غير صالح",
  //         "يرجى إدخال رقم هاتف صالح مكون من 7 إلى 15 رقمًا.",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.orange.shade100,
  //         colorText: Colors.black,
  //       );
  //       return;
  //     }
  //
  //     // ✅ إذا تم التحقق من كل شيء، انتقل لصفحة الرمز
  //     Get.offNamed(AppRoute.resetPassword);
  //   } else {
  //     print("❌ البيانات غير صالحة");
  //     Get.snackbar(
  //       "خطأ في البيانات",
  //       "يرجى التأكد من إدخال البريد الإلكتروني ورقم الهاتف بشكل صحيح.",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.orange.shade100,
  //       colorText: Colors.black,
  //     );
  //   }
  // }

  @override
  goToVerfiyCode() {
    if (formstate.currentState!.validate()) {
      if (!GetUtils.isEmail(email.text)) {
        Get.snackbar(
          "بريد إلكتروني غير صالح",
          "يرجى إدخال بريد إلكتروني صحيح.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange.shade100,
          colorText: Colors.black,
        );
        return;
      }

      if (phone.text.length < 7 || phone.text.length > 15) {
        Get.snackbar(
          "رقم هاتف غير صالح",
          "يرجى إدخال رقم هاتف صالح مكون من 7 إلى 15 رقمًا.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange.shade100,
          colorText: Colors.black,
        );
        return;
      }

      checkphone(); // ✅ استدعِ التحقق الحقيقي
    } else {
      Get.snackbar(
        "خطأ في البيانات",
        "يرجى التأكد من إدخال البريد الإلكتروني ورقم الهاتف بشكل صحيح.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange.shade100,
        colorText: Colors.black,
      );
    }
  }



  @override
  void onInit() {
    phone = TextEditingController();
   // code = TextEditingController(text: "+971"); // Set default code
    code = TextEditingController(); // ✅

    email=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    phone.dispose();
    code.dispose();  // Dispose the code controller
email.dispose();
    super.dispose();
  }




}