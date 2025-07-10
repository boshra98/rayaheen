import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaheen_bookstore/view/screen/productdetails.dart';

import '../../controller/productdetails_controller.dart';
import '../../core/constant/routes.dart';
import '../../data/model/itemsmodel.dart';
import '../widget/customappbar.dart';
import '../widget/home/customcardhome.dart';
import '../widget/productdetails/sharedproduct.dart';
import 'customcardlinkshare.dart';

// // class ItemFromLinkPage extends StatelessWidget {
// //   final ItemsModel item;
// //
// //   const ItemFromLinkPage({Key? key, required this.item}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 1,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () {
// //             Get.offAllNamed(AppRoute.homePage);
// //           },
// //         ),
// //       ),
// //       body: Container(
// //         padding: const EdgeInsets.symmetric(horizontal: 15),
// //         child: ListView(
// //           children: [
// //             CustomAppBar(
// //               titleappbar: "41".tr,
// //               onPressedSearch: (_) {},
// //               onChanged: (_) {},
// //               mycontroller: TextEditingController(),
// //              // showSearchField: false,
// //             ),
// //             GestureDetector(
// //               onTap: () => Get.to(() => ProductDetails(item: item)),
// //               child: CustomProductCardFromLink(item: item),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// class ItemFromLinkPage extends StatelessWidget {
//   final ItemsModel item;
//
//   const ItemFromLinkPage({Key? key, required this.item}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("تفاصيل المنتج"),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           Text("تم فتح هذا المنتج من رابط المشاركة", style: TextStyle(color: Colors.grey)),
//           const SizedBox(height: 10),
//           GestureDetector(
//             // onTap: () => Get.to(() => ProductDetails(item: item)),
//             // child: SingleProductCardView(item: item),
//
//             onTap: () {
//               Get.to(() => ProductDetails(item: item), binding: BindingsBuilder(() {
//                 Get.delete<ProductDetailsControllerImp>();
//                 Get.put(ProductDetailsControllerImp(item));
//               }));
//             },
//
//           ),
//         ],
//       ),
//     );
//   }
// }


class ItemFromLinkPage extends StatelessWidget {
  final ItemsModel item;
  const ItemFromLinkPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تفاصيل المنتج")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text("تم فتح هذا المنتج من رابط المشاركة", style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),

          GestureDetector(
            onTap: () {
              Get.to(() => ProductDetails(item: item), binding: BindingsBuilder(() {
                Get.delete<ProductDetailsControllerImp>(); // تأكد من حذف القديم إن وجد
                Get.put(ProductDetailsControllerImp(item));
              }));



            },
            child: SingleProductCardView(item: item),
          ),
        ],
      ),
    );
  }
}
