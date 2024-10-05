
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/pending_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/ordersmodel.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel listdata;
  const CardOrdersList({Key? key, required this.listdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Order Number : #${listdata.ordersId}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                      Jiffy(listdata.ordersDatetime!).fromNow(),

                    //  Jiffy(listdata.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(),
              // Text(
              //     "Order Type : ${controller.printOrderType(listdata.ordersType!)}"),
              Text("Order Price : ${listdata.ordersTotalprice} \$"),
              // Text("Delivery Price : ${listdata.ordersPricedelivery} \$ "),
              Text(
                  "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod!)} "),
              Text(
                  "Order Status : ${listdata.ordersStatus!} "),
              const Divider(),
              Row(
                children: [
                  // Text("Total Price : ${listdata.ordersTotalprice}  درهم\ ",
                  //     style: const TextStyle(
                  //         color: AppColor.primaryColor,
                  //         fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoute.ordersdetails,
                          arguments: {"ordersmodel": listdata});
                    },
                    color: AppColor.secondColor,
                    textColor: AppColor.primaryColor,
                    child:  Text('56'.tr),
                  ),
                  const SizedBox(width: 10),
                 if (listdata.ordersStatus=="pending") MaterialButton(
                    onPressed: () {
                      controller.deleteOrder(listdata.ordersId!);
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.primaryColor,
                    child:  Text('57'.tr),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
