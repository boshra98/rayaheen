import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/auth/login.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController phone;
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

    print("hello");
    //print(response);



    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(phone.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['message'] == "true") {
          print("hhhhhh");
          myServices.sharedPreferences
              .setString("id", response['id']);
          String userid = myServices.sharedPreferences.getString("id")!;
          // data.addAll(response['data']);
          //  myServices.sharedPreferences.setString("token", response['data']['access_token']) ;
          //  myServices.sharedPreferences.setString("username", response['data']['users_name']) ;
          // myServices.sharedPreferences.setString("email", response['data']['users_email']) ;
          // myServices.sharedPreferences.setString("phone", response['data']['users_phone']) ;
          myServices.sharedPreferences.setString("step", "2");
          Get.offNamed(AppRoute.homePage);
        }
      }else {
        print("hhhhho");
        Get.defaultDialog(
            title: "ُWarning", middleText: "Email Or Password Not Correct");
        statusRequest = StatusRequest.failure;
      }

      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
    //   FirebaseMessaging.instance.getToken().then((value) {
    //     print(value);
    //     String? token = value;
    //   });
    //   email = TextEditingController();
    //   password = TextEditingController();
    //super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}