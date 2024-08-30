
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../data/model/itemsmodel.dart';
import '../../linkapi.dart';
import '../widget/home/customcardhome.dart';
import '../widget/home/customtitlehome.dart';
import '../widget/home/listcategorieshome.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:rayaheen_bookstore/core/constant/routes.dart';

import 'package:rayaheen_bookstore/view/widget/customappbar.dart';

import 'package:rayaheen_bookstore/view/widget/home/listitemshome.dart';


// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeControllerImp());
//     return GetBuilder<HomeControllerImp>(
//         builder: (controller) => Container(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: ListView(
//               children: [
//                 CustomAppBar(
//                   mycontroller: controller.search!,
//                   titleappbar: "Find Product",
//                   // onPressedIcon: () {},
//                   onPressedSearch: () {
//                     controller.onSearchItems();
//                   },
//                   onChanged: (val) {
//                     controller.checkSearch(val);
//                   },
//                   onPressedIconFavorite: () {
//                  //   Get.toNamed(AppRoute.myfavroite);
//                   },
//                 ),
//                 HandlingDataView(
//                     statusRequest: controller.statusRequest,
//                     widget: !controller.isSearch
//                         ? Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         CustomCardHome(
//                             title: "A summer surprise",
//                             body: "Cashback 20%"),
//                         CustomTitleHome(title: "Categories"),
//                         ListCategoriesHome(),
//                         CustomTitleHome(title: "Product for you"),
//                         ListItemsHome(),
//                       ],
//                     )
//                         : ListItemsSearch(listdatamodel: controller.listdata)
//                 )
//
//                // const CustomTitleHome(title: "Offer"),
//                 // const ListItemsHome()
//               ],
//             )));
//   }
// }

// class ListItemsSearch extends GetView<HomeControllerImp> {
//   final List<ItemsModel> listdatamodel;
//   const ListItemsSearch({Key? key, required this.listdatamodel})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: listdatamodel.length,
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               controller.goToPageProductDetails(listdatamodel[index]);
//             },
//             child: Container(
//               margin: const EdgeInsets.symmetric(vertical: 20),
//               child: Card(
//                   child: Container(
//                     padding: EdgeInsets.all(10),
//                     child: Row(
//                       children: [
//                         // Expanded(
//                         //     child: CachedNetworkImage(
//                         //         imageUrl:
//                         //         "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
//                         Expanded(
//                             flex: 2,
//                             child: ListTile(
//                               title: Text(listdatamodel[index].itemsName!),
//                               subtitle: Text(listdatamodel[index].categoriesName!),
//                             )),
//                       ],
//                     ),
//                   )),
//             ),
//           );
//         });
//   }
// }


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: [
                    CustomAppBar(
                      mycontroller: controller.search!,

                      titleappbar: "41".tr,
                     // onPressedIcon: () {},
                      onPressedSearch: () {} ,
                       onPressedIconFavorite: (){
                         Get.toNamed(AppRoute.myfavroite) ;
                       },
                    ),
                     CustomCardHome(
                        title: '39'.tr, body: '40'.tr),
                     CustomTitleHome(title: '42'.tr),
                    const ListCategoriesHome(),
                    CustomTitleHome(title: '43'.tr),
                    const ListItemsHome(),

                    // const CustomTitleHome(title: "Offer"),
                    // const ListItemsHome()
                  ],
                ))));
  }
}



//---------------------------
//if you want to change code with njode on damascus university>>>>
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeControllerImp());
//     return GetBuilder<HomeControllerImp>(
//         builder: (controller) => Container(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: ListView(
//               children: [
//                 CustomAppBar(
//                   mycontroller: controller.search!,
//                   titleappbar: "Find Product",
//                   // onPressedIcon: () {},
//                   onPressedSearch: () {
//                     controller.onSearchItems();
//                   },
//                   onChanged: (val) {
//                     controller.checkSearch(val);
//                   },
//                   onPressedIconFavorite: () {
//                     Get.toNamed(AppRoute.myfavroite);
//                   },
//                 ),
//                 HandlingDataView(
//                     statusRequest: controller.statusRequest,
//                     widget: !controller.isSearch
//                         ? Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         CustomCardHome(
//                             title: "A summer surprise",
//                             body: "Cashback 20%"),
//                         CustomTitleHome(title: "Categories"),
//                         ListCategoriesHome(),
//                         CustomTitleHome(title: "Product for you"),
//                         ListItemsHome(),
//                       ],
//                     )
//                         : ListItemsSearch(listdatamodel: controller.listdata)
//                 )
//
//                 // const CustomTitleHome(title: "Offer"),
//                 // const ListItemsHome()
//               ],
//             )));
//   }
// }
//
// class ListItemsSearch extends GetView<HomeControllerImp> {
//   final List<ItemsModel> listdatamodel;
//   const ListItemsSearch({Key? key, required this.listdatamodel})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: listdatamodel.length,
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               controller.goToPageProductDetails(listdatamodel[index]);
//             },
//             child: Container(
//               margin: const EdgeInsets.symmetric(vertical: 20),
//               child: Card(
//                   child: Container(
//                     padding: EdgeInsets.all(10),
//                     child: Row(
//                       children: [
//                         Expanded(
//                             child: CachedNetworkImage(
//                                 imageUrl:
//                                 "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
//                         Expanded(
//                             flex: 2,
//                             child: ListTile(
//                               title: Text(listdatamodel[index].itemsName!),
//                               subtitle: Text(listdatamodel[index].categoriesName!),
//                             )),
//                       ],
//                     ),
//                   )),
//             ),
//           );
//         });
//   }
// }
