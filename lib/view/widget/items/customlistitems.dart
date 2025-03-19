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
//   const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         controller.goToPageProductDetails(itemsModel);
//       },
//       child: Card(
//         color: AppColor.secondColor,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           child: Center(
//             // Ensures the content is centered within the Card
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center, // Centers content vertically
//               crossAxisAlignment: CrossAxisAlignment.center, // Centers content horizontally
//               children: [
//                 // Image (Takes more space)
//                 Hero(
//                   tag: "${itemsModel.itemsId}",
//                   child: CachedNetworkImage(
//                     imageUrl: AppLink.imagesItems + "/" + itemsModel.itemsImage!,
//                     height: 140, // Increase the height of the image
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 const SizedBox(height: 0), // Add spacing between elements
//
//                 // Item Name
//                 Flexible(
//                   child: Text(
//                     "${itemsModel.itemsName}",
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       color: AppColor.primaryColor2,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     overflow: TextOverflow.ellipsis, // Prevent text overflow
//                     maxLines: 2, // Limit text to 2 lines
//                   ),
//                 ),
//                 const SizedBox(height: 10), // Add spacing between elements
//
//                 // Row for Favorite and Shopping Cart Icons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center, // Centers icons horizontally
//                   children: [
//                     // Favorite Icon
//                     GetBuilder<FavoriteController>(
//                       builder: (controller) => IconButton(
//                         onPressed: () {
//                           if (controller.isFavorite[itemsModel.itemsId] == "1") {
//                             controller.setFavorite(itemsModel.itemsId, "0");
//                             controller.removeFavorite(itemsModel.itemsId!);
//                           } else {
//                             controller.setFavorite(itemsModel.itemsId, "1");
//                             controller.addFavorite(itemsModel.itemsId!);
//                           }
//                         },
//                         icon: Icon(
//                           controller.isFavorite[itemsModel.itemsId] == "1"
//                               ? Icons.favorite
//                               : Icons.favorite_border_outlined,
//                           color: AppColor.primaryColor2,
//                         ),
//                       ),
//                     ),
//
//                     // Horizontal Spacing between icons
//                     const SizedBox(width: 10),
//
//                     // Shopping Cart Icon
//                     IconButton(
//                       onPressed: () {
//                         controller.goToPageProductDetails(itemsModel);
//                       },
//                       icon: const Icon(
//                         Icons.shopping_cart_outlined, // Shopping cart icon
//                         color: AppColor.primaryColor2,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// class CustomListItems extends GetView<ItemsControllerImp> {
//   final ItemsModel itemsModel;
//
//   const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       //mainAxisAlignment: MainAxisAlignment.center,
//       //crossAxisAlignment: CrossAxisAlignment.center,
//
//       children: [
//         // The card
//         InkWell(
//           onTap: () {
//             controller.goToPageProductDetails(itemsModel);
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 6), // Adjust spacing as needed
//             child: Card(
//               color: AppColor.secondColor,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                 child: Stack(
//                   children: [
//                     // Main Column for Image and Details
//                     Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           // Main Image
//                           Hero(
//                             tag: "${itemsModel.itemsId}",
//                             child: CachedNetworkImage(
//                               imageUrl: AppLink.imagesItems + "/" + itemsModel.itemsImage!,
//                               height: 100,
//                               width:100,
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Cart Icon Positioned at Bottom-Left of the Card
//
//                     Positioned(
//                       bottom: 0,
//                       left: 1,
//                       child: Container(
//                         width: 33,
//                         height: 33,
//                         decoration: BoxDecoration(
//                           color: AppColor.primaryColor2,
//                           shape: BoxShape.circle, // ✅ جعل الحاوية دائرية تمامًا
//                         ),
//                         child: Center( // ✅ توسيط `IconButton` داخل الدائرة
//                           child: IconButton(
//                             onPressed: () {
//                               final CartController cartController = Get.find<CartController>(); // ✅ استرجاع `CartController`
//
//                               if (itemsModel!.itemsId != null) {
//                                 cartController.add(itemsModel!.itemsId!.toString()); // ✅ تحويل `int` إلى `String`
//                               }
//                             },
//                             icon: const Icon(
//                               Icons.shopping_cart_outlined,
//                               size: 18,
//                               color: AppColor.secondColor,
//                             ),
//                             padding: EdgeInsets.zero, // ✅ إزالة أي هوامش داخل `IconButton`
//                             constraints: BoxConstraints(), // ✅ التأكد من عدم وجود حدود إضافية
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//
//
//         ),
//
//         // Item name outside the card and centered below
//         Padding(
//           padding: const EdgeInsets.only(top: 5),
//           child: Column(
//             mainAxisSize: MainAxisSize.min, // Ensures the column wraps its content
//             crossAxisAlignment: CrossAxisAlignment.center, // Centers the text
//             children: [
//               // Item Name
//               Text(
//                 "${itemsModel.itemsName}",
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   color: AppColor.primaryColor,
//                   fontSize: 13,
//                   fontFamily: "ttf",
//                   fontWeight: FontWeight.w500, // Optional styling
//
//                 ),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//               ),
//               // Item Price
//               Text(
//                 "${itemsModel.itemsPrice } درهم " ,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                   color: AppColor.primaryColor2, // Use a different color for the price
//                   fontSize: 14,       // Slightly smaller font size for the price
//                   fontWeight: FontWeight.w500, // Optional styling
//                 ),
//               ),
//             ],
//           ),
//         ),
//
//       ],
//     );
//   }
// }


