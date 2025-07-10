
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/screen/home.dart';
import '../view/screen/notification.dart';
import '../view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    //const NotificationView() ,
    //ProfilePage(),
    // const Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [Center(child: Text("Profile"))],
    // ),
    const Settings()
  ];

  // List bottomappbar = [
  //   {"title": "81".tr, "icon": Icons.home},
  //   //{"title": "n", "icon": Icons.notifications_active_outlined},
  //   //{"title": "profile", "icon": Icons.person_pin_sharp},
  //   {"title": "82".tr, "icon": Icons.settings}
  // ];

  List bottomappbar = [
    {"title": "81", "icon": Icons.home},
    {"title": "82", "icon": Icons.settings}
  ];


  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
