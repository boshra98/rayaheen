import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';



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
  final ItemsModel itemsModel;

  const ItemsHome2({Key? key, required this.itemsModel}) : super(key: key);

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
                height: 120, // Reduced height
                width: 130, // Reduced width for proportional scaling
              ),

              // Image Positioned at the Center
              Positioned(
                top: 5,
                left: 5,
                right: 5,
                child: CachedNetworkImage(
                  imageUrl: "${AppLink.imagesItems}/${itemsModel.itemsImage!}",
                  height: 90, // Reduced height
                  width: 90,  // Reduced width
                  fit: BoxFit.contain, // Use BoxFit.contain to show the full image
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
                    height:30,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor2,

                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.all(1),
                    child: IconButton(
                      onPressed: () {
                        // Handle adding to cart
                        //controller.goToPageProductDetails(itemsModel);
                      },
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 14, // Smaller icon size
                        color: AppColor.secondColor,
                      ),
                      // constraints: const BoxConstraints(
                      //   maxHeight: 20,
                      //   maxWidth: 20,
                      // ),
                      padding:const  EdgeInsets.only(right: 10, left: 8, bottom: 2),
                    ),
                  )
              ),

            ],
          ),

          // Text Below the Stack
          Text(
            "${itemsModel.itemsName}",
            style: const TextStyle(
              color: AppColor.primaryColor,
              //fontWeight: FontWeight.bold,
              fontSize: 12, // Slightly smaller font size
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            "${itemsModel.itemsPrice} درهم ",
            style: const TextStyle(
              color: AppColor.primaryColor2,
              //fontWeight: FontWeight.bold,
              fontSize: 10, // Slightly smaller font size
            ),
            textAlign: TextAlign.center,
          ),

        ],
      ),
    );
  }
}