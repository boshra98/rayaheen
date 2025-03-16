import 'dart:io';

import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/functions/alartexitapp.dart';
import '../../data/model/categorymodel.dart';
import '../../data/model/publisherModel.dart';

import '../../data/model/itemsmodel.dart';
import '../../linkapi.dart';
import '../widget/customappbar2.dart';
import '../widget/home/customcardhome.dart';
import '../widget/home/customtitlehome.dart';
import '../widget/home/listagegroup.dart';
import '../widget/home/listcategorieshome.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:rayaheen_bookstore/core/constant/routes.dart';

import 'package:rayaheen_bookstore/view/widget/customappbar.dart';

import 'package:rayaheen_bookstore/view/widget/home/listitemshome.dart';

import 'allbooks.dart';
import 'newitems.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    // final CategoriesModel categoriesModel;
    final List<String> ageGroups = [
      "0-3  سنوات",
      "9-12 سنوات",
      " 3-6 سنوات",
      "12+ سنوات",
      "6-9  سنوات",
      "للأهل والمربين",
    ];
    final List<String> Groups = [
      "ذكر وأنثى",
      "أبطال الإسلام",
    ];
    int i = 0;
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Scaffold(
        key: _scaffoldKey, // Attach the key to the Scaffold
        endDrawer: Drawer(
          // Use endDrawer for the drawer to appear on the right side
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: AppColor.primaryColor2),
                child: Center(
                  // Center the content within the DrawerHeader
                  child: Container(
                    width: 100, // Set the desired circle size
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle, // Circular shape
                      color: Colors.white, // Optional background color
                      border: Border.all(
                        color: Colors.grey.shade300, // Border color
                        width: 3, // Border width
                      ),
                      boxShadow: [
                        // Optional shadow for a polished look
                        BoxShadow(
                          color: Colors.grey.shade400,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      // Ensures the logo image is clipped to a circle
                      child: Image.asset(
                        'assets/images/logo.png', // Path to the image
                        fit: BoxFit.cover, // Ensures the image fills the circle
                      ),
                    ),
                  ),
                ),
              ),

              Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  title: Text(
                    "43".tr,
                    style: const TextStyle(color: AppColor.primaryColor2),
                  ),
                  children: [
                    ListTile(
                      title: Text("97".tr,
                          style: TextStyle(color: AppColor.primaryColor2)),
                      onTap: () async {
                        // Ensure data is fetched before navigating
                        if (controller.newitems.isEmpty) {
                          // Optionally, show a loading indicator or a message if the data is still loading
                          Get.snackbar("Loading",
                              "Please wait while the items are being loaded.");
                          return; // Prevent navigation if newitems is empty
                        }

                        // Proceed with navigation once newitems is not empty
                        Get.to(() => NewItemsPage(items: controller.newitems));
                      },
                    ),
                  ],
                ),
              ),
              ExpansionTile(
                title: Text('92'.tr,
                    style: const TextStyle(color: AppColor.primaryColor2)),
                // leading: const Icon(Icons.numbers_rounded,color:AppColor.primaryColor2), // Optional: Add an icon if needed
                children: [
                  ListTile(
                    title: Text(ageGroups[0]),
                    onTap: () {
                      controller.goToItemsage(controller.categories, 0);

                      // Handle tap for the first child
                      // Get.back();
                    },
                  ),
                  ListTile(
                    title: Text(ageGroups[2]),
                    onTap: () {
                      controller.goToItemsage(controller.categories, 2);

                      // Handle tap for the second child
                      // Get.back();
                    },
                  ),
                  ListTile(
                    title: Text(ageGroups[4]),
                    onTap: () {
                      controller.goToItemsage(controller.categories, 4);

                      // Handle tap for the third child
                      //Get.back();
                    },
                  ),
                  ListTile(
                    title: Text(ageGroups[1]),
                    onTap: () {
                      // Handle tap for the third child
                      controller.goToItemsage(controller.categories, 1);
                    },
                  ),
                  ListTile(
                    title: Text(ageGroups[3]),
                    onTap: () {
                      controller.goToItemsage(controller.categories, 3);

                      // Handle tap for the third child
                      // Get.back();
                    },
                  ),
                  ListTile(
                    title: Text(ageGroups[5]),
                    onTap: () {
                      controller.goToItemsage(controller.categories, 5);

                      // Handle tap for the third child
                      //  Get.back();
                    },
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('93'.tr,
                    style: const TextStyle(color: AppColor.primaryColor2)),
                //leading: const Icon(Icons.category,color:AppColor.primaryColor2),
                children: controller.categories.isNotEmpty
                    ? controller.categories.map<Widget>((category) {
                        final categoryModel =
                            CategoriesModel.fromJson(category);
                        return ListTile(
                          title:
                              Text(categoryModel.categoriesName ?? 'No Name'),
                          onTap: () {
                            controller.goToItems(
                                controller.categories,
                                controller.categories.indexOf(category),
                                categoryModel.categoriesId!.toString()
                                // categoryModel.categoriesId! as String ,
                                );
                          },
                        );
                      }).toList()
                    : [
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
              ),
              //select by publisher/////////////////////////////////////////////////////
              ExpansionTile(
                title: Text('91'.tr,
                    style: const TextStyle(
                      color: AppColor.primaryColor2,
                    )),
                //leading: const Icon(Icons.book,color:AppColor.primaryColor2),
                children: controller.publishers.isNotEmpty
                    ? controller.publishers.map<Widget>((publisher) {
                        return ListTile(
                          title: Text(publisher),
                          onTap: () {
                            print("Selected publisher: $publisher");

                            controller.goToItemsByPublisher(
                                publisher, controller.categories);
                            // controller.goToItems(
                            //     controller.publishers,
                            //     controller.publishers.indexOf(category),
                            //     PublisherModel.publisherName!.toString();
                            //   // categoryModel.categoriesId! as String ,
                            // );
                          },
                        );
                      }).toList()
                    : [
                        const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
              ),

              //all books//////////////////////////////////////////////////////////////////////
              ExpansionTile(
                title: Text("94".tr,
                    style: const TextStyle(color: AppColor.primaryColor2)),
                children: [
                  ListTile(
                    title: Text("95".tr,
                        style: TextStyle(color: AppColor.primaryColor2)),
                    onTap: () {
                      Get.to(() => BooksListPage(items: controller.books));
                    },
                  ),
                ],
              ),

              // ExpansionTile(
              //   title: const Text('اختر حسب دور النشر'),
              //   leading: const Icon(Icons.book),
              //   children: controller.publishers.isNotEmpty
              //       ? controller.publishers.map<Widget>((publisher) {
              //     // Assuming publisher JSON has "name" and "id" fields
              //     return ListTile(
              //       title: Text(publisher['name'] ?? 'No Name'),
              //       onTap: () {
              //         // Add navigation logic if necessary
              //       //  controller.goToItemsByPublisher(publisher['id']);
              //       },
              //     );
              //   }).toList()
              //       : [
              //     // const Center(
              //     //   child: CircularProgressIndicator(),
              //     // ),
              //   ],
              // ),
//here)
            ],
          ),
        ),
        body: Container(
          //padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            children: [
              CustomAppBar2(
                onPressedMenu: () {
                  // Open the end drawer when the menu button is pressed
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                onPressedSearch: () {
                  // Handle search button press
                },
                logoPath:
                    'assets/images/logo.png', // Replace with your logo path
              ),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomCardHome(),
                          CustomTitleHome(title: '43'.tr),
                          const ListItemsHome(),
                          // CustomTitleHome(title: '42'.tr,),
                          const ListAgeGroup(),
                          CustomTitleHome(title: '74'.tr),
                          const ListCategoriesHome(),
                        ],
                      )
                    : ListItemsSearch(listdatamodel: controller.listdata),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class ListItemsSearch extends GetView<HomeControllerImp> {
//
//   final List<ItemsModel> listdatamodel;
//   const ListItemsSearch({Key? key, required this.listdatamodel})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeControllerImp());
//
//     return
//
//       GetBuilder<HomeControllerImp>(
//           builder: (controller)
//     { return
//         ListView.builder(
//             itemCount: listdatamodel.length,
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () {
//                   controller.goToPageProductDetails(listdatamodel[index]);
//                   //  Get.find<HomeControllerImp>().goToPageProductDetails(listdatamodel);
//
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(vertical: 20),
//                   child: Card(
//                       child: Container(
//                         padding: EdgeInsets.all(10),
//                         child: Row(
//                           children: [
//                             Expanded(
//                                 child: CachedNetworkImage(
//                                     imageUrl:
//                                     "${AppLink
//                                         .imagesItems}/${listdatamodel[index]
//                                         .itemsImage}")),
//                             Expanded(
//                                 flex: 2,
//                                 child: ListTile(
//                                   title: Text(listdatamodel[index].itemsName!),
//                                   subtitle: Text(
//                                       listdatamodel[index].itemsPrice!),
//                                 )),
//                           ],
//                         ),
//                       )
//                   ),
//                 ),
//               );
//
//             }
//         );
//
//
//     )
//   }
// }
class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return ListView.builder(
          itemCount: listdatamodel.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // controller.goToPageProductDetails(listdatamodel[index]);
                Get.find<HomeControllerImp>()
                    .goToPageProductDetails(listdatamodel[index]);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagesItems}/${listdatamodel[index].itemsImage}",
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text(listdatamodel[index].itemsName!),
                            subtitle: Text(listdatamodel[index].itemsPrice!),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    ); // ✅ This closing bracket was missing
  }
}
