import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SignUpController extends GetxController{
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;

  late TextEditingController email;

  late TextEditingController phone;
  late TextEditingController password;


  @override
  signUp() {
    if (formstate.currentState!.validate()) {
      Get.offNamed(AppRoute.verifyCodeSignUp);
      Get.delete<SignUpControllerImp>();
    } else {
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
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }


}