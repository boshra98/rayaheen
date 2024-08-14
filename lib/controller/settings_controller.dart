import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/services/services.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();

  logout() {
    String userid = myServices.sharedPreferences.getString("id")!;
    //FirebaseMessaging.instance.unsubscribeFromTopic("users");
   // FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
