import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.06; // 6% of screen width

    return Container(
      color: AppColor.thirdColor,
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
          ]
      ),


        const SizedBox(height: 100),


              Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
                  child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Container(
              alignment: Alignment.center,
              child: Text(
              "52".tr, // Assuming translation key (optional)
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 23, // Responsive font size
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,

              //letterSpacing: 1.2,
              ),
              ),
              ),
              ],
              ),
              )
        ]),
    );

  }
}







