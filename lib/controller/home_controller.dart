
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/services/services.dart';

abstract class  HomeController extends GetxController {
  initialData()  ;
  getdata() ;

}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;
 // late PageController pageController;


  /////// HomeData homedata = HomeData(Get.find());

  // List data = [];
  List categories = [];
  // List items = [];

 /////// late StatusRequest statusRequest;

  @override
  initialData() {

    username = myServices.sharedPreferences.getString("username") ;
    id = myServices.sharedPreferences.getString("id") ;
  }

  @override
  void onInit() {
    getdata() ;
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    // statusRequest = StatusRequest.loading;
    // var response = await homedata.getData();
    // print("=============================== Controller $response ");
    // statusRequest = handlingData(response);
    // if (StatusRequest.success == statusRequest) {
    //   if (response['status'] == "success") {
    //     categories.addAll(response['categories']);
    //   } else {
    //     statusRequest = StatusRequest.failure ;
    //   }
    // }
    update();
  }
}