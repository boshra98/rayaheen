import 'package:rayaheen_bookstore/controller/productdetails_controller.dart';
import 'package:rayaheen_bookstore/core/class/handlingdataview.dart';
import 'package:rayaheen_bookstore/core/constant/color.dart';
import 'package:rayaheen_bookstore/core/constant/routes.dart';
import 'package:rayaheen_bookstore/view/widget/productdetails/priceandcount.dart';
import 'package:rayaheen_bookstore/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';




// class ProductDetails extends StatelessWidget {
//   const ProductDetails({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
//
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 2,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: AppColor.primaryColor),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         centerTitle: true,
//         title:  Text(
//           '114'.tr,
//           style: TextStyle(color: AppColor.primaryColor),
//         ),
//     actions: [
//     IconButton(
//     icon: const Icon(Icons.share, color: AppColor.primaryColor),
//     onPressed: () {
//     final String? productName = controller.itemsModel.itemsName;
//     final int? productId = controller.itemsModel.itemsId;
//
//     if (productId == null || productName == null) return;
//
//     final String deepLink = "rayaheenbooks://product/$productId";
//     final String androidFallback = "https://play.google.com/store/apps/details?id=com.rayaheenbooks.store";
//     final String iosFallback = "https://apps.apple.com/ae/app/رياحين/id6742656987";
//
//     final String message = '''
// 📚 تصفح هذا المنتج: $productName
// 📲 $deepLink
//
// إذا لم يكن التطبيق مثبتًا، قم بتحميله من هنا:
// 🔗 Android: $androidFallback
// 🔗 iOS: $iosFallback
// ''';
//
//     Share.share(message);
//     },
//     ),
//     ],
//
//       ),
//
//     body: GetBuilder<ProductDetailsControllerImp>(
//         builder: (controller) => ListView(
//           children: [
//             const TopProductPageDetails(),
//             const SizedBox(height: 100),
//             HandlingDataView(
//               statusRequest: controller.statusRequest,
//               widget: Container(
//                 padding: const EdgeInsets.all(20),
//                 child: Directionality(
//                   textDirection: TextDirection.rtl,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "${controller.itemsModel.itemsName}",
//                         textAlign: TextAlign.right,
//                         style: Theme.of(context).textTheme.displayLarge!.copyWith(
//                           color: AppColor.primaryColor2,
//                           fontFamily: "ttf",
//                           fontSize: 33,
//                         ),
//                       ),
//                       const SizedBox(height: 20),
//
//                       /// **إظهار رسالة "نفذت الكمية" عند عدم توفر المنتج**
//                       if (controller.itemsModel.itemsCount == 0)
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: Text(
//                             "نفذت الكمية ❌",
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                               color: Colors.red,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           /// **تعطيل زر الإضافة إذا نفذت الكمية**
//                           Flexible(
//                             flex: 2,
//                             child: PriceAndCountItems(
//                               onAdd: controller.itemsModel.itemsCount! > 0
//                                   ? controller.add
//                                   : null, // تعطيل زر الإضافة
//                               onRemove: controller.remove,
//                               price: "${controller.itemsModel.itemsPrice}",
//                               discountPercentage: controller.itemsModel.discount?.discountPercentage, // ✅ تمرير نسبة الخصم مباشرة من البيانات المرجعة من الباكند
//                               expiresAt: controller.itemsModel.discount?.expiresAt,
//
//                               count: "${controller.countitems}",
//
//                             )
//
//                           ),
//
//                           const SizedBox(width: 0),
//
//                           Expanded(
//                             flex: 2,
//                             child: Padding(
//                               padding: const EdgeInsets.only(top: 40.0),
//                               child:ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   minimumSize: const Size(400, 40),
//                                   elevation: 5,
//                                   backgroundColor: controller.itemsModel.itemsCount! > 0
//                                       ? AppColor.primaryColor2
//                                       : Colors.grey, // تغيير اللون عند نفاذ الكمية
//                                   shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                                 onPressed: controller.itemsModel.itemsCount! > 0
//                                     ? ()  {
//                                   controller.add();
//                                 //  await Get.find<CartController>().add(controller.itemsModel.itemsId!.toString());
//
//                                   //Get.find<CartController>().add(); // ✅ تحديث السلة عند إضافة منتج
//                                   // await Get.find<CartController>().add(product.id);
//
//                                   // Get.toNamed(AppRoute.cart);// استدعاء دالة إضافة المنتج بدلاً من الانتقال إلى السلة
//                                 }
//                                     : null, // تعطيل الزر عند نفاذ الكمية
//                                 child: Text(
//                                   "64".tr, // يمكن تغيير النص ليعكس الوظيفة الجديدة
//                                   style: const TextStyle(
//                                     color: AppColor.secondColor,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                               ),
//
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 15),
//
//                       Text(
//                         "${controller.itemsModel.itemsDesc}",
//                         textAlign: TextAlign.right,
//                         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                           color: AppColor.primaryColor,
//                           fontFamily: "ttf",
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//
//                       Text(
//                         "الكاتب: ${controller.itemsModel.author}",
//                         textAlign: TextAlign.left,
//                         style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                           color: AppColor.primaryColor2,
//                           fontFamily: "ttf",
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//
//                       Text(
//                         "دار النشر : ${controller.itemsModel.publisher}",
//                         textAlign: TextAlign.left,
//                         style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                           color: AppColor.primaryColor2,
//                           fontFamily: "ttf",
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//
//   }
// }


import '../../../data/model/itemsmodel.dart';


// class ProductDetails extends StatelessWidget {
//   final ItemsModel? item;
//
//   const ProductDetails({Key? key, this.item}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
//
//     // ✅ استخدم العنصر الممرر إن وجد، وإلا استخدم العنصر الموجود في الكونترولر
//     final ItemsModel usedItem = item ?? controller.itemsModel;
//     controller.itemsModel = usedItem;
//     controller.countitems = 1;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 2,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: AppColor.primaryColor),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         centerTitle: true,
//         title: Text(
//           '114'.tr,
//           style: TextStyle(color: AppColor.primaryColor),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.share, color: AppColor.primaryColor),
//             onPressed: () {
//               final String? productName = usedItem.itemsName;
//               final int? productId = usedItem.itemsId;
//
//               if (productId == null || productName == null) return;
//
//               // رابط ذكي من موقعك
//               final String webLink = "https://rayaheenbooks.com/deeplink.html?id=$productId";
//
//               final String message = '''
// 📚 تصفح هذا المنتج: $productName
// 📲 $webLink
//
// إذا لم يكن التطبيق مثبتًا، سيتم توجيهك لتحميله تلقائيًا.
// ''';
//
//               Share.share(message);
//             },
//           ),
//         ],
//
//       ),
//       body: ListView(
//         children: [
//          // const TopProductPageDetails(),
//           TopProductPageDetails(item: usedItem),
//
//           const SizedBox(height: 100),
//           Padding(
//             padding: const EdgeInsets.all(20),
//             child: Directionality(
//               textDirection: TextDirection.rtl,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     usedItem.itemsName ?? '',
//                     textAlign: TextAlign.right,
//                     style: Theme.of(context).textTheme.displayLarge!.copyWith(
//                       color: AppColor.primaryColor2,
//                       fontFamily: "ttf",
//                       fontSize: 33,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//
//                   if (usedItem.itemsCount == 0)
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: Text(
//                         "نفذت الكمية ❌",
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           color: Colors.red,
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                         flex: 2,
//                         child: PriceAndCountItems(
//                           onAdd: usedItem.itemsCount! > 0 ? () {} : null,
//                           onRemove: () {},
//                           price: "${usedItem.itemsPrice}",
//                           discountPercentage: usedItem.discount?.discountPercentage,
//                           expiresAt: usedItem.discount?.expiresAt,
//                           count: "1",
//                         ),
//                       ),
//                       const SizedBox(width: 0),
//                       Expanded(
//                         flex: 2,
//                         child: Padding(
//                           padding: const EdgeInsets.only(top: 40.0),
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               minimumSize: const Size(400, 40),
//                               elevation: 5,
//                               backgroundColor: usedItem.itemsCount! > 0
//                                   ? AppColor.primaryColor2
//                                   : Colors.grey,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             onPressed: usedItem.itemsCount! > 0 ? () {} : null,
//                             child: Text(
//                               "64".tr,
//                               style: const TextStyle(
//                                 color: AppColor.secondColor,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 14,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 15),
//                   Text(
//                     usedItem.itemsDesc ?? '',
//                     textAlign: TextAlign.right,
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                       color: AppColor.primaryColor,
//                       fontFamily: "ttf",
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     "الكاتب: ${usedItem.author ?? ''}",
//                     textAlign: TextAlign.left,
//                     style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                       color: AppColor.primaryColor2,
//                       fontFamily: "ttf",
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Text(
//                     "دار النشر : ${usedItem.publisher ?? ''}",
//                     textAlign: TextAlign.left,
//                     style: Theme.of(context).textTheme.titleSmall!.copyWith(
//                       color: AppColor.primaryColor2,
//                       fontFamily: "ttf",
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../controller/productdetails_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../view/widget/productdetails/priceandcount.dart';
import '../../../view/widget/productdetails/toppageproductdetails.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../controller/productdetails_controller.dart';
import '../../../core/constant/color.dart';
import '../../../view/widget/productdetails/priceandcount.dart';
import '../../../view/widget/productdetails/toppageproductdetails.dart';
import '../../../data/model/itemsmodel.dart';

// class ProductDetails extends StatelessWidget {
//   final ItemsModel item;
//
//   const ProductDetails({Key? key, required this.item}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
//
//     // استخدم العنصر الممرر
//     controller.itemsModel = item;
//     controller.countitems = 1;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(item.itemsName ?? ''),
//         backgroundColor: Colors.white,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.share),
//             onPressed: () {
//               final String webLink = "https://rayaheenbooks.com/deeplink.html?id=${item.itemsId}";
//               Share.share("📚 ${item.itemsName}\n📲 $webLink");
//             },
//           ),
//         ],
//       ),
//       body: GetBuilder<ProductDetailsControllerImp>(
//         builder: (_) => ListView(
//           children: [
//             TopProductPageDetails(item: item), // ✅ تمرير العنصر لعرض الصورة
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     item.itemsName ?? '',
//                     style: Theme.of(context).textTheme.headline6,
//                   ),
//                   const SizedBox(height: 10),
//                   if (item.itemsCount == 0)
//                     const Text("نفذت الكمية ❌", style: TextStyle(color: Colors.red)),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                         flex: 2,
//                         child: PriceAndCountItems(
//                           onAdd: item.itemsCount! > 0 ? controller.add : null,
//                           onRemove: controller.remove,
//                           price: "${item.itemsPrice}",
//                           discountPercentage: item.discount?.discountPercentage,
//                           expiresAt: item.discount?.expiresAt,
//                           count: "${controller.countitems}",
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Expanded(
//                         flex: 2,
//                         child: ElevatedButton(
//                           onPressed: item.itemsCount! > 0 ? controller.add : null,
//                           child: const Text("أضف إلى السلة"),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   Text(item.itemsDesc ?? ''),
//                   const SizedBox(height: 10),
//                   Text("الكاتب: ${item.author ?? ''}"),
//                   Text("دار النشر: ${item.publisher ?? ''}"),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


class ProductDetails extends StatelessWidget {
  final ItemsModel item;

  const ProductDetails({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());
   // final ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp(), tag: UniqueKey().toString());
    final ProductDetailsControllerImp controller = Get.find();

    // استخدم العنصر الممرر
    //controller.itemsModel = item;
    //controller.countitems = 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(item.itemsName ?? '',style: TextStyle(color: AppColor.primaryColor),)
        //   style: TextStyle(color: AppColor.primaryColor),
        ,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColor.primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        // title: Text(
        //   'تفاصيل المنتج',
        //   style: TextStyle(color: AppColor.primaryColor),
        // ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: AppColor.primaryColor),
            onPressed: () {
              // final String webLink = "https://rayaheenbooks.com/deeplink.html?id=${item.itemsId}";
              // Share.share("\ud83d\udcda ${item.itemsName}\n\ud83d\udcf2 $webLink");

              final String webLink = "https://rayaheenbooks.com/deeplink.html?id=${item.itemsId}";
              Share.share("📚 ${item.itemsName}\n🔗 $webLink");

              // final String deepLink = "rayaheenbooks://product/${item.itemsId}";
              // Share.share("📚 ${item.itemsName}\n🔗 $deepLink");
            },
          ),
        ],
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (_) => ListView(
          children: [
            TopProductPageDetails(item: item),
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
                        "${item.itemsName}",
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: AppColor.primaryColor2,
                          fontFamily: "ttf",
                          fontSize: 33,
                        ),
                      ),
                      const SizedBox(height: 20),
                      if (item.itemsCount == 0)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "نفذت الكمية \u274c",
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
                          Flexible(
                            flex: 2,
                            child: PriceAndCountItems(
                              onAdd: item.itemsCount! > 0 ? controller.add : null,
                              onRemove: controller.remove,
                              price: "${item.itemsPrice}",
                              discountPercentage: item.discount?.discountPercentage,
                              expiresAt: item.discount?.expiresAt,
                              count: "${controller.countitems}",
                            ),
                          ),
                          const SizedBox(width: 0),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(400, 40),
                                  elevation: 5,
                                  backgroundColor: item.itemsCount! > 0
                                      ? AppColor.primaryColor2
                                      : Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: item.itemsCount! > 0 ? controller.add : null,
                                child: const Text(
                                  "أضف إلى السلة",
                                  style: TextStyle(
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
                        "${item.itemsDesc}",
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
                        "الكاتب: ${item.author ?? ''}",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: AppColor.primaryColor2,
                          fontFamily: "ttf",
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "دار النشر : ${item.publisher ?? ''}",
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

