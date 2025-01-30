
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




class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartService? cartService;

    try {
      cartService = Get.find<CartService>();
    } catch (e) {
      print("CartService not found: $e");
    }

    return DoubleTapToExit(
      snackBar: SnackBar(
        content: Text('54'.tr ?? 'Press again to exit'),
      ),
      child: GetBuilder<HomeScreenControllerImp>(
        builder: (controller) {
          if (controller == null) {
            print("HomeScreenControllerImp not initialized");
            return const Center(child: CircularProgressIndicator());
          }

          return Scaffold(
            floatingActionButton: Stack(
              children: [
                FloatingActionButton(
                  backgroundColor: AppColor.primaryColor,
                  onPressed: () {
                    Get.toNamed(AppRoute.cart);
                  },
                  child: const Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColor.secondColor,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Obx(() {
                    if (cartService == null) {
                      return const SizedBox(); // Safeguard for missing CartService
                    }
                    return cartService.cartItemCount.value > 0
                        ? Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${cartService.cartItemCount.value}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                        : const SizedBox();
                  }),
                ),
              ],
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBottomAppBarHome(),
            body: controller.listPage.elementAt(controller.currentpage),
          );
        },
      ),
    );
  }
}





// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeScreenControllerImp());
//     Get.put(CartController());
//
//     return DoubleTapToExit(
//       snackBar: SnackBar(
//         content: Text('54'.tr),
//       ),
//       child: GetBuilder<HomeScreenControllerImp>(
//         builder: (controller) => Scaffold(
//           floatingActionButton: GetBuilder<CartController>(
//             builder: (cartController) => Stack(
//               children: [
//                 FloatingActionButton(
//                   backgroundColor: AppColor.primaryColor,
//                   onPressed: () {
//                     Get.toNamed(AppRoute.cart);
//                   },
//                   child: const Icon(
//                     Icons.shopping_cart_outlined,
//                     color: AppColor.secondColor,
//                   ),
//                 ),
//                 if (cartController.cartItemCount > 0)
//                   Positioned(
//                     right: 0,
//                     top: 0,
//                     child: Container(
//                       padding: const EdgeInsets.all(4),
//                       decoration: const BoxDecoration(
//                         color: Colors.red,
//                         shape: BoxShape.circle,
//                       ),
//                       child: Text(
//                         '${cartController.cartItemCount}',
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 12,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//           floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//           bottomNavigationBar: const CustomBottomAppBarHome(),
//           body: controller.listPage.elementAt(controller.currentpage),
//         ),
//       ),
//     );
//   }
// }
