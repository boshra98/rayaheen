import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/constant/routes.dart';
import '../screen/items.dart';
import '../screen/items2.dart';
import 'customappbar.dart';

class CustomAppBar2 extends StatelessWidget {
  final void Function()? onPressedMenu;
  final void Function()? onPressedSearch;

  // final void Function(String)? onChanged;
  // final TextEditingController mycontroller;
  final String logoPath; // Path to the logo image

  const CustomAppBar2({
    Key? key,
    required this.onPressedMenu,
    required this.onPressedSearch,
    // this.onChanged,
    // required this.mycontroller,
    required this.logoPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Menu icon button (on the left)
          Row(
            children: [

              IconButton(
                onPressed: () {
                  Get.to(() => const Items2()); // Navigate to the items page
                },
                icon: const Icon(
                  Icons.search,
                  size: 30,
                  color: AppColor.primaryColor2,
                ),
              ),
              // IconButton(
              //   onPressed: () {
              //     // Action for cart button
              //     //print('Cart icon tapped');
              //     Get.toNamed(AppRoute.cart);
              //   },
              //   icon: const Icon(
              //     Icons.shopping_cart_outlined,
              //     size: 30,
              //     color: AppColor.primaryColor2,
              //   ),
              // ),
            ],
          ),
          // Centered logo
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey[100],
            backgroundImage: const AssetImage(ImageAsset.logo),
          ),
          // Row for cart and menu icons on the right


              // Cart icon button

              // Menu icon button
              IconButton(
                onPressed: onPressedMenu,
                icon: const Icon(
                  Icons.menu,
                  size: 30,
                  color: AppColor.primaryColor2,
                ),
              ),

        ],
      ),
    );
  }
}