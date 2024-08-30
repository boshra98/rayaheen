import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../data/model/itemsmodel.dart';
import '../../../linkapi.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return ItemsHome(
                itemsModel: ItemsModel.fromJson(controller.items[i]));
          }),
    );
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  const ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          margin: const EdgeInsets.symmetric(horizontal:20),
           // child:Image.asset("assets/images/logo.png" ,height:100,width:150,fit:BoxFit.fill,)
            child:Positioned(
              top: 30.0,
            right: Get.width / 8,
              left: Get.width / 8,

              child: CachedNetworkImage(
                imageUrl:
                "${AppLink.imagesItems}/${itemsModel.itemsImage!}",
                height: 100,
                width: 120,
                fit: BoxFit.fill,

              ),
            ),

         //   child: Image.network(
         //    "${AppLink.imagestItems}/${itemsModel.itemsImage}",
         //    height: 100,
         //    width: 150,
         //    fit: BoxFit.fill,
         // ),//
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal:10),

          decoration: BoxDecoration(
              color: AppColor.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20)),
          height: 120,
          width: 200,
        ),
        Positioned(
            top:-5,
            left: 50,
            child: Text(
              "${itemsModel.itemsName}",

              style: const TextStyle(
                  color: Colors.pink,
                 // width: 200,
                  //height:50,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ))
      ],
    );
  }
}