class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ✅ التحقق من وجود خصم
    double discount = double.tryParse(itemsModel.discount?.discountPercentage ?? "0") ?? 0.0;
    bool hasDiscount = discount > 0;
    double originalPrice = double.tryParse(itemsModel.itemsPrice ?? "0") ?? 0.0;
    double discountedPrice = originalPrice - (originalPrice * (discount / 100));

    return Column(
      children: [
        // The card
        InkWell(
          onTap: () {
            controller.goToPageProductDetails(itemsModel);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Card(
              color: AppColor.secondColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Stack(
                  children: [
                    // Main Column for Image and Details
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Main Image
                          Hero(
                            tag: "${itemsModel.itemsId}",
                            child: CachedNetworkImage(
                              imageUrl: "${AppLink.imagesItems}/${itemsModel.itemsImage}",
                              height: 100,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ✅ عرض نسبة الخصم على الصورة إذا كان هناك خصم
                    if (hasDiscount)
                      Positioned(
                        top: -5,
                        right: -5,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "-${discount.toInt()}%", // ✅ حذف الأرقام العشرية
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    // Cart Icon Positioned at Bottom-Left of the Card
                    Positioned(
                      bottom: 0,
                      left: 1,
                      child: Container(
                        width: 33,
                        height: 33,
                        decoration: const BoxDecoration(
                          color: AppColor.primaryColor2,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              final CartController cartController = Get.find<CartController>();
                              if (itemsModel.itemsId != null) {
                                cartController.add(itemsModel.itemsId!.toString());
                              }
                            },
                            icon: const Icon(
                              Icons.shopping_cart_outlined,
                              size: 18,
                              color: AppColor.secondColor,
                            ),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Item name and price outside the card
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ✅ اسم المنتج
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

              // ✅ إذا كان هناك خصم، يتم عرض السعر بعد الحسم والسعر الأصلي
              if (hasDiscount) ...[
                // ✅ السعر بعد الحسم
                Text(
                  "${discountedPrice.toStringAsFixed(2)} درهم",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // ✅ السعر الأصلي (مشطوب)
                // Text(
                //   "${itemsModel.itemsPrice} درهم",
                //   textAlign: TextAlign.center,
                //   style: const TextStyle(
                //     color: Colors.orange,
                //     fontSize: 12,
                //     fontWeight: FontWeight.bold,
                //     decoration: TextDecoration.lineThrough,
                //   ),
                // ),
              ] else
              // ✅ إذا لم يكن هناك خصم، يتم عرض السعر العادي فقط
                Text(
                  "${itemsModel.itemsPrice} درهم",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColor.primaryColor2,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

