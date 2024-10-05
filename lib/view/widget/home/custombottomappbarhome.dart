
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/homescreen_controller.dart';
import 'custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 20,
            child: Row(
              children: [
                ...List.generate(controller.listPage.length + 1, ((index) {
                  int i = index > 1 ? index - 1 : index;
                  return index == 1
                      ? const Spacer()
                      : CustomButtonAppBar(
                          textbutton: controller.bottomappbar[i]['title'],
                          icondata: controller.bottomappbar[i]['icon'],
                          onPressed: () {
                            controller.changePage(i);
                          },
                          active: controller.currentpage == i ? true : false);
                }))
              ],
            )));
  }
}
