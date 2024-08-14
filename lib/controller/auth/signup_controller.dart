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

// late StatusRequest statusRequest;
// SignupData signupData = SignupData(Get.find());
//List data =[];
  @override
  // signUp() async {
  //   if (formstate.currentState!.validate()) {
  //     statusRequest = StatusRequest.loading;
  //
  //     var response = await signupData.postdata(username.text , password.text ,email.text ,phone.text);
  //
  //     print("=============================== Controller $response ");
  //
  //     statusRequest = handlingData(response);
  //
  //     if (StatusRequest.success == statusRequest){
  //
  //       // Start backend
  //       if (response['status'] == "success") {
  //
  //         data.addAll(response['data']);
  //          Get.offNamed(AppRoute.verifyCodeSignUp);
  //
  //
  //       }else{
  //         Get.defaultDialog(title: "warning" , middleText:"phone nomber or email alredy exist") ;
  //
  //         statusRequest = StatusRequest.failure ;
  //
  //       }
  //       // End
  //     }
  //     update();
  //    // Get.offNamed(AppRoute.verifyCodeSignUp);
  //    // Get.delete<SignUpControllerImp>();
  //   } else {
  //   }
  // }

  signUp() {
    if (formstate.currentState!.validate()) {
      Get.offNamed(AppRoute.verifyCodeSignUp);
    }
    else {
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