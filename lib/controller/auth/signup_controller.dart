import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
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

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      int intValue = Random().nextInt(10000);
      email.text = username.text + "$intValue@gmail.com";
      update();

      // Use `code.text` as the selected country code for the phone number
      var response = await signupData.postdata(
        username.text,
        password.text,
        email.text,
        "${code.text}${phone.text}".substring(1,12),  // Combine code and phone
      );
      print("${code.text}${phone.text}".substring(1,12));
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.successSignUp);
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Phone Number Already Exists");
          statusRequest = StatusRequest.failure;
        }
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
    code = TextEditingController(text: "+971"); // Set default code
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
