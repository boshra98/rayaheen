
import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaheen_bookstore/view/screen/splashscreen.dart';

import '../../controller/homescreen_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp()); // final splashScreen = SplashScreen();
    return DoubleTapToExit(
      snackBar:  SnackBar(
        content: Text('54'.tr),
      ),
      child: GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColor.primaryColor,
            onPressed: () {
              Get.toNamed(AppRoute.cart);
            },
            child: const Icon(Icons.shopping_basket_outlined),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const CustomBottomAppBarHome(),
          body: controller.listPage.elementAt(controller.currentpage),
        ),
      ),
    );
  }
}