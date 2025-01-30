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


class CustomListItems extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;

  const CustomListItems({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        // The card
        InkWell(
          onTap: () {
            controller.goToPageProductDetails(itemsModel);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6), // Adjust spacing as needed
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
                              imageUrl: AppLink.imagesItems + "/" + itemsModel.itemsImage!,
                              height: 100,
                              width:100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Cart Icon Positioned at Bottom-Left of the Card

                    Positioned(
                      bottom: 0,
                      left: 1,
                    child: Container(
                      width: 33,
                    height:33,
                    decoration: BoxDecoration(
                    color: AppColor.primaryColor2,

                    borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.all(3),
                      child: IconButton(
                        onPressed: () {
                          // Handle adding to cart
                          controller.goToPageProductDetails(itemsModel);
                        },
                        icon: const Icon(
                          Icons.shopping_cart_outlined,
                          size: 18, // Smaller icon size
                          color: AppColor.secondColor,
                        ),
                        // constraints: const BoxConstraints(
                        //   maxHeight: 20,
                        //   maxWidth: 20,
                        // ),
                        padding:const  EdgeInsets.only(right: 10, left: 4, bottom: 5),
                      ),
                    )
                    ),
                  ],
                ),
              ),
            ),
          ),



        ),

        // Item name outside the card and centered below
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ensures the column wraps its content
            crossAxisAlignment: CrossAxisAlignment.center, // Centers the text
            children: [
              // Item Name
              Text(
                "${itemsModel.itemsName}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 15,
                  fontFamily: "ttf",
                  fontWeight: FontWeight.w500, // Optional styling

                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              // Item Price
              Text(
                "${itemsModel.itemsPrice } درهم " ,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColor.primaryColor2, // Use a different color for the price
                  fontSize: 14,       // Slightly smaller font size for the price
                  fontWeight: FontWeight.w500, // Optional styling
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
