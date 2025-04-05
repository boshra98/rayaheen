// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cart_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/class/statusrequest.dart';
import '../widget/cart/custom_bottom_navgationbar_cart.dart';
import '../widget/cart/customitemscartlist.dart';
import '../widget/cart/topcardcart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
        init: CartController(),
        builder: (cartController) {
          return Scaffold(
              appBar: AppBar(
                title: Text("87".tr),
              ),
              bottomNavigationBar: BottomNavgationBarCart(
                  shipping: "0",
                  controllercoupon: cartController.controllercoupon!,
                  onApplyCoupon: () {
                    cartController.checkcoupon();
                  },
                  price: "${cartController.priceorders}",
                  discount: "${cartController.discountcoupon}%",
                  totalprice: "${cartController.getTotalPrice().round()}"
              ),
              body: GetBuilder<CartController>(
                builder: (cartController) {
                  if (cartController.statusRequest == StatusRequest.loading) {
                    return Center(child: CircularProgressIndicator());
                  } else
                  if (cartController.statusRequest == StatusRequest.success) {
                    if (cartController.data.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart_outlined, size: 60,
                                color: Colors.grey),
                            SizedBox(height: 16),
                            Text(
                              "سلتك فارغة حتى الآن 😊",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return ListView(
                        children: [
                          SizedBox(height: 10),
                          TopCardCart(
                            message: "${"88".tr} ${cartController.cartService
                                .cartItemCount.value} ${"89".tr}",
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: List.generate(
                                cartController.data.length,
                                    (index) =>
                                    CustomItemsCartList(
                                      onAdd: () async {
                                        await cartController.add(
                                            cartController.data[index]
                                                .itemsId!);
                                      },
                                      onRemove: () async {
                                        await cartController.delete(
                                            cartController.data[index]
                                                .itemsId!);
                                      },
                                      imagename: "${cartController.data[index]
                                          .itemsImage}",
                                      name: "${cartController.data[index]
                                          .itemsName}",
                                      price: "${cartController.data[index]
                                          .itemsprice} درهم",
                                      count: "${cartController.data[index]
                                          .countitems}",
                                    ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  } else {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              Icons.error_outline, size: 60, color: Colors.red),
                          SizedBox(height: 16),
                          // Text(
                          //   "حدث خطأ أثناء تحميل السلة، الرجاء المحاولة لاحقًا",
                          //   style: TextStyle(fontSize: 16, color: Colors.red),
                          // ),
                        ],
                      ),
                    );
                  }
                },
              ));
        });
  }
}