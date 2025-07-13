// import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaheen_bookstore/linkapi.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/auth/account_controller.dart';
import '../../controller/settings_controller.dart';
import '../../core/constant/apptheme.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/alartexitapp.dart';
import 'contectwithdeveloper.dart';
import 'language.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    final AccountController accountController = Get.put(AccountController());

    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: ListView(

        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(height: Get.width / 3, color: AppColor.primaryColor),
                Positioned(
                    top: Get.width / 3.9,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(120)),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey[100],
                        backgroundImage: const AssetImage(ImageAsset.logo),
                      ),
                    )),
              ],),
          const SizedBox(height: 155),
    Card(

    color: AppColor.secondColor,
    child: Column(
    children: [
      if (!controller.isGuest)
        ListTile(
          onTap: () => Get.toNamed(AppRoute.profile),
          trailing: const Icon(Icons.person, color: AppColor.black),
          title: Text('113'.tr, style: _titleStyle),
        ),
    // ✅ لا تظهر الطلبات إذا كان زائر
    if (!controller.isGuest)
    ListTile(
    onTap: () => Get.toNamed(AppRoute.orderspending),
    trailing: const Icon(Icons.card_travel, color: AppColor.black),
    title: Text('45'.tr, style: _titleStyle),
    ),

    if (!controller.isGuest)
    ListTile(
    onTap: () => Get.toNamed(AppRoute.ordersarchive),
    trailing: const Icon(Icons.archive, color: AppColor.black),
    title: Text('46'.tr, style: _titleStyle),
    ),

    // معلومات عامة للجميع
    // ListTile(
    // onTap: () => Get.toNamed(AppRoute.aboutus),
    // trailing: const Icon(Icons.help_outline_rounded, color: AppColor.black),
    // title: Text('48'.tr, style: _titleStyle),
    // ),


      ListTile(
        onTap: () => Get.toNamed(AppRoute.aboutus),
        trailing: const Icon(Icons.settings, color: AppColor.black),
        title: Text('48'.tr, style: _titleStyle),
      ),

      ListTile(
    onTap: () => launchUrl(Uri.parse("https://wa.me/+971528816100")),
    trailing: const Icon(Icons.phone_callback_outlined, color: AppColor.black),
    title: Text('49'.tr, style: _titleStyle),
    ),
    ListTile(
    onTap: () => Get.toNamed(AppRoute.language2),
    trailing: const Icon(Icons.language, color: AppColor.black),
    title: Text('51'.tr, style: _titleStyle),
    ),

    // ✅ لا تعرض زر تسجيل الخروج إلا إذا كان مسجلاً
    if (!controller.isGuest)
    ListTile(
    onTap: () {
    showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
    title: Text("99".tr),
    content: Text("100".tr),
    actions: [
    TextButton(onPressed: () => Navigator.pop(context), child: Text("101".tr)),
    TextButton(onPressed: () {
    Navigator.pop(context);
    controller.logout();
    }, child: Text("102".tr)),
    ],
    ),
    );
    },
    title: Text('50'.tr, style: _titleStyle),
    trailing: const Icon(Icons.exit_to_app, color: AppColor.black),
    ),

    // ✅ لا تعرض زر حذف الحساب إلا إذا كان مسجلاً
    if (!controller.isGuest)
    ListTile(
    onTap: () {
    showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
    title: Text("111".tr),
    content: Text("112".tr),
    actions: [
    TextButton(onPressed: () => Navigator.pop(context), child: Text("76".tr)),
    TextButton(
    onPressed: () async {
    Navigator.pop(context);
    await accountController.deleteAccount();
    },
    child: Text("86".tr),
    ),
    ],
    ),
    );
    },
    title: Text('111'.tr, style: _titleStyle),
    trailing: const Icon(Icons.cancel, color: AppColor.black),
    ),

      // ✅ يظهر فقط إذا كان زائر
      if (controller.isGuest)
        ListTile(
          onTap: () {
            Get.offAllNamed(AppRoute.login); // أو Get.toNamed إذا تفضل عدم حذف المسارات السابقة
          },
          title: Text(
            '9'.tr,
            style: _titleStyle,
          ),
          trailing: const Icon(Icons.login, color: AppColor.black),
        ),
      // ListTile(
      //   onTap: () => Get.toNamed(AppRoute.contactdeveloperPage),
      //   trailing: const Icon(Icons.settings, color: AppColor.black),
      //   title: Text('140'.tr, style: _titleStyle),
      // ),

    ],
    ),
    )]
    )

    )
    ;


  }

  TextStyle get _titleStyle => const TextStyle(
    fontSize: 18,
    color: AppColor.primaryColor,
    fontFamily: "playfairDisplay",
  );

}