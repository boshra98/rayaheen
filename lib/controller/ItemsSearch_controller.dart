import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/datasource/remote/home_data.dart';
import '../data/model/itemsmodel.dart';

class ItemsSearchController extends GetxController {
  TextEditingController search = TextEditingController();
  List<ItemsModel> listdata = [];
  StatusRequest statusRequest = StatusRequest.none;
  bool isSearch = false;

  HomeData homedata = HomeData(Get.find());

  String normalizeArabic(String text) {
    return text
        .replaceAll(RegExp(r"[أإآ]"), "ا")
        .replaceAll("ؤ", "و")
        .replaceAll("ئ", "ي")
        .replaceAll("ء", "")
        .replaceAll("ة", "ه")
        .replaceAll("ى", "ي")
        .replaceAll(RegExp(r"[\u064B-\u0652]"), ""); // حذف التشكيل
  }

  void onSearchItems(String text) async {
    isSearch = true;
    statusRequest = StatusRequest.loading;
    update();

    var response = await homedata.searchData(normalizeArabic(text));
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest && response['status'] == "success") {
      listdata = (response['data'] as List)
          .map((e) => ItemsModel.fromJson(e))
          .toList();
    } else {
      listdata.clear();
    }

    update();
  }

  void checkSearch(String val) {
    if (val.isEmpty) {
      isSearch = false;
      listdata.clear();
      statusRequest = StatusRequest.none;
      update();
    }
  }

  void clearSearch() {
    search.clear();
    listdata.clear();
    isSearch = false;
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onClose() {
    search.dispose();
    super.onClose();
  }
}
