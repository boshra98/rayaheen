import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaheen_bookstore/view/screen/home.dart';

import '../../controller/favorit_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/items_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/routes.dart';
import '../../data/model/itemsmodel.dart';
import '../widget/customappbar.dart';
import '../widget/home/customcardhome.dart';
import '../widget/home/customtitlehome.dart';
import '../widget/home/listitemshome.dart';
import '../widget/items/customlistitems.dart';

class Items2 extends StatelessWidget {
  const Items2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Instantiate the controller
    final HomeControllerImp controller = Get.put(HomeControllerImp());

    return WillPopScope(
      onWillPop: () async {
        // Clear search and navigate back
        controller.clearSearch();
        Get.offAllNamed(AppRoute.homePage); // Navigate to homepage
        return false; // Prevent default back navigation
      },
      child: Scaffold(
        body: GetBuilder<HomeControllerImp>(
          builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                CustomAppBar(
                  mycontroller: controller.search!,
                  titleappbar: "41".tr,
                  onPressedSearch: (search) {
                    controller.onSearchItems(search); // Trigger search on "Enter" or button press
                  },
                  onChanged: (val) {
                    controller.checkSearch(val); // Optional: handles real-time input changes
                  },
                ),
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListItemsSearch(listdatamodel: controller.listdata),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

