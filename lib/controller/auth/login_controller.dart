import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../core/class/crud.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/storefunctions.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login.dart';
import '../../linkapi.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController phone;
  late TextEditingController code;  // Controller for country code

  late TextEditingController password;

  bool isshowpassword = true;

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  // var formstate;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }



  @override
  login() async {
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

      var response = await loginData.postdata(fullPhone , password.text);
      print("=============================== Controller $response ");

      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['message'] == "true") {
          print("🔐 تسجيل الدخول ناجح");

          // حفظ ID و Token
          String userId = response['id'].toString();
          myServices.sharedPreferences.setString("id", userId);
          myServices.sharedPreferences.setBool("guest", false);
          myServices.sharedPreferences.setString("token", response['access_token']);
          myServices.sharedPreferences.setString("step", "2");

          // طلب بيانات المستخدم من السيرفر
          var profileResponse = await Crud().postData(AppLink.getprofile, {
            "id": userId,
          });

// استخدم fold لفك البيانات من Either
          profileResponse.fold(
                (failure) {
              print("🚫 فشل في تحميل بيانات الملف الشخصي: $failure");
            },
                (data) {
              if (data['user'] != null) {
                storeUserData(data['user'], userId);
              } else {
                print("🚫 لم يتم العثور على بيانات المستخدم في الاستجابة!");
              }
            },
          );



          Get.offNamed(AppRoute.homePage);
        }
      } else {
        Get.defaultDialog(title: "ُWarning", middleText: "Phone Or Password Not Correct");
        statusRequest = StatusRequest.failure;
      }

      update();
    }
  }



  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    phone = TextEditingController();
    code = TextEditingController(); // Set default code

    password = TextEditingController();
    super.onInit();

  }

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    code.dispose();  // Dispose the code controller
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}