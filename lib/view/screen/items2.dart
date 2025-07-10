// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rayaheen_bookstore/view/screen/home.dart';
//
// import '../../controller/ItemsSearch_controller.dart';
// import '../../controller/favorit_controller.dart';
// import '../../controller/home_controller.dart';
// import '../../controller/items_controller.dart';
// import '../../core/class/handlingdataview.dart';
// import '../../core/constant/routes.dart';
// import '../../data/model/itemsmodel.dart';
// import '../widget/customappbar.dart';
// import '../widget/home/customcardhome.dart';
// import '../widget/home/customtitlehome.dart';
// import '../widget/home/listitemshome.dart';
// import '../widget/items/customlistitems.dart';
//
// class Items2 extends StatelessWidget {
//   const Items2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Instantiate the controller
//     final HomeControllerImp controller = Get.put(HomeControllerImp());
//     final ItemsSearchController searchController = Get.put(ItemsSearchController());
//
//     return WillPopScope(
//       onWillPop: () async {
//         // Clear search and navigate back
//         controller.clearSearch();
//         Get.offAllNamed(AppRoute.homePage); // Navigate to homepage
//         return false; // Prevent default back navigation
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 1,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.black),
//             onPressed: () {
//               searchController.clearSearch();
//               Get.back();              // 🔄 تحديث الواجهة
//               Navigator.of(context).pop();        // 🔙 الرجوع
//             },
//           ),
//
//           // title: const Text(
//           //   'تفاصيل المنتج',
//           //   style: TextStyle(color: Colors.black),
//           // ),
//         ),
//         body: GetBuilder<HomeControllerImp>(
//           builder: (controller) => Container(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: ListView(
//               children: [
//                 CustomAppBar(
//                   mycontroller: controller.search!,
//                   titleappbar: "41".tr,
//                   onPressedSearch: (search) {
//                     controller.onSearchItems(search); // Trigger search on "Enter" or button press
//                   },
//                   onChanged: (val) {
//                     controller.checkSearch(val); // Optional: handles real-time input changes
//                   },
//                 ),
//                 HandlingDataView(
//                   statusRequest: controller.statusRequest,
//                   widget: ListItemsSearch(listdatamodel: controller.listdata),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/ItemsSearch_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/routes.dart';
import '../widget/customappbar.dart';
import 'home.dart'; // تأكد من استيراد ListItemsSearch

class Items2 extends StatelessWidget {
  const Items2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ItemsSearchController searchController = Get.put(ItemsSearchController());

    return WillPopScope(
      onWillPop: () async {
        searchController.clearSearch();
        Get.offAllNamed(AppRoute.homePage);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              searchController.clearSearch();
              Get.back();
            },
          ),
        ),
        body: GetBuilder<ItemsSearchController>(
          builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [
                CustomAppBar(
                  mycontroller: controller.search,
                  titleappbar: "41".tr,
                  onPressedSearch: (val) => controller.onSearchItems(val),
                 // onChanged: (val) => controller.checkSearch(val),
                  onChanged: (val) {
                    controller.checkSearch(val);
                    if (val.isNotEmpty) {
                      controller.onSearchItems(val);
                    }
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
