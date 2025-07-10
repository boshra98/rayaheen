import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';

class SingleProductCardView extends StatelessWidget {
  final ItemsModel item;

  const SingleProductCardView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColor.secondColor,
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
                  imageUrl: item.itemsImage != null
                      ? "${AppLink.imagesItems}/${item.itemsImage}"
                      : "https://via.placeholder.com/90",
                  height: 90,
                  width: 90,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
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
                  child: IconButton(
                    onPressed: () {
                      final CartController cartController = Get.find<CartController>();
                      if (item.itemsId != null && item.itemsCount! > 0) {
                        cartController.add(item.itemsId!.toString());
                      } else {
                        Get.snackbar("تنبيه", "هذا المنتج غير متوفر حاليًا");
                      }
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      size: 14,
                      color: AppColor.secondColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            item.itemsName ?? "اسم غير معروف",
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontSize: 13,
              fontFamily: "ttf",
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "${double.parse(item.itemsPrice!).round()} درهم",
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
