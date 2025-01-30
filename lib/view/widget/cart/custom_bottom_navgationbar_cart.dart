// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/cart_controller.dart';
import '../../../core/constant/color.dart';
import 'buttoncart.dart';
import 'custombuttoncoupon.dart';

class BottomNavgationBarCart extends GetView<CartController> {
  final String price;
  final String discount;
  final String shipping;
  final String totalprice;
  final TextEditingController controllercoupon;
  final void Function()? onApplyCoupon;
  const BottomNavgationBarCart(
      {Key? key,
      required this.price,
      required this.discount,
      required this.shipping,
      required this.totalprice,
      required this.controllercoupon,
      this.onApplyCoupon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // GetBuilder<CartController>(
        //     builder: (controller) =>
        //     controller.couponname == null ?
        //      Container(
        //         padding: EdgeInsets.symmetric(horizontal: 10),
        //         child: Row(children: [
        //           Expanded(
        //               flex: 2,
        //               child: TextFormField(
        //                 controller: controllercoupon,
        //                 decoration: InputDecoration(
        //                     isDense: true,
        //                     contentPadding: EdgeInsets.symmetric(
        //                         vertical: 8, horizontal: 10),
        //                     hintText: "كود الحسم",
        //                     border: OutlineInputBorder()),
        //               )),
        //           SizedBox(width: 5),
        //           Expanded(
        //               flex: 1,
        //               child: CustomButtonCoupon(
        //                 textbutton: "تفعيل",
        //                 onPressed: onApplyCoupon,
        //               ))
        //         ]))
        //         : Container(child: Text("كود الحسم ${controller.couponname!}" , style: TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),))
        //         ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.primaryColor, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      "حصريا في الامارات رسوم التوصيل 20 درهم و مجاني في حال تجاوزت قيمة الشراء 350 درهم",
                      textAlign: TextAlign.center, // Justify text for neat alignment
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04, // Responsive font size
                        fontWeight: FontWeight.bold,
                        color: AppColor.secondColor2,
                        height: 1.5, // Line height for better readability
                      ),
                      softWrap: true, // Wraps text within the container
                      maxLines: 3, // Limits text to 3 lines
                      overflow: TextOverflow.ellipsis, // Adds ellipsis if text overflows
                    ),
                  ),
                ),
              ],
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //         padding: EdgeInsets.symmetric(horizontal: 20),
            //         child: Text("الحسم", style: TextStyle(fontSize: 16))),
            //     Container(
            //         padding: EdgeInsets.symmetric(horizontal: 20),
            //         child: Text("$discount ", style: TextStyle(fontSize: 16)))
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Container(
            //         padding: EdgeInsets.symmetric(horizontal: 20),
            //         child: Text("التوصيل", style: TextStyle(fontSize: 16))),
            //     Container(
            //         padding: EdgeInsets.symmetric(horizontal: 20),
            //         child: Text("$shipping ", style: TextStyle(fontSize: 16)))
            //   ],
            // ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("السعر الكلي",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primaryColor))),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$totalpriceدرهم\ ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            wordSpacing:4,
                            //letterSpacing: 2,
                            color: AppColor.primaryColor)))
              ],
            ),
          ]),
        ),
        SizedBox(height: 10),
        CustomButtonCart(
          textbutton: "اطلب الآن",
          onPressed: () { 
            controller.goToPageCheckout() ; 
          },
        )
      ],
    ));
  }
}
