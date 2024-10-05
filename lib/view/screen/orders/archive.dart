
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/orders/archive_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widget/orders/orderslistcardarchive.dart';

class OrdersArchiveView extends StatelessWidget {
  const OrdersArchiveView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(OrdersArchiveController());
    return Scaffold(
        appBar: AppBar(
          title:  Text("63".tr),
        ),
        body: Container(
          padding:const  EdgeInsets.all(10),
          child: GetBuilder<OrdersArchiveController>(
              builder: ((controller) => HandlingDataView(statusRequest: controller.statusRequest, widget: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: ((context, index) =>
                        CardOrdersListArchive(listdata: controller.data[index])),
                  )))),
        ));
  }
}
