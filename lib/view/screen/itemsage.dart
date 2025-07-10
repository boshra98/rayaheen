import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/buttom_controller.dart';
import '../../controller/favorit_controller.dart';
import '../../controller/home_controller.dart';
import '../../controller/items_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../data/model/itemsmodel.dart';
import '../../linkapi.dart';
import '../widget/customappbar.dart';
import '../widget/home/floatingbottom.dart';
import '../widget/home/generalbottom.dart';
import '../widget/items/customlistitems.dart';
import '../widget/items/listcategoriesitems.dart';
import 'home.dart';

class itemsage extends StatelessWidget {
  const itemsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());
    Get.put(GeneralBottomNavController()); // ربط الكونترولر هنا

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            controller.clearSearch(); // تنظيف البحث بشكل أنظف
            Navigator.of(context).pop();
          },
        ),
      ),
      bottomNavigationBar: const GeneralBottomNavigationBar(),
      floatingActionButton: const FloatingCartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          CustomAppBar(
            mycontroller: controller.search!,
            titleappbar: "41".tr,
            //iconData: Icons.arrow_forward,

            // onPressedIcon: () {},
            onPressedSearch: (search) {
              controller.onSearchItems(search);  // Pass search text to controller
            },
            onChanged: (val) {
              controller.checkSearch(val);
              if (val.isNotEmpty) {
                controller.onSearchItems(val);
              }
            },
           // onPressedIconFavorite: () {
           //   Get.toNamed(AppRoute.myfavroite);
          //  },
            //appBar:AppBar(backgroundColor:AppColor.primaryColor),

          ),
          const SizedBox(height: 20),
          const ListCategoriesItems(),
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isSearch
                      ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                       SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait
                            ? 0.7
                            : 1.0,),
                      itemBuilder: (BuildContext context, index) {
                        controllerFav.isFavorite[controller.data[index]
                        ['items_id']] =
                        controller.data[index]['favorite'];
                        return CustomListItems(
                            itemsModel: ItemsModel.fromJson(
                                controller.data[index]));
                      })
                      : ListItemsSearch(listdatamodel: controller.listdata)))
        ]),
      ),
    );
  }
}
