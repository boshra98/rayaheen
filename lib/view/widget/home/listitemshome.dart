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
            itemCount: controller.newitems.length > 9 ? 10 : controller.newitems.length, // عرض حتى 9 عناصر + زر "المزيد"
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              if (i == 9) {
                // زر "المزيد" عند العنصر العاشر
                return Padding(
                  padding: const EdgeInsets.only(top: 20), // إزاحة للأسفل بمقدار 20 بكسل
                  child: Align(
                    alignment: Alignment.topCenter, // محاذاة في الأعلى
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => NewItemsPage(items: [])); // الانتقال إلى صفحة العناصر الجديدة
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 50, // عرض صغير للزر
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor2.withOpacity(0.8),
                          shape: BoxShape.circle, // جعل الزر دائريًا
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
                    ),
                  ),
                );
              }

              // التحقق من أن العنصر موجود وغير فارغ قبل تحويله إلى كائن ItemsModel
              if (i >= controller.newitems.length || controller.newitems[i] == null) {
                return const SizedBox.shrink(); // لا تعرض أي شيء إذا كان العنصر غير صالح
              }

              // تحويل العنصر إلى كائن ItemsModel
              final itemsModel = ItemsModel.fromJson(controller.newitems[i]);

              return ItemsHome(itemsModel: itemsModel);
            },
          ),


        );
      },
    );
  }
}

// class ItemsHome extends StatelessWidget {
//   final ItemsModel itemsModel;
//
//   const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         print(itemsModel.itemsId);
//         // Call the function to navigate to product details page
//        Get.find<HomeControllerImp>().goToPageProductDetails(itemsModel);
//
//       },
//       child: Column(
//         children: [
//           // Stack with Image and Background
//           Stack(
//             children: [
//               // Background Container with Rounded Corners
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 decoration: BoxDecoration(
//                   color: AppColor.secondColor.withOpacity(1),
//                   //thirdColor.withOpacity(0.3),
//                   borderRadius: BorderRadius.circular(15), // Adjust radius if needed
//                 ),
//                 height: 90, // Reduced height
//                 width: 100, // Reduced width for proportional scaling
//               ),
//
//               // Image Positioned at the Center
//               Positioned(
//                 top: 5,
//                 left: 5,
//                 right: 5,
//                 child: CachedNetworkImage(
//                   imageUrl: "${AppLink.imagesItems}/${itemsModel.itemsImage!}",
//                   height: 70, // Reduced height
//                   width: 70,  // Reduced width
//                   fit: BoxFit.contain, // Use BoxFit.contain to show the full image
//                   placeholder: (context, url) => const Center(
//                     child: CircularProgressIndicator(),
//                   ),
//                   errorWidget: (context, url, error) => const Icon(Icons.error),
//                 ),
//               ),
//             ],
//           ),
//
//           // Text Below the Stack
//           Text(
//             "${itemsModel.itemsName}",
//             style: const TextStyle(
//               color: AppColor.primaryColor,
//               //fontWeight: FontWeight.bold,
//               fontSize: 10, // Slightly smaller font size
//             ),
//             textAlign: TextAlign.center,
//           ),
//           // Text(
//           //   "${itemsModel.itemsPrice}",
//           //   style: const TextStyle(
//           //     color: AppColor.primaryColor,
//           //     //fontWeight: FontWeight.bold,
//           //     fontSize: 10, // Slightly smaller font size
//           //   ),
//           //   textAlign: TextAlign.center,
//           // ),
//         ],
//       ),
//     );
//   }
// }

class ItemsHome extends StatelessWidget {
  final ItemsModel? itemsModel;

  const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (itemsModel == null) {
      return const Center(
        child: Text("Error: Item not found"),
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
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: AppColor.secondColor.withOpacity(1),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 90,
                width: 100,
              ),
              Positioned(
                top: 5,
                left: 5,
                right: 5,
                child: CachedNetworkImage(
                  imageUrl: itemsModel!.itemsImage != null
                      ? "${AppLink.imagesItems}/${itemsModel!.itemsImage}"
                      : "https://via.placeholder.com/70", // Placeholder image
                  height: 70,
                  width: 70,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
              ),
            ],
          ),
          Text(
            itemsModel!.itemsName ?? "Unknown",
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
