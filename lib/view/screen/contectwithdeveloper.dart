import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constant/color.dart';

class ContactDeveloperPage extends StatelessWidget {
  const ContactDeveloperPage({Key? key}) : super(key: key);

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      Get.snackbar(
        "لا يمكن فتح الرابط",
        "تأكد من وجود تطبيق بريد إلكتروني مثبت على جهازك.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.shade100,
        colorText: Colors.black,
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('140'.tr),
        backgroundColor: AppColor.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
           "141".tr ,
        style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

             Text("142".tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 10),

            const ListTile(
              leading: Icon(Icons.email),
              title: Text("njoudedress@gmail.com"),
              //onTap: () => _launchGmailWeb("njoudedress@gmail.com"),
            ),


             ListTile(
              leading: const Icon(Icons.message),
              title: Text("971554991865 ",style:TextStyle(fontFamily:"cairo")),
              onTap: () => _launchUrl("https://wa.me/971554991865"),
            ),

            const ListTile(
              leading: Icon(Icons.phone),
              title: Text("971554991865 ",style:TextStyle(fontFamily:"cairo")),
             // onTap: () => _launchUrl("https://wa.me/971554991865"),
            ),
            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class ContactDeveloperPage extends StatelessWidget {
//   const ContactDeveloperPage({Key? key}) : super(key: key);
//
//   void _launchUrl(String url) async {
//     final uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } else {
//       Get.snackbar("لا يمكن فتح الرابط", "تحقق من اتصالك وتطبيقاتك.",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red.shade100,
//           colorText: Colors.black);
//     }
//   }
//
//   void _launchGmailWeb(String email) async {
//     final url = "https://mail.google.com/mail/?view=cm&fs=1&to=$email";
//     final uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri, mode: LaunchMode.externalApplication);
//     } else {
//       Get.snackbar("لا يمكن فتح Gmail", "تأكد من توفر متصفح.",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red.shade100,
//           colorText: Colors.black);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('تواصل مع المطوّر'.tr),
//         backgroundColor: Colors.teal,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             // صورة رمزية أو شعار
//             const CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage('assets/images/dev_avatar.png'), // ← غيّر المسار حسب صورتك
//             ),
//             const SizedBox(height: 15),
//
//             Text(
//               "هل لديك ملاحظات تقنية أو ترغب بتطوير تطبيق مشابه؟\nيسعدنا تواصلك مع المطوّر المسؤول.\nسنرد عليك خلال 24 ساعة.",
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
//             ),
//
//             const SizedBox(height: 25),
//
//             // معلومات الاتصال باستخدام بطاقات
//             Card(
//               elevation: 3,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               child: ListTile(
//                 leading: const Icon(Icons.email, color: Colors.teal),
//                 title: const Text("njoudedress@gmail.com"),
//                 trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//                 onTap: () => _launchGmailWeb("njoudedress@gmail.com"),
//               ),
//             ),
//
//             const SizedBox(height: 10),
//
//             Card(
//               elevation: 3,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               child: ListTile(
//                 leading: const Icon(Icons.message, color: Colors.green),
//                 title: const Text("+971554991865 (WhatsApp)"),
//                 trailing: const Icon(Icons.arrow_forward_ios, size: 16),
//                 onTap: () => _launchUrl("https://wa.me/971554991865"),
//               ),
//             ),
//
//             const SizedBox(height: 30),
//
//             // أزرار واضحة في المنتصف
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: () => _launchGmailWeb("njoudedress@gmail.com"),
//                   icon: const Icon(Icons.email),
//                   label: const Text("راسلنا"),
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
//                 ),
//                 const SizedBox(width: 15),
//                 ElevatedButton.icon(
//                   onPressed: () => _launchUrl("https://wa.me/971554991865"),
//                   icon: const Icon(Icons.messege),
//                   label: const Text("واتساب"),
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
