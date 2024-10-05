import 'package:rayaheen_bookstore/controller/productdetails_controller.dart';
import 'package:rayaheen_bookstore/core/class/handlingdataview.dart';
import 'package:rayaheen_bookstore/core/constant/color.dart';
import 'package:rayaheen_bookstore/core/constant/routes.dart';
import 'package:rayaheen_bookstore/view/widget/productdetails/priceandcount.dart';
import 'package:rayaheen_bookstore/view/widget/productdetails/toppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller = Get.put(ProductDetailsControllerImp());

    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 40,
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.secondColor,
          onPressed: () {
            Get.toNamed(AppRoute.cart);
          },
          child:  Text(
            "64".tr,
            style: TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => ListView(
          children: [
            const TopProductPageDetails(),
            const SizedBox(height: 100),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // Centering the item name
                  children: [
                    Text(
                      "${controller.itemsModel.itemsName}",
                      textAlign: TextAlign.center, // Centering the text
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(
                        color: AppColor.fourthColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    PriceAndCountItems(
                      onAdd: () {
                        controller.add();
                      },
                      onRemove: () {
                        controller.remove();
                      },
                      price: "${controller.itemsModel.itemsPrice}",
                      count: "${controller.countitems}",
                    ),
                    const SizedBox(height: 10),
                    // Description for items, aligned from left to right
                    Text(
                      "${controller.itemsModel.itemsDesc}",
                      textAlign: TextAlign.right, // Aligning description to the left
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColor.grey2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "الكاتب: ${controller.itemsModel.author}",
                      textAlign: TextAlign.left, // Aligning author to the left
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColor.grey2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "دار النشر : ${controller.itemsModel.publisher}",
                      textAlign: TextAlign.left, // Aligning publisher to the left
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColor.grey2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "سنة النشر : ${controller.itemsModel.year}",
                      textAlign: TextAlign.left, // Aligning year to the left
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        color: AppColor.grey2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
