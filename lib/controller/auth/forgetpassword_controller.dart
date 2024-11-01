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

  @override
  checkphone()async  {
    if (formstate.currentState!.validate()){
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await checkphoneData.postdata(phone.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          Get.offNamed(AppRoute.resetPassword , arguments: {
            "phone" : phone.text
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

    super.onInit();
  }
  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }




}