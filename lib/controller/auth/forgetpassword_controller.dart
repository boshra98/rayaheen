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


  @override
  checkphone()async  {
    if (formstate.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await checkphoneData.postdata( "${code.text}${phone.text}".substring(1),"${email.text}");
      print("${code.text}${phone.text}".substring(1),);

      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.verifycode , arguments: {
            "phone" : "${code.text}${phone.text}".substring(1),
            "email" : email.text
          });


        } else {
          Get.defaultDialog(title: "78".tr , middleText: "80".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  goToVerfiyCode() {
    if (formstate.currentState!.validate()) {


      Get.offNamed(AppRoute.resetPassword);
    } else {
      print("Not Valid");
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