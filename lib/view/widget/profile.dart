//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../controller/profile_controller.dart';
//
// class ProfilePage extends StatelessWidget {
//   final ProfileController controller = Get.put(ProfileController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("الملف الشخصي")),
//       body: Obx(() => controller.isLoading.value
//           ? Center(child: CircularProgressIndicator())
//           : Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           children: [
//             TextField(
//               controller: controller.nameController,
//               decoration: InputDecoration(labelText: "الاسم"),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: controller.phoneController,
//               decoration: InputDecoration(labelText: "رقم الهاتف"),
//             ),
//             SizedBox(height: 10),
//             // TextField(
//             //   controller: controller.addressController,
//             //   decoration: InputDecoration(labelText: "عنوان السكن"),
//             // ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: controller.updateProfile,
//               child: Text("تحديث البيانات"),
//             )
//           ],
//         ),
//       )),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/profile_controller.dart';
//import '../change_password_page.dart'; // تأكد من وجود هذه الصفحة أو أنشئها

class ProfilePage extends StatelessWidget {
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الملف الشخصي")),
      body: Obx(() => controller.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 16),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/im2.png'), // أو NetworkImage لاحقًا
              backgroundColor: Colors.grey[200],
            ),
            const SizedBox(height: 24),
            buildTextField("الاسم", controller.nameController),
            const SizedBox(height: 16),
            buildTextField("رقم الهاتف", controller.phoneController,
                keyboardType: TextInputType.phone),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                //  Get.to(() => ChangePasswordPage()); // انتقل لصفحة تغيير كلمة المرور
                },
                child: const Text(
                  "تغيير كلمة المرور",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: controller.updateProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4BA6A4),
                ),
                child: const Text(
                  "تحديث البيانات",
                  style: TextStyle(fontSize: 16,color: Colors.white),


                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
