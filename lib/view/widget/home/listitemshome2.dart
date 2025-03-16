import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';





class ListItemsHome2 extends GetView<HomeControllerImp> {
  const ListItemsHome2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        if (controller.newitems.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SizedBox(
          height: 120,
          child: ListView.builder(
            itemCount: controller.newitems.length,
            //scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              final itemsModel = ItemsModel.fromJson(controller.newitems[i]);

              // Debugging: Print item details
              debugPrint("Item Name: ${itemsModel.itemsName}");
              debugPrint("Item Image: ${itemsModel.itemsImage}");

              return ItemsHome2(
                itemsModel: itemsModel,
              );
            },
          ),
        );
      },
    );
  }
}

class ItemsHome2 extends StatelessWidget {
  final ItemsModel? itemsModel; // اجعلها nullable

  const ItemsHome2({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (itemsModel == null) {
      return const Center(
        child: Text(
          "خطأ: لا يوجد بيانات للعنصر",
          style: TextStyle(color: Colors.red),
        ),
      );
    }

    return InkWell(
      onTap: () {
        if (itemsModel!.itemsId != null) {
          print(itemsModel!.itemsId);
          Get.find<HomeControllerImp>().goToPageProductDetails(itemsModel!);
        }
      },
      child: Column(
        children: [
          // Stack with Image and Background
          Stack(
            children: [
              // Background Container with Rounded Corners
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColor.secondColor.withOpacity(1),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 120,
                width: 130,
              ),

              // Image Positioned at the Center
              Positioned(
                top: 5,
                left: 5,
                right: 5,
                child: CachedNetworkImage(
                  imageUrl: itemsModel!.itemsImage != null
                      ? "${AppLink.imagesItems}/${itemsModel!.itemsImage}"
                      : "https://via.placeholder.com/90", // صورة افتراضية إذا كانت الصورة فارغة
                  height: 90,
                  width: 90,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor2,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(1),
                  child: IconButton(
                    onPressed: () {
                      // Handle adding to cart
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 14,
                      color: AppColor.secondColor,
                    ),
                    padding: const EdgeInsets.only(right: 10, left: 8, bottom: 2),
                  ),
                ),
              ),
            ],
          ),

          // Text Below the Stack
          Text(
            itemsModel!.itemsName ?? "اسم غير معروف",
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "${itemsModel!.itemsPrice ?? "غير متوفر"} درهم",
            style: const TextStyle(
              color: AppColor.primaryColor2,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
