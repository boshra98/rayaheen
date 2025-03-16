import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/settings_controller.dart';
import '../../core/constant/apptheme.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/alartexitapp.dart';
import 'language.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
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
              ]),
          const SizedBox(height: 155),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              color: AppColor.secondColor,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                // ListTile(
                //   // onTap: () {},
                //   trailing: const Icon(Icons.wb_sunny_outlined,color:AppColor.black),
                //   onTap:(){
                //     if(Get.isDarkMode){
                //       Get.changeTheme(customLightTheme);
                //     } else{
                //       Get.changeTheme(customDarkTheme);
                //     }
                //   },
                //   title: Text(
                //     '44'.tr,
                //     style: const TextStyle(fontSize: 18,color:AppColor.primaryColor,fontFamily:"playfairDisplay"), // Increase font size
                //   ),
                // ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.orderspending);
                  },
                  trailing: const Icon(Icons.card_travel,color:AppColor.black),
                  title: Text(
                    '45'.tr,
                    style: const TextStyle(fontSize: 18 , color:AppColor.primaryColor,fontFamily:"playfairDisplay") , // Increase font size
                  ),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.ordersarchive);
                  },
                  trailing: const Icon(Icons.card_travel,color:AppColor.black),
                  title: Text(
                    '46'.tr,
                    style: const TextStyle(fontSize: 18,color:AppColor.primaryColor,fontFamily:"playfairDisplay"), // Increase font size
                  ),
                ),
                // ListTile(
                //   onTap: () {
                //     Get.toNamed(AppRoute.addressview);
                //   },
                //   trailing: Icon(Icons.location_on_outlined),
                //   title: Text('47'.tr),
                // ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.aboutus);
                  },
                  trailing: const Icon(Icons.help_outline_rounded,color:AppColor.black),
                  title: Text(
                    '48'.tr,
                    style: const TextStyle(fontSize: 18 ,color:AppColor.primaryColor,fontFamily:"playfairDisplay",), // Increase font size
                  ),
                ),
                ListTile(
                  onTap: () {
                    launchUrl(Uri.parse("https://wa.me/+971528816100"));
                  },
                  trailing: const Icon(Icons.phone_callback_outlined,color:AppColor.black),
                  title: Text(
                    '49'.tr,
                    style: const TextStyle(fontSize: 18,color:AppColor.primaryColor,fontFamily:"playfairDisplay"), // Increase font size
                  ),
                ),
                ListTile(
                  title: Text(
                    "51".tr,
                    style: const TextStyle(fontSize: 18,color:AppColor.primaryColor,fontFamily:"playfairDisplay"), // Increase font size
                  ),
                  trailing: const Icon(Icons.language,color:AppColor.black),
                  onTap:(){
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Language()));
                    Get.toNamed(AppRoute.language2);
                  },
                ),
                ListTile(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("99".tr),
                          content: Text("100".tr),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text("101".tr),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                                controller.logout(); // Perform logout action
                              },
                              child: Text("102".tr),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  title: Text(
                    '50'.tr,
                    style: const TextStyle(
                      fontSize: 18,
                      color: AppColor.primaryColor,
                      fontFamily: "playfairDisplay",
                    ),
                  ),
                  trailing: const Icon(Icons.exit_to_app, color: AppColor.black),
                ),

              ]),
            ),
          )
        ],
      ),
    );
  }
}