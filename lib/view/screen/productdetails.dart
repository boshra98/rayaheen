import 'package:rayaheen_bookstore/controller/productdetails_controller.dart';
import 'package:rayaheen_bookstore/core/class/handlingdataview.dart';
import 'package:rayaheen_bookstore/core/constant/color.dart';
import 'package:rayaheen_bookstore/core/constant/routes.dart';
import 'package:rayaheen_bookstore/view/widget/productdetails/priceandcount.dart';
import 'package:rayaheen_bookstore/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// class ProductDetails extends StatelessWidget {
//   const ProductDetails({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
//
//     return Scaffold(
//       // bottomNavigationBar: Container(
//       //   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       //   height: 40,
//       //   child: MaterialButton(
//       //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       //     color: AppColor.primaryColor2,
//       //     onPressed: () {
//       //       Get.toNamed(AppRoute.cart);
//       //     },
//       //     child:  Text(
//       //       "64".tr,
//       //       style: const TextStyle(color: AppColor.secondColor, fontWeight: FontWeight.bold),
//       //     ),
//       //   ),
//       // ),
//       body: GetBuilder<ProductDetailsControllerImp>(
//         builder: (controller) => ListView(
//           children: [
//             const TopProductPageDetails(),
//             const SizedBox(height: 100),
//             HandlingDataView(
//               statusRequest: controller.statusRequest,
//               widget: Container(
//                 padding: const EdgeInsets.all(20),
//                 child: Directionality( // Wrap the Column with Directionality
//                   textDirection: TextDirection.rtl,
//                 child: Column(
//
//                   crossAxisAlignment: CrossAxisAlignment.start, // Centering the item name
//                   children: [
//                     Text(
//                       "${controller.itemsModel.itemsName}",
//                       textAlign: TextAlign.right, // Centering the text
//                       style: Theme.of(context)
//                           .textTheme
//                           .displayLarge!
//                           .copyWith(
//                         color: AppColor.primaryColor2,
//                         fontFamily:"ttf",
//                          fontSize:33,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         // Count and Price Widget
//                         Expanded(
//                           flex: 2, // Allocate 2 parts of the row space
//                           child: PriceAndCountItems(
//                             onAdd: controller.add,
//                             onRemove: controller.remove,
//                             price: "${controller.itemsModel.itemsPrice}",
//                             count: "${controller.countitems}",
//                           ),
//                         ),
//                         const SizedBox(width: 0), // Space between widgets
//
//                         // Expanded Material Button
//
//                         Expanded(
//
//                           flex: 2, // Allocate 1 part of the row space
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 40.0), // Adjust the top padding value as needed
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 minimumSize: const Size(400, 40), // Adjust width and height as needed
//
//                                 elevation: 5,
//                                 backgroundColor: AppColor.primaryColor2,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                               ),
//                               onPressed: () {
//                                 Get.toNamed(AppRoute.cart);
//                                //  showDialog(
//                                //    context: context,
//                                //    builder: (BuildContext context) {
//                                //      return AlertDialog(
//                                //        title: Text("103".tr),
//                                //        content: Text("104".tr),
//                                //        actions: [
//                                //          Row(
//                                //            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align buttons to corners
//                                //            children: [
//                                //              TextButton(
//                                //                onPressed: () {
//                                //                  Navigator.of(context).pop(); // Close the dialog
//                                //                  Get.toNamed(AppRoute.cart); // Navigate to cart page
//                                //                },
//                                //                child: Text("105".tr, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
//                                //              ),
//                                //              TextButton(
//                                //                onPressed: () {
//                                //                  Navigator.of(context).pop(); // Close the dialog
//                                //                },
//                                //                child: Text("106".tr, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
//                                //              ),
//                                //            ],
//                                //          ),
//                                //        ],
//                                //      );
//                                  // },
//                                 //);
//                               },
//                               child: Text(
//                                 "64".tr,
//                                 style: const TextStyle(
//                                   color: AppColor.secondColor,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 15,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//
//                     const SizedBox(height: 15),
//                     // Description for items, aligned from left to right
//                     Text(
//                       "${controller.itemsModel.itemsDesc}",
//                       textAlign: TextAlign.right, // Aligning description to the left
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyMedium!
//                           .copyWith(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                        color: AppColor.primaryColor,
//                           fontFamily:"ttf",
//
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       "الكاتب: ${controller.itemsModel.author}",
//                       textAlign: TextAlign.left, // Aligning author to the left
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleSmall!
//                           .copyWith(
//                        // fontSize: 20,
//                        // fontWeight: FontWeight.w300,
//                         color: AppColor.primaryColor2,
//                           fontFamily:"ttf"
//
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       "دار النشر : ${controller.itemsModel.publisher}",
//                       textAlign: TextAlign.left, // Aligning publisher to the left
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleSmall!
//                           .copyWith(
//                        // fontSize: 20,
//                        // fontWeight: FontWeight.w300,
//                         color: AppColor.primaryColor2,
//                         fontFamily:"ttf",
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // Text(
//                     //   "سنة النشر : ${controller.itemsModel.year}",
//                     //   textAlign: TextAlign.left, // Aligning year to the left
//                     //   style: Theme.of(context)
//                     //       .textTheme
//                     //       .titleSmall!
//                     //       .copyWith(
//                     //   // fontSize: 20,
//                     //   //  fontWeight: FontWeight.w300,
//                     //    color: AppColor.grey2,
//                     //   ),
//                     // ),
//                   ],
//                 ),
//               )
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());


    return Scaffold(
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => ListView(
          children: [
            const TopProductPageDetails(),
            const SizedBox(height: 100),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(20),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.itemsModel.itemsName}",
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: AppColor.primaryColor2,
                          fontFamily: "ttf",
                          fontSize: 33,
                        ),
                      ),
                      const SizedBox(height: 20),

                      /// **إظهار رسالة "نفذت الكمية" عند عدم توفر المنتج**
                      if (controller.itemsModel.itemsCount == 0)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "نفذت الكمية ❌",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// **تعطيل زر الإضافة إذا نفذت الكمية**
                          Flexible(
                            flex: 2,
                            child: PriceAndCountItems(
                              onAdd: controller.itemsModel.itemsCount! > 0
                                  ? controller.add
                                  : null, // تعطيل زر الإضافة
                              onRemove: controller.remove,
                              price: "${controller.itemsModel.itemsPrice}",
                              discountPercentage: controller.itemsModel.discount?.discountPercentage, // ✅ تمرير نسبة الخصم مباشرة من البيانات المرجعة من الباكند
                              expiresAt: controller.itemsModel.discount?.expiresAt,

                              count: "${controller.countitems}",

                            )

                          ),

                          const SizedBox(width: 0),

                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child:ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(400, 40),
                                  elevation: 5,
                                  backgroundColor: controller.itemsModel.itemsCount! > 0
                                      ? AppColor.primaryColor2
                                      : Colors.grey, // تغيير اللون عند نفاذ الكمية
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: controller.itemsModel.itemsCount! > 0
                                    ? ()  {
                                  controller.add();
                                //  await Get.find<CartController>().add(controller.itemsModel.itemsId!.toString());

                                  //Get.find<CartController>().add(); // ✅ تحديث السلة عند إضافة منتج
                                  // await Get.find<CartController>().add(product.id);

                                  // Get.toNamed(AppRoute.cart);// استدعاء دالة إضافة المنتج بدلاً من الانتقال إلى السلة
                                }
                                    : null, // تعطيل الزر عند نفاذ الكمية
                                child: Text(
                                  "64".tr, // يمكن تغيير النص ليعكس الوظيفة الجديدة
                                  style: const TextStyle(
                                    color: AppColor.secondColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),

                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),

                      Text(
                        "${controller.itemsModel.itemsDesc}",
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primaryColor,
                          fontFamily: "ttf",
                        ),
                      ),
                      const SizedBox(height: 10),

                      Text(
                        "الكاتب: ${controller.itemsModel.author}",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColor.primaryColor2,
                          fontFamily: "ttf",
                        ),
                      ),
                      const SizedBox(height: 10),

                      Text(
                        "دار النشر : ${controller.itemsModel.publisher}",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColor.primaryColor2,
                          fontFamily: "ttf",
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}

