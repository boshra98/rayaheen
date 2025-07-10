import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../screen/itemfromlinkshare.dart';
import '../../screen/productdetails.dart';
// // //
// // // class ProductDetailsFromLink extends StatelessWidget {
// // //   final int productId;
// // //
// // //   const ProductDetailsFromLink({Key? key, required this.productId}) : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final HomeControllerImp controller = Get.put(HomeControllerImp());
// // //
// // //     return FutureBuilder(
// // //       future: controller.loadProductById(productId),
// // //       builder: (context, snapshot) {
// // //         if (snapshot.connectionState == ConnectionState.waiting) {
// // //           return const Scaffold(
// // //             body: Center(child: CircularProgressIndicator()),
// // //           );
// // //         } else if (controller.itemsModel.itemsId == null) {
// // //           return const Scaffold(
// // //             body: Center(child: Text("لم يتم العثور على المنتج ❌")),
// // //           );
// // //         } else {
// // //           return const ProductDetails();
// // //         }
// // //       },
// // //     );
// // //   }
// // // }
// // //
// //
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaheen_bookstore/controller/home_controller.dart';
import 'package:rayaheen_bookstore/core/class/statusrequest.dart';
import 'package:rayaheen_bookstore/data/model/itemsmodel.dart';
// //
// // import '../../screen/productdetails.dart';
// //
// // class ProductDetailsFromLink extends StatelessWidget {
// //   final int productId;
// //
// //   const ProductDetailsFromLink({Key? key, required this.productId}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final HomeControllerImp controller = Get.put(HomeControllerImp());
// //
// //     return FutureBuilder(
// //       future: controller.loadProductById(productId),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return const Scaffold(
// //             body: Center(child: CircularProgressIndicator()),
// //           );
// //         } else if (controller.statusRequest == StatusRequest.failure ||
// //             controller.itemsModel.itemsId == null) {
// //           return const Scaffold(
// //             body: Center(child: Text("لم يتم العثور على المنتج ❌")),
// //           );
// //         } else {
// //           return ProductDetails(item: controller.itemsModel);
// //         }
// //       },
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:rayaheen_bookstore/controller/home_controller.dart';
// import 'package:rayaheen_bookstore/core/class/statusrequest.dart';
// import 'package:rayaheen_bookstore/data/model/itemsmodel.dart';
// import 'package:rayaheen_bookstore/view/screen/productdetails.dart';
//
// import '../../screen/itemfromlinkshare.dart';
//
// // class ProductDetailsFromLink extends StatelessWidget {
// //   final int productId;
// //
// //   const ProductDetailsFromLink({Key? key, required this.productId}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final HomeControllerImp controller = Get.put(HomeControllerImp());
// //
// //     return FutureBuilder<ItemsModel?>(
// //       future: controller.loadProductById(productId),
// //       builder: (context, snapshot) {
// //         if (snapshot.connectionState == ConnectionState.waiting) {
// //           return const Scaffold(
// //             body: Center(child: CircularProgressIndicator()),
// //           );
// //         }
// //
// //         if (!snapshot.hasData || snapshot.data == null) {
// //           return const Scaffold(
// //             body: Center(child: Text("❌ لم يتم العثور على المنتج")),
// //           );
// //         }
// //
// //         // تمرير البيانات مباشرة إلى صفحة التفاصيل
// //         return ItemFromLinkPage(item: snapshot.data!);
// //       },
// //     );
// //   }
// // }
// class ProductDetailsFromLink extends StatelessWidget {
//   final int productId;
//   const ProductDetailsFromLink({Key? key, required this.productId}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(HomeControllerImp());
//
//     return FutureBuilder<ItemsModel?>(
//       future: controller.loadProductById(productId),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Scaffold(body: Center(child: CircularProgressIndicator()));
//         }
//
//         if (!snapshot.hasData || snapshot.data == null) {
//           return const Scaffold(body: Center(child: Text("❌ لم يتم العثور على المنتج")));
//         }
//
//         return ProductDetails(item: snapshot.data!); // ← ⚠️ تأكد من أنها تستخدم data مباشرة
//       },
//     );
//   }
// }


class ProductDetailsFromLink extends StatelessWidget {
  final int productId;
  const ProductDetailsFromLink({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // final controller = Get.put(HomeControllerImp());
    final controller = Get.find<HomeControllerImp>();

    return FutureBuilder<ItemsModel?>(
      future: controller.loadProductById(productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (!snapshot.hasData || snapshot.data == null) {
          return const Scaffold(body: Center(child: Text("❌ لم يتم العثور على المنتج")));
        }

        final item = snapshot.data!;

        return ItemFromLinkPage(item: item); // ← هذا الكلاس الذي تسأل عنه
      },
    );
  }
}
