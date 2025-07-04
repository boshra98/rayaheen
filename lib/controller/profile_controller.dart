import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../data/model/user.dart';
import '../linkapi.dart';


class ProfileController extends GetxController {
  final GetStorage box = GetStorage();

  // المتغيرات التي نربطها مع الواجهة
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  var isLoading = false.obs;

  late UserModel user;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  void loadUserData() {
    final userData = box.read('user');

    if (userData != null) {
      print("📦 بيانات المستخدم من التخزين: $userData");

      user = UserModel.fromJson(userData); // ← استخدم الموديل مباشرة

      nameController.text = user.name;
      phoneController.text = user.phone;
      // إذا عندك email: emailController.text = user.email ?? '';
    } else {
      print("🚫 لا يوجد بيانات مستخدم مخزنة في GetStorage!");
    }
  }



  Future<void> updateProfile() async {
    isLoading.value = true;

    final updatedData = {
      "id": user.id ?? '',
      "name": nameController.text.trim(),
      "phone": phoneController.text.trim(),
      "email": user.email ?? '', // ← لو أردت دعمه
    };


    try {
      final response = await http.post(
        Uri.parse(AppLink.editprofile),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json", // ← هذا مهم جداً
        },
        body: jsonEncode(updatedData), // ← هذا يحوّل البيانات إلى JSON
      );


      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['user'] != null) {
          // تحديث الموديل
          user.name = nameController.text;
          user.phone = phoneController.text;

          box.write("user", user.toJson());
          Get.snackbar("نجاح", "تم تحديث الملف الشخصي");
        } else {
          Get.snackbar("خطأ", "فشل في تحديث الملف الشخصي");
        }
      } else {
        Get.snackbar("خطأ", "فشل الاتصال بالسيرفر");
      }

    } catch (e) {
      Get.snackbar("خطأ", "حدث استثناء: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
