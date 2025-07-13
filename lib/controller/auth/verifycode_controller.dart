// import 'package:get/get.dart';
//
// import '../../core/constant/routes.dart';
//
// abstract class VerifyCodeController extends GetxController{
//   checkCode();
//   goToResetPassword();
// }
//
// class VerifyCodeControllerImp extends VerifyCodeController{
//   late String verifycode ;
//
//   @override
//   checkCode() {
//
//   }
//
//   @override
//   goToResetPassword() {
//     Get.offNamed(AppRoute.resetPassword) ;
//
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//
//
//
//
// }


import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../data/datasource/remote/forgetpassword/verifycode.dart';
import '../../linkapi.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String code);
  goToResetPassword();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String phone;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    phone = Get.arguments['phone']; // ← استقبل رقم الهاتف من الصفحة السابقة
    if (phone.isEmpty) {
      Get.defaultDialog(
        title: "خطأ",
        middleText: "رقم الهاتف مفقود، لا يمكن المتابعة.",
      );
    }
    super.onInit();
  }

  // @override
  // checkCode(String code) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   // ✅ اطبع المدخلات قبل الإرسال
  //   print("📤 سيتم إرسال البيانات التالية:");
  //   print("📞 الهاتف: $phone");
  //   print("🔐 الرمز: $code");
  //
  //   try {
  //     var response = await http.post(
  //       Uri.parse(AppLink.verifycode),
  //       body: {
  //         "phone": phone,
  //         "code": code,
  //       },
  //     );
  //     print("🔴 Status: ${response.statusCode}");
  //     print("🔴 Response Body: ${response.body}");
  //
  //     if (response.statusCode == 200) {
  //       final data = json.decode(response.body);
  //       final verifyResponse = VerifyCodeResponseModel.fromJson(data);
  //
  //       if (verifyResponse.status == "success") {
  //         Get.offNamed(AppRoute.resetPassword, arguments: {
  //           "phone": phone,
  //         });
  //       } else {
  //         Get.defaultDialog(title: "خطأ", middleText: verifyResponse.message);
  //         statusRequest = StatusRequest.failure;
  //       }
  //     } else {
  //       Get.defaultDialog(
  //           title: "خطأ", middleText: "فشل الاتصال بالخادم - ${response.statusCode}");
  //       statusRequest = StatusRequest.failure;
  //     }
  //   } catch (e) {
  //     Get.defaultDialog(title: "استثناء", middleText: e.toString());
  //     statusRequest = StatusRequest.failure;
  //   }
  //
  //   update();
  // }

  @override
  checkCode(String code) async {
    statusRequest = StatusRequest.loading;
    update();

    print("📤 سيتم إرسال البيانات التالية:");
    print("📞 الهاتف: $phone");
    print("🔐 الرمز: $code");

    try {
      var response = await http.post(
        Uri.parse(AppLink.verifycode),
        body: {
          "phone": phone,
          "code": code,
        },
      );

      print("🔴 Status: ${response.statusCode}");
      print("🔴 Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final verifyResponse = VerifyCodeResponseModel.fromJson(data);

        if (verifyResponse.status == "success") {
          Get.offNamed(AppRoute.resetPassword, arguments: {
            "phone": phone,
          });
        } else {
          Get.defaultDialog(
            title: "خطأ",
            middleText: verifyResponse.message.isNotEmpty
                ? verifyResponse.message
                : "رمز التحقق غير صحيح أو منتهي الصلاحية.",
          );
          statusRequest = StatusRequest.failure;
        }
      } else if (response.statusCode == 400 || response.statusCode == 500) {
        // ✅ بدل عرض الخطأ التقني، أظهر رسالة مخصصة
        Get.defaultDialog(
          title: "خطأ في التحقق",
          middleText: "رقم الهاتف أو رمز التحقق غير صحيحين. الرجاء المحاولة مرة أخرى.",
        );
        statusRequest = StatusRequest.failure;
      } else {
        // باقي الأخطاء الأخرى (مثل 403، 404..)
        Get.defaultDialog(
          title: "خطأ",
          middleText: "فشل الاتصال بالخادم - ${response.statusCode}",
        );
        statusRequest = StatusRequest.failure;
      }
    } catch (e) {
      Get.defaultDialog(title: "استثناء", middleText: e.toString());
      statusRequest = StatusRequest.failure;
    }

    update();
  }


  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword, arguments: {
      "phone": phone,
    });
  }
}
