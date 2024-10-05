import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaheen_bookstore/core/constant/routes.dart';
import '../../view/screen/language.dart';
import '../../view/screen/language.dart';
import '../services/services.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    // Allow access to the root and language change routes
    if (route == '/' || route == AppRoute.language) {
      return null;
    }

    // If the user has completed step 2, redirect to the homepage
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: AppRoute.homePage);
    }

    // If the user has completed step 1, redirect to the login page
    if (myServices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: AppRoute.login);
    }

    // No redirection needed, continue to the intended page
    return null;
  }
}
