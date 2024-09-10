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

    ProductDetailsControllerImp controller =
    Get.put(ProductDetailsControllerImp());

    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 40,
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: AppColor.secondColor,
                onPressed: () {
                  Get.toNamed(AppRoute.cart);
                },
                child: const Text(
                  "Go To Cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))),
        body: GetBuilder<ProductDetailsControllerImp>(
            builder: (controller) => ListView(children: [
              const TopProductPageDetails(),
              const SizedBox(
                height: 100,
              ),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${controller.itemsModel.itemsName}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                color: AppColor.fourthColor,
                              )),
                          const SizedBox(height: 10),
                          PriceAndCountItems(
                              onAdd: () {
                                controller.add();
                              },
                              onRemove: () {
                                controller.remove();
                              },
                              price:
                              "${controller.itemsModel.itemsPrice}",
                              count: "${controller.countitems}"),
                          const SizedBox(height: 10),
                          //descreptions for items
                          Text("${controller.itemsModel.itemsDesc}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: AppColor.grey2)),
                          const SizedBox(height: 10),
                          // Text("Color",
                          //     style: Theme.of(context).textTheme.headline1!.copyWith(
                          //           color: AppColor.fourthColor,
                          //         )),
                          // const SizedBox(height: 10),
                          // const SubitemsList()
                        ]),
                  ))
            ])));
  }
}
