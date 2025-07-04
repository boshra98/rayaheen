import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
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
            itemBuilder: (context, i) {
              final itemsModel = ItemsModel.fromJson(controller.newitems[i]);
              return ItemsHome2(itemsModel: itemsModel);
            },
          ),
        );
      },
    );
  }
}

class ItemsHome2 extends StatelessWidget {
  final ItemsModel? itemsModel;

  const ItemsHome2({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (itemsModel == null) {
      return const Center(
        child: Text("خطأ: لا يوجد بيانات للعنصر", style: TextStyle(color: Colors.red)),
      );
    }

    double discount = double.tryParse(itemsModel!.discount?.discountPercentage ?? "0") ?? 0.0;
    String? expiresAt = itemsModel!.discount?.expiresAt;

    bool hasValidDiscount = false;
    if (discount > 0 && expiresAt != null) {
      DateTime now = DateTime.now();
      DateTime expiry = DateTime.tryParse(expiresAt) ?? now.subtract(const Duration(days: 1));
      hasValidDiscount = expiry.isAfter(now);
    }

    double originalPrice = double.tryParse(itemsModel!.itemsPrice ?? "0") ?? 0.0;
    double discountedPrice = originalPrice - (originalPrice * (discount / 100));

    return InkWell(
      onTap: () {
        if (itemsModel!.itemsId != null) {
          Get.find<HomeControllerImp>().goToPageProductDetails(itemsModel!);
        }
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColor.secondColor.withOpacity(1),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 120,
                width: 130,
              ),
              Positioned(
                top: 5,
                left: 5,
                right: 5,
                child: CachedNetworkImage(
                  imageUrl: itemsModel!.itemsImage != null
                      ? "${AppLink.imagesItems}/${itemsModel!.itemsImage}"
                      : "https://via.placeholder.com/90",
                  height: 90,
                  width: 90,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              if (hasValidDiscount)
                Positioned(
                  top: 5,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "-${discount.toInt()}%",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontFamily: "cairo",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
                      final CartController cartController = Get.find<CartController>();
                      if (itemsModel?.itemsId != null && itemsModel!.itemsCount! > 0) {
                        cartController.add(itemsModel!.itemsId!.toString());
                      } else {
                        // تنبيه المستخدم أن المنتج غير متوفر
                        Get.snackbar("تنبيه", "هذا المنتج غير متوفر حاليًا");
                      }
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
          Text(
            itemsModel!.itemsName ?? "اسم غير معروف",
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontSize: 13,
              fontFamily: "ttf",
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          if (hasValidDiscount) ...[
            Text(
              "${discountedPrice.round()} درهم",
              style: const TextStyle(
                color: AppColor.primaryColor2,
                fontSize: 12,
                fontFamily: "cairo",
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "${originalPrice.round()} درهم",
              style: const TextStyle(
                color: Colors.orange,
                fontSize: 10,
                fontWeight: FontWeight.bold,
                fontFamily: "cairo",
                decoration: TextDecoration.lineThrough,
              ),
              textAlign: TextAlign.center,
            ),
          ] else
            Text(
              "${originalPrice.round()} درهم",
              style: const TextStyle(
                color: AppColor.primaryColor2,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: "cairo",
              ),
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}
