import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/cart_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';

class FloatingCartButton extends StatelessWidget {
  const FloatingCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());

    return Stack(
      children: [
        FloatingActionButton(
          backgroundColor: AppColor.primaryColor,
          onPressed: () {
            final String? userId = cartController.myServices.sharedPreferences.getString("id");
            if (userId == "guest") {
              Get.snackbar("تنبيه", "الرجاء تسجيل الدخول للوصول إلى السلة");
            } else {
              Get.toNamed(AppRoute.cart);
            }
          },
          child: const Icon(Icons.shopping_cart_outlined, color: AppColor.secondColor),
        ),
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
            child: Text(
              '${cartController.cartService.cartItemCount.value}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
            : const SizedBox.shrink()),
      ],
    );
  }
}
