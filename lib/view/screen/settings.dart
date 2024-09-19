
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaheen_bookstore/view/screen/address/view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/settings_controller.dart';
import '../../core/constant/apptheme.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/routes.dart';
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
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey[100],
                       backgroundImage: const AssetImage(ImageAsset.logo),
                      ),
                    )),
              ]),
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  // onTap: () {},
                  trailing: const Icon(Icons.wb_sunny_outlined),
                  onTap:(){
                    if(Get.isDarkMode){
                      Get.changeTheme(customLightTheme);
                    } else{
                      Get.changeTheme(customDarkTheme);
                    }
                  },
                  title: Text('44'.tr),
                ),
                ListTile(
                  onTap: () {
                   // Get.toNamed(AppRoute.orderspending);
                  },
                  trailing: Icon(Icons.card_travel),
                  title: Text('45'.tr),
                ),
                ListTile(
                  onTap: () {
                    //Get.toNamed(AppRoute.ordersarchive );
                  },
                  trailing: Icon(Icons.card_travel),
                  title: Text('46'.tr),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.addressview);
                  },
                  trailing: Icon(Icons.location_on_outlined),
                  title: Text('47'.tr),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.aboutus);
                  },
                  trailing: Icon(Icons.help_outline_rounded),
                  title: Text('48'.tr),
                ),
                ListTile(
                  onTap: () {

                    launchUrl(Uri.parse("https://wa.me/+971528816100"));
                  },
                  trailing: Icon(Icons.phone_callback_outlined),
                  title: Text('49'.tr),
                ),
                ListTile(
                  title:  Text("51".tr),
                  trailing: const Icon(Icons.language),
                  onTap:(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Language()));
                  },
                ),
                ListTile(
                  onTap: () {
                    controller.logout();
                  },
                  title: Text('50'.tr),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
