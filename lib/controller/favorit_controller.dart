import 'package:get/get.dart';

import 'package:flutter/material.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/favorite_data.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  Map isFavorite = {};

//  key => id items
//  Value => 1 OR 0

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(int itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    print(myServices.sharedPreferences.getString("id"));
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, "${itemsid}");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج من المفضلة "));
         data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }

  removeFavorite(int itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!, "${itemsid}");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم حذف المنتج من المفضلة "));
         data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
  }
}