
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;
  const CustomCardHome({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 170,
          decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(25)),
          child: ListTile(
            title: Text(title,
                style: const TextStyle(color: Colors.white, fontSize: 22)),
            subtitle: Text(body,
                style: const TextStyle(color: Colors.white, fontSize: 27)),
          ),
        ),
        Positioned(
          bottom: -10,
             right:controller.lang == "en" ?  -60: null ,
              left: controller.lang == "ar" ?  -20 : null ,
          child: Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
                color: AppColor.primaryyColor,
                borderRadius: BorderRadius.circular(160)),
          ),
        )
      ]),
    );
  }
}
