
import 'dart:io';

import 'package:flutter/services.dart';


//

// Future<bool> alertExitApp() {
//   Get.defaultDialog(
//       title: "تنبيه",
//       titleStyle:const  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
//       middleText: "هل تريد الخروج من التطبيق",
//       actions: [
//         ElevatedButton(
//             style: ButtonStyle(
//                 backgroundColor:
//                 MaterialStateProperty.all(AppColor.primaryColor)),
//             onPressed: () {
//               exit(0);
//             },
//             child:const Text("تاكيد")),
//         ElevatedButton(
//             style: ButtonStyle(
//                 backgroundColor:
//                 MaterialStateProperty.all(AppColor.primaryColor)),
//             onPressed: () {
//               Get.back();
//             },
//             child:const Text("الغاء"))
//       ]);
//   return Future.value(true);
// }

mixin AppCloser {
  void closeApp() {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } else if (Platform.isIOS) {
      exit(0);
    }
  }
}