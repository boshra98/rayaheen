import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.06; // 6% of screen width

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title:  Text(
          '48'.tr,
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: AppColor.secondColor,
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[100],
                    backgroundImage: const AssetImage(ImageAsset.logo),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "52".tr, // assuming translation key
                  textAlign: TextAlign.start, // ✅ ذكي حسب اتجاه اللغة

                  //textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 23,
                    fontFamily: "playfairDisplay",
                    color: AppColor.primaryColor2,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
