import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../controller/favorit_controller.dart';
import '../../../controller/items_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';
import '../../screen/productdetails.dart';



// class CustomListItems extends GetView<ItemsControllerImp> {
//   final ItemsModel itemsModel;
//
//   const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // ✅ التحقق من وجود خصم
//     double discount = double.tryParse(itemsModel.discount?.discountPercentage ?? "0") ?? 0.0;
//     bool hasDiscount = discount > 0;
//     double originalPrice = double.tryParse(itemsModel.itemsPrice ?? "0") ?? 0.0;
//     double discountedPrice = originalPrice - (originalPrice * (discount / 100));
//     return
//         // ✅ البطاقة (Card)
//         InkWell(
//           onTap: () {
//             controller.goToPageProductDetails(itemsModel);
//           },
//           child: Column(
//               children: [
//           // Stack with Image and Background
//           Stack(
//           children: [
//           // Background Container with Rounded Corners
//           Container(
//           margin: const EdgeInsets.symmetric(horizontal: 10),
//           decoration: BoxDecoration(
//             color: AppColor.secondColor.withOpacity(1),
//             borderRadius: BorderRadius.circular(15),
//           ),
//           height: 120,
//           width: 130,
//         ),
//
//     // Image Positioned at the Center
//     Positioned(
//     top: 5,
//     left: 5,
//     right: 5,
//     child: CachedNetworkImage(
//     imageUrl: itemsModel!.itemsImage != null
//     ? "${AppLink.imagesItems}/${itemsModel!.itemsImage}"
//         : "https://via.placeholder.com/90", // صورة افتراضية إذا كانت الصورة فارغة
//     height: 90,
//     width: 90,
//     fit: BoxFit.contain,
//     placeholder: (context, url) => const Center(
//     child: CircularProgressIndicator(),
//     ),
//     errorWidget: (context, url, error) => const Icon(Icons.error),
//     ),
//     ),
//
//     // ✅ إظهار نسبة الخصم إذا كان هناك خصم
//     if (hasDiscount)
//     Positioned(
//     top: 5,
//     right: 10,
//     child: Container(
//     padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3), // ✅ تقليل التباعد الداخلي
//     decoration: BoxDecoration(
//     color: Colors.red,
//     borderRadius: BorderRadius.circular(4), // ✅ تقليل استدارة الزوايا
//     ),
//     child: Text(
//     "-${discount.toInt()}%", // ✅ حذف الأرقام العشرية
//     style: const TextStyle(
//     color: Colors.white,
//       fontFamily:"cairo",
//
//       fontSize: 8, // ✅ تصغير حجم النص
//     fontWeight: FontWeight.w600, // ✅ جعل الخط متناسقًا ولكن ليس سميكًا جدًا
//     ),
//     ),
//     ),
//     ),
//
//
//     Positioned(
//     bottom: 0,
//     left: 0,
//     child: Container(
//     width: 30,
//     height: 30,
//     decoration: BoxDecoration(
//     color: AppColor.primaryColor2,
//     borderRadius: BorderRadius.circular(20),
//     ),
//     padding: const EdgeInsets.all(1),
//     child: IconButton(
//     onPressed: () {
//     final CartController cartController = Get.find<CartController>();
//     if (itemsModel?.itemsId != null) {
//     cartController.add(itemsModel!.itemsId!.toString());
//     }
//     },
//     icon: const Icon(
//     Icons.shopping_cart_outlined,
//     size: 14,
//     color: AppColor.secondColor,
//     ),
//     padding: const EdgeInsets.only(right: 10, left: 8, bottom: 2),
//     ),
//     ),
//     ),
//     ],
//     ),
//
//
//
//         // ✅ اسم المنتج والسعر
//         Padding(
//           padding: const EdgeInsets.only(top: 0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // ✅ اسم المنتج
//               Text(
//                 "${itemsModel.itemsName}",
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   color: AppColor.primaryColor,
//                   fontSize: 13,
//                   fontFamily: "ttf",
//                   fontWeight: FontWeight.w500,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//               ),
//
//               // ✅ إذا كان هناك خصم، يتم عرض السعر الجديد والسعر الأصلي مشطوبًا
//               if (hasDiscount) ...[
//                 // ✅ السعر الجديد بعد الخصم
//                 Text(
//                   "${discountedPrice.round()} درهم", // ✅ تحويل السعر إلى عدد صحيح بدون فاصلة عشرية
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     color: AppColor.primaryColor2,
//                     fontFamily:"cairo",
//
//                     fontSize: 14,
//                   ),
//                 ),
//
//                 // ✅ السعر الأصلي (مشطوب)
//                 Text(
//                   "${double.parse(itemsModel.itemsPrice!).round()} درهم", // ✅ تحويل السعر إلى عدد صحيح فقط
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     color: Colors.orange,
//                     fontFamily:"cairo",
//
//                     fontSize: 10,
//                     fontWeight: FontWeight.bold,
//                     decoration: TextDecoration.lineThrough,
//                   ),
//                 ),
//               ] else
//               // ✅ إذا لم يكن هناك خصم، يتم عرض السعر العادي فقط
//                 Text(
//                   "${double.parse(itemsModel.itemsPrice!).toInt()} درهم", // ✅ تحويل السعر إلى عدد صحيح فقط
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                     color: AppColor.primaryColor2,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                       fontFamily:"cairo"
//
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ],
//               )
//     );
//
//   }
// }

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../controller/items_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double discount = double.tryParse(itemsModel.discount?.discountPercentage ?? "0") ?? 0.0;
    String? expiresAt = itemsModel.discount?.expiresAt;

    bool hasValidDiscount = false;
    if (discount > 0 && expiresAt != null) {
      DateTime now = DateTime.now();
      DateTime expiry = DateTime.tryParse(expiresAt) ?? now.subtract(Duration(days: 1));
      hasValidDiscount = expiry.isAfter(now);
    }

    double originalPrice = double.tryParse(itemsModel.itemsPrice ?? "0") ?? 0.0;
    double discountedPrice = originalPrice - (originalPrice * (discount / 100));

    return InkWell(
      onTap: () {
        controller.goToPageProductDetails(itemsModel);
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
                  imageUrl: itemsModel.itemsImage != null
                      ? "${AppLink.imagesItems}/${itemsModel.itemsImage}"
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
                        fontFamily: "cairo",
                        fontSize: 8,
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
                      if (itemsModel.itemsId != null) {
                        cartController.add(itemsModel.itemsId!.toString());
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
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${itemsModel.itemsName}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColor.primaryColor,
                    fontSize: 13,
                    fontFamily: "ttf",
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                if (hasValidDiscount) ...[
                  Text(
                    "${discountedPrice.round()} درهم",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColor.primaryColor2,
                      fontFamily: "cairo",
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "${originalPrice.round()} درهم",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontFamily: "cairo",
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ] else
                  Text(
                    "${originalPrice.toInt()} درهم",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColor.primaryColor2,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "cairo",
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

