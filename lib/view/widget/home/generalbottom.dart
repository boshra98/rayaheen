import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/buttom_controller.dart';
import '../../../controller/homescreen_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import 'custombuttonappbar.dart';

class GeneralBottomNavigationBar extends StatelessWidget {
  const GeneralBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralBottomNavController>(
      builder: (controller) => BottomAppBar(
        color: AppColor.beigeColor.withOpacity(0.7),
        shape: const CircularNotchedRectangle(),
        notchMargin: 20,
        child: Row(
          children: List.generate(2 + 1, (index) {
            // فقط صفحتين + المسافة
            int i = index > 1 ? index - 1 : index;
            return index == 1
                ? const Spacer()
                : CustomButtonAppBar(
              textbutton: i == 0 ? "الرئيسية" : "الإعدادات",
              icondata: i == 0 ? Icons.home : Icons.settings,


              onPressed: () {
                final int tabIndex = i;
                Get.offAllNamed(AppRoute.homePage, arguments: {"tab": tabIndex});
              },


              active: controller.currentIndex == i,
            );
          }),
        ),
      ),
    );
  }
}
