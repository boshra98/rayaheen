// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../core/class/statusrequest.dart';
// import '../../core/constant/routes.dart';
// import '../../core/functions/handlingdatacontroller.dart';
// import '../../data/datasource/remote/auth/resetpassword.dart';
//
// abstract class ResetPasswordController extends GetxController{
//   resetpassword();
//   goToSuccessResetPassword();
// }
//
// class ResetPasswordControllerImp extends ResetPasswordController{
//   GlobalKey<FormState> formstate = GlobalKey<FormState>();
//
//   late TextEditingController password ;
//   late TextEditingController repassword ;
//
//   ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
//
//   StatusRequest statusRequest = StatusRequest.none ;
//
//
//
//   String? phone;
//
//   @override
//   resetpassword() {
//
//
//   }
//
//   // @override
//   // goToSuccessResetPassword() async {
//   //
//   //
//   //
//   //   if (formstate.currentState!.validate()) {
//   //     statusRequest = StatusRequest.loading;
//   //     update();
//   //     var response = await resetPasswordData.postdata(phone!, password.text);
//   //     print("=============================== Controller $response ");
//   //     statusRequest = handlingData(response);
//   //     if (StatusRequest.success == statusRequest) {
//   //       if (response['status'] == "success") {
//   //         // data.addAll(response['data']);
//   //         Get.offNamed(AppRoute.successResetPassword);
//   //       } else {
//   //         Get.defaultDialog(
//   //             title: "78".tr, middleText: "79".tr);
//   //         statusRequest = StatusRequest.failure;
//   //       }
//   //     }
//   //     update();
//   //   } else {
//   //     print("Not Valid");
//   //   }
//   // }
//   @override
//   goToSuccessResetPassword() async {
//     if (formstate.currentState!.validate()) {
//       if (password.text != repassword.text) {
//         Get.defaultDialog(
//           title: "خطأ",
//           middleText: "كلمتا المرور غير متطابقتين",
//         );
//         return;
//       }
//
//       statusRequest = StatusRequest.loading;
//       update();
//
//       var response = await resetPasswordData.postdata(phone!, password.text);
//       print("=============================== Controller $response ");
//       statusRequest = handlingData(response);
//
//       if (StatusRequest.success == statusRequest) {
//         if (response['status'] == "success") {
//           Get.offNamed(AppRoute.successResetPassword);
//         } else {
//           Get.defaultDialog(title: "78".tr, middleText: "79".tr);
//           statusRequest = StatusRequest.failure;
//         }
//       }
//
//       update();
//     } else {
//       print("Not Valid");
//     }
//   }
//
//
//   @override
//   void onInit() {
//     phone = Get.arguments['phone'];
//     password = TextEditingController();
//     repassword = TextEditingController();
//     super.onInit();
//   }
//   @override
//   void dispose() {
//     password.dispose();
//     repassword.dispose();
//
//     super.dispose();
//   }
//
//
//
//
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/auth/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController confirmPassword;

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  String? phone;

  @override
  void onInit() {
    phone = Get.arguments['phone'];
    password = TextEditingController();
    confirmPassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  resetpassword() {
    // لم تستخدم بعد
  }

  @override
  goToSuccessResetPassword() async {
    if (formstate.currentState!.validate()) {
      if (password.text != confirmPassword.text) {
        Get.defaultDialog(
          title: "خطأ",
          middleText: "كلمتا المرور غير متطابقتين",
        );
        return;
      }

      statusRequest = StatusRequest.loading;
      update();

      var response = await resetPasswordData.postdata(phone!, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(
            title: "78".tr,
            middleText: "79".tr,
          );
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    } else {
      print("Not Valid");
    }
  }
}
