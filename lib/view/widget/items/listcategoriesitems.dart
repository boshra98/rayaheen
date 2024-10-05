import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home_controller.dart';

import '../../../controller/items_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/categorymodel.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            i: index,
            categoriesModel:
            CategoriesModel.fromJson(controller.categories[index]),
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.goToItems(controller.categories, i!,);
      //  controller.goToItems(controller.categories, i! , categoriesModel.categoriesId!.toString() );

        controller.changeCat(i!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                padding:const  EdgeInsets.only(right: 10, left: 10, bottom: 5),
                // decoration: controller.selectedCat == i
                //     ?const BoxDecoration(
                //     border: Border(
                //         bottom: BorderSide(
                //             width: 3, color: AppColor.primaryColor)))
                   // : null,
                // child: Text(
                //   "${categoriesModel.categoriesName}",
                //
                //  // "mm",
                // // "i=$i",
                //   style:
                //   const TextStyle(fontSize: 20, color: AppColor.grey2),
                // ),
              ))
        ],
      ),
    );
  }
}