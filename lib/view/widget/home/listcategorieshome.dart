
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/categorymodel.dart';
import '../../../linkapi.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,  // Keep the same height restriction
      child: GridView.builder(
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,  // Horizontal scrolling
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,  // Only 1 row since height is limited
          crossAxisSpacing: 30,  // Spacing between items horizontally
          mainAxisSpacing: 70,  // Spacing between items vertically
          childAspectRatio: 1.5, // Adjust this as necessary
        ),
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel: CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      //  print("categoriesId${categoriesModel.categoriesId!}");
         controller.goToItems(controller.categories, i! , "${categoriesModel.categoriesId!}" );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.thirdColor,
                borderRadius: BorderRadius.circular(60)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            //child:Image.asset("assets/images/logo.png" ,height:100,width:150,fit:BoxFit.fill,)
            child:Positioned(
                top: 30.0,
                right: Get.width / 8,
                left: Get.width / 8,

                  child: CachedNetworkImage(
                    imageUrl:
                    "${AppLink.imagesCategories}/${categoriesModel.categoriesImage!}",
                    height: 250,
                    fit: BoxFit.fill,
                  ),
                )
            ),
          // Text(
          //   "${( categoriesModel.categoriesName)}",
          //   style: const TextStyle(fontSize: 13, color: AppColor.primaryColor),
          // )
        ],
      ),
    );
  }
}
