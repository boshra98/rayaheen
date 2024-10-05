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
          crossAxisSpacing: 20,  // Spacing between items horizontally
          mainAxisSpacing: 80,  // Spacing between items vertically
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
        // Print or navigate to items based on category id
        controller.goToItems(controller.categories, i!, "${categoriesModel.categoriesId!}");
      },
      child: Column(
        children: [
          // Circular container with dynamic category name inside
          Container(
            decoration: const BoxDecoration(
              color: AppColor.thirdColor,
              shape: BoxShape.circle, // Makes the container a circle
            ),
            height: 80,
            width: 80,
            alignment: Alignment.center, // Centers the text inside the circle
            child: Text(
              categoriesModel.categoriesName ?? "No Name", // Dynamic category name
              style: const TextStyle(
                color: Colors.white, // Text color (adjust as needed)
                fontWeight: FontWeight.bold, // You can customize the style
                fontSize: 16,
              ),
              textAlign: TextAlign.center, // Center the text if it's multiline
            ),
          ),

          // Optionally, you can also display category images here:
          // CachedNetworkImage(
          //   imageUrl: "${AppLink.imagesCategories}/${categoriesModel.categoriesImage!}",
          //   height: 250,
          //   fit: BoxFit.fill,
          // ),

          // You can also add a description or more text below the image
          // Text(
          //   "${categoriesModel.categoriesDescription}",
          //   style: const TextStyle(fontSize: 13, color: AppColor.primaryColor),
          // )
        ],
      ),
    );
  }
}
