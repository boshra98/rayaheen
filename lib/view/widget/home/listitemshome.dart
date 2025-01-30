import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';
import '../../screen/newitems.dart';
import 'listitemshome2.dart';



// class ListItemsHome extends GetView<HomeControllerImp> {
//   const ListItemsHome({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Ensure the controller is available
//     Get.put(HomeControllerImp());
//
//     return GetBuilder<HomeControllerImp>(
//       builder: (controller) {
//         // Check if items are still loading
//         if (controller.items.isEmpty) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//
//         return SizedBox(
//           height: 130,
//           child: ListView.builder(
//             itemCount: controller.items.length,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (context, i) {
//               final itemsModel = ItemsModel.fromJson(controller.items[i]);
//
//               return ItemsHome(
//                 itemsModel: itemsModel,
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({Key? key}) : super(key: key);

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
          height: 130,
          child: ListView.builder(
            //itemCount: controller.newitems.length,
            itemCount: controller.newitems.length > 9 ? 10 : controller.newitems.length, // Show up to 9 items + "More" button

            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              if (i == 9) {
                // If it's the 10th item (index 9), show the "More" button
                return
                  Padding(
                      padding: const EdgeInsets.only(top: 20), // Moves down by 20 pixels
                child:  Align(
                      //alignment: const Alignment(0.0, -0.8), // Moves it slightly down

                      alignment: Alignment.topCenter, // Centers it horizontally at the top

                child:  GestureDetector(
                  onTap: () {
                    Get.to(() => NewItemsPage(items: [],)); // Navigate to full items page
                  },

                  child: Container(
                    alignment: Alignment.center,
                   // margin: const EdgeInsets.only(top: 8),// Add margin if needed
                    width: 50, // Small width for the button
                    height: 50,
                 // alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 10,vertical:8),
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor2.withOpacity(0.8),
                      //borderRadius: BorderRadius.circular(30),
                      shape: BoxShape.circle, // ✅ Make it circular

                    ),
                    child: const Text(
                      ">",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColor.secondColor,
                      ),
                    ),
                  ),
                )
                )
                );
              }

              // Normal item display
              final itemsModel = ItemsModel.fromJson(controller.newitems[i]);
              return ItemsHome(itemsModel: itemsModel);
            },
          ),
        );
      },
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;

  const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(itemsModel.itemsId);
        // Call the function to navigate to product details page
       Get.find<HomeControllerImp>().goToPageProductDetails(itemsModel);

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
                  //thirdColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15), // Adjust radius if needed
                ),
                height: 90, // Reduced height
                width: 100, // Reduced width for proportional scaling
              ),

              // Image Positioned at the Center
              Positioned(
                top: 5,
                left: 5,
                right: 5,
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imagesItems}/${itemsModel.itemsImage!}",
                  height: 70, // Reduced height
                  width: 70,  // Reduced width
                  fit: BoxFit.contain, // Use BoxFit.contain to show the full image
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ],
          ),

          // Text Below the Stack
          Text(
            "${itemsModel.itemsName}",
            style: const TextStyle(
              color: AppColor.primaryColor,
              //fontWeight: FontWeight.bold,
              fontSize: 10, // Slightly smaller font size
            ),
            textAlign: TextAlign.center,
          ),
          // Text(
          //   "${itemsModel.itemsPrice}",
          //   style: const TextStyle(
          //     color: AppColor.primaryColor,
          //     //fontWeight: FontWeight.bold,
          //     fontSize: 10, // Slightly smaller font size
          //   ),
          //   textAlign: TextAlign.center,
          // ),
        ],
      ),
    );
  }
}