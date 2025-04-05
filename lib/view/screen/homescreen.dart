
import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaheen_bookstore/view/screen/splashscreen.dart';

import '../../controller/cart_controller.dart';
import '../../controller/homescreen_controller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/services/cartservices.dart';
import '../widget/home/custombottomappbarhome.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // Initialize the CartController
//     final cartController = Get.put(CartController());
//
//     // Initialize the HomeScreenControllerImp
//     final homeController = Get.put(HomeScreenControllerImp());
//
//     return DoubleTapToExit(
//       snackBar: SnackBar(
//         content: Text('54'.tr),
//       ),
//       child: Scaffold(
//         floatingActionButton: Stack(
//           children: [
//             FloatingActionButton(
//               backgroundColor: AppColor.primaryColor,
//               onPressed: () {
//                 Get.toNamed(AppRoute.cart);
//               },
//               child: const Icon(Icons.shopping_cart_outlined, color: AppColor.secondColor),
//             ),
//             // Red dot notification
//             GetBuilder<CartController>(
//               builder: (cartController) {
//                 if (cartController.cartItemCount > 0) {
//                   return Positioned(
//                     right: 0,
//                     top: 0,
//                     child: Container(
//                       padding: const EdgeInsets.all(2),
//                       decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       constraints: const BoxConstraints(
//                         minWidth: 12,
//                         minHeight: 12,
//                       ),
//                       child: Text(
//                         '${cartController.cartItemCount}',
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 8,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   );
//                 } else {
//                   return SizedBox.shrink(); // Return an empty widget if no items are in the cart
//                 }
//               },
//             ),
//           ],
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: const CustomBottomAppBarHome(),
//         body: GetBuilder<HomeScreenControllerImp>(
//           builder: (homeController) => homeController.listPage.elementAt(homeController.currentpage),
//         ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeScreenControllerImp()); // final splashScreen = SplashScreen();
//
//     return DoubleTapToExit(
//       snackBar:  SnackBar(
//         content: Text('54'.tr),
//       ),
//       child: GetBuilder<HomeScreenControllerImp>(
//         builder: (controller) => Scaffold(
//           floatingActionButton: FloatingActionButton(
//             backgroundColor: AppColor.primaryColor,
//             onPressed: () {
//               Get.toNamed(AppRoute.cart);
//             },
//             child: const Icon(Icons.shopping_cart_outlined,color:AppColor.secondColor),
//           ),
//           floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//           bottomNavigationBar: const CustomBottomAppBarHome(),
//
//           body: controller.listPage.elementAt(controller.currentpage),
//         ),
//       ),
//     );
//   }
// }


///////////////////////////////////////////




// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Ensure the controller is initialized
//     final HomeScreenControllerImp controller = Get.put(HomeScreenControllerImp());
//
//     return DoubleTapToExit(
//       snackBar: SnackBar(
//         content: Text('54'.tr),
//       ),
//       child: GetBuilder<HomeScreenControllerImp>(
//         builder: (controller) => Scaffold(
//           floatingActionButton: Stack(
//             children: [
//               FloatingActionButton(
//                 backgroundColor: AppColor.primaryColor,
//                 onPressed: () {
//                   Get.toNamed(AppRoute.cart);
//                 },
//                 child: const Icon(Icons.shopping_cart_outlined, color: AppColor.secondColor),
//               ),
//
//               // ✅ إشعار بعدد المنتجات في السلة
//               if (controller.cartItemCount > 0) // إظهار الإشعار فقط إذا كان هناك منتجات
//                 Positioned(
//                   right: 0,
//                   top: 0,
//                   child: badges.Badge(
//                     badgeContent: Text(
//                       controller.cartItemCount.toString(),
//                       style: const TextStyle(color: Colors.white, fontSize: 12),
//                     ),
//                     badgeStyle: badges.BadgeStyle(
//                       badgeColor: Colors.red,
//                       shape: badges.BadgeShape.circle,
//                       borderRadius: BorderRadius.circular(8),
//                       padding: const EdgeInsets.all(6),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//           floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//           bottomNavigationBar: const CustomBottomAppBarHome(),
//           body: controller.listPage.elementAt(controller.currentpage),
//         ),
//       ),
//     );
//   }
// }







class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    final CartController cartController = Get.put(CartController()); // ✅ استرجاع `CartController`

    return DoubleTapToExit(
      snackBar: SnackBar(content: Text('54'.tr)),
      child: GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          floatingActionButton: Stack(
            children: [
              FloatingActionButton(
                backgroundColor: AppColor.primaryColor,
                onPressed: () {
                  final String? userId = cartController.myServices.sharedPreferences.getString("id");
                  if (userId == "guest") {
                    Get.snackbar(
                      "تنبيه",
                      "الرجاء تسجيل الدخول للوصول إلى السلة",
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 2),
                    );
                  } else {
                    Get.toNamed(AppRoute.cart);
                  }
                },
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColor.secondColor,
                ),
              ),


              // ✅ استخدم `Obx` لمراقبة `cartItemCount`
              Obx(() => cartController.cartService.cartItemCount.value > 0
                  ? Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: Text(
                    '${cartController.cartService.cartItemCount.value}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
                  : const SizedBox.shrink()), // ✅ إذا كان العدد صفرًا، لا تعرض الإشعار
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const CustomBottomAppBarHome(),
          body: controller.listPage.elementAt(controller.currentpage),
        ),
      ),
    );
  }
}
