import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../core/services/services.dart';
import '../../linkapi.dart';

class AccountController extends GetxController {
  MyServices myServices = Get.find();

  Future<void> deleteAccount() async {
    MyServices myServices = Get.find();
    String? userId = myServices.sharedPreferences.getString("id");

    final url = Uri.parse("https://www.rayaheenbooks.com/api/deleteaccount?id=$userId");

    try {
      final response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        final message = jsonDecode(response.body)["message"];
        await myServices.sharedPreferences.clear();
        Get.offAllNamed(AppLink.login);
        Get.snackbar("نجاح", message);
      } else {
        print("Delete failed: ${response.statusCode} | ${response.body}");
        Get.snackbar("خطأ", "فشل في حذف الحساب");
      }
    } catch (e) {
      print("Exception: $e");
      Get.snackbar("خطأ", "حدث خطأ أثناء حذف الحساب");
    }
  }


}
