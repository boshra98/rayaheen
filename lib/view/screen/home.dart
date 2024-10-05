
import 'dart:io';

import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/functions/alartexitapp.dart';
import '../../data/model/itemsmodel.dart';
import '../../linkapi.dart';
import '../widget/home/customcardhome.dart';
import '../widget/home/customtitlehome.dart';
import '../widget/home/listcategorieshome.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:rayaheen_bookstore/core/constant/routes.dart';

import 'package:rayaheen_bookstore/view/widget/customappbar.dart';

import 'package:rayaheen_bookstore/view/widget/home/listitemshome.dart';




class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),

            child: ListView(
              children: [

                CustomAppBar(
                  mycontroller: controller.search!,
                  titleappbar:  "41".tr,
                  // onPressedIcon: () {},
                  onPressedSearch: () {
                    controller.onSearchItems();
                  },
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                  onPressedIconFavorite: () {
                    Get.toNamed(AppRoute.myfavroite);
                  }, appBar:AppBar(backgroundColor:AppColor.primaryColor),
                ),

                HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: !controller.isSearch
                        ?  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomCardHome(
                        ),
                        CustomTitleHome(title: '42'.tr),
                        const ListCategoriesHome(),
                        CustomTitleHome(title: '43'.tr),
                        const ListItemsHome(),
                        // const DoubleTapToExit(
                        //   child: Scaffold(),
                        //   snackBar: SnackBar(
                        //     content: Text('Tap again to exit !'),
                        //   ),
                        // ),
                      ],
                    )
                        : ListItemsSearch(listdatamodel: controller.listdata)
                    ,


                )

                // const CustomTitleHome(title: "Offer"),
                // const ListItemsHome()
              ],
            )));
  }
}






class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const ListItemsSearch({Key? key, required this.listdatamodel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
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
                                "${AppLink.imagesItems}/${listdatamodel[index].itemsImage}")),
                        Expanded(
                            flex: 2,
                            child: ListTile(
                              title: Text(listdatamodel[index].itemsName!),
                              subtitle: Text(listdatamodel[index].itemsPrice!),
                            )),
                      ],
                    ),
                  )
              ),
            ),
          );
        }
    );
  }
}
