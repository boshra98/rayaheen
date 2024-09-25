
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  const CustomCardHome({Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.symmetric(vertical: 0),
      child:
      Stack(children: [
        Container(
            alignment: Alignment.center,
             height: Get.width / 3 ,

      decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/card.jpg'),

     // fit: BoxFit.cover,

        //



    )
    )
    )
  ],
    )


    );
  }
}
