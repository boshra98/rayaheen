import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class ResetPasswordController extends GetxController{
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController{
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController password ;
  late TextEditingController repassword ;


  @override
  resetpassword() {


  }

  @override
  goToSuccessResetPassword() {
    if (formstate.currentState!.validate()) {
      Get.offNamed(AppRoute.successResetPassword);
    } else {
      print("Not Valid");
    }
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();


    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }




}