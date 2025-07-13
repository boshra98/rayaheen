import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/storefunctions.dart';
import '../../data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController code;  // Controller for country code
  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());

  // @override
  // signUp() async {
  //   if (formstate.currentState!.validate()) {
  //     statusRequest = StatusRequest.loading;
  //     // int intValue = Random().nextInt(10000);
  //     // email.text = username.text + "$intValue@gmail.com";
  //     update();
  //
  //     var response = await signupData.postdata(
  //       username.text,
  //       password.text,
  //       email.text,
  //       "${code.text}${phone.text}".substring(1),
  //     );
  //
  //     print("${code.text}${phone.text}".substring(1));
  //     print("=============================== Controller $response ");
  //     statusRequest = handlingData(response);
  //
  //     if (StatusRequest.success == statusRequest) {
  //       if (response['status'] == "success") {
  //         storeUserData(response['user'], response['id'].toString());
  //         Get.offNamed(AppRoute.successSignUp);
  //       } else {
  //         Get.defaultDialog(
  //             title: "Warning", middleText: "Phone Number Already Exists");
  //         statusRequest = StatusRequest.failure;
  //       }
  //     }
  //
  //     update();
  //   }
  // }



  // @override
  // signUp() async {
  //   if (formstate.currentState!.validate()) {
  //     statusRequest = StatusRequest.loading;
  //     update();
  //
  //     // final String fullPhone = "${code.text}${phone.text}".substring(1);
  //     final String fullPhone = "${code.text.replaceAll('+', '')}${phone.text}";
  //    // final fullPhone = "${controller.code.text.replaceAll('+', '')}${controller.phone.text}";
  //
  //
  //     // ✅ طباعة البيانات المُرسلة بشكل واضح
  //     print("🔐 البيانات المرسلة لإنشاء الحساب:");
  //     print("👤 Username: ${username.text}");
  //     print("📧 Email: ${email.text}");
  //     print("📞 Phone: $fullPhone");
  //     print("🔑 Password: ${password.text}");
  //
  //     // إرسال الطلب
  //     var response = await signupData.postdata(
  //       username.text,
  //       password.text,
  //       email.text,
  //       fullPhone,
  //     );
  //
  //     // ✅ طباعة الرد من السيرفر
  //     print("================= 📥 رد السيرفر =================");
  //     print("Status: $statusRequest");
  //     print("Response: $response");
  //     print("================================================");
  //
  //     statusRequest = handlingData(response);
  //
  //     if (response['status'] == "success") {
  //       print("✅ نجاح في التسجيل، يتم الآن التخزين...");
  //
  //       if (response.containsKey('user') && response['user'] != null && response['id'] != null) {
  //         storeUserData(response['user'], response['id'].toString());
  //         print("✅ تم تخزين بيانات المستخدم بنجاح.");
  //       } else {
  //         print("⚠️ تم التسجيل بنجاح ولكن الرد لا يحتوي على بيانات المستخدم.");
  //       }
  //
  //       Get.offNamed(AppRoute.successSignUp);
  //     }
  //
  //
  //
  //     else {
  //         print("⚠️ فشل في التسجيل: رقم الهاتف مسجل مسبقًا.");
  //         Get.defaultDialog(
  //           title: "Warning",
  //           middleText: "Phone Number Already Exists",
  //         );
  //         statusRequest = StatusRequest.failure;
  //       }
  //     }
  //
  //     update();
  //   }


  @override
  signUp() async {
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

      final String fullPhone = "${code.text.replaceAll('+', '')}${phone.text}";

      print("🔐 البيانات المرسلة لإنشاء الحساب:");
      print("👤 Username: ${username.text}");
      print("📧 Email: ${email.text}");
      print("📞 Phone: $fullPhone");
      print("🔑 Password: ${password.text}");

      var response = await signupData.postdata(
        username.text,
        password.text,
        email.text,
        fullPhone,
      );

      print("================= 📥 رد السيرفر =================");
      print("Response: $response");
      print("================================================");

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          print("✅ نجاح في التسجيل، يتم الآن التخزين...");

          if (response.containsKey('user') && response['user'] != null &&
              response['id'] != null) {
            storeUserData(response['user'], response['id'].toString());
            print("✅ تم تخزين بيانات المستخدم بنجاح.");
          } else {
            print(
                "⚠️ تم التسجيل بنجاح ولكن الرد لا يحتوي على بيانات المستخدم.");
          }

          Get.offNamed(AppRoute.successSignUp);
        } else {
          final message = response['message'] ?? "البريد الإلكتروني أو رقم الهاتف مستخدم مسبقًا.";
          Get.defaultDialog(
            title: "خطأ في التسجيل",
            middleText: message.toString(),
          );
          statusRequest = StatusRequest.failure;
        }
      } else {
        // ✅ هذا هو الجزء الذي كان مفقودًا
        Get.defaultDialog(
          title: "149".tr,
          middleText: "151".tr,
        );
      }
        update();
    }
  }




  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    code = TextEditingController(); // Set default code
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    code.dispose();  // Dispose the code controller
    password.dispose();
    super.dispose();
  }
}