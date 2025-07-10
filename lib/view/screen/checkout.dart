
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/checkout_controller.dart';
import '../../core/class/handlingdataview.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/imageasset.dart';
import '../../core/functions/validinput.dart';
import '../widget/auth/custombuttomauth.dart';
import '../widget/checkout/carddeliveerytype.dart';
import '../widget/checkout/cardpaymentmethod.dart';
import '../widget/checkout/cardshippingaddress.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //Get.lazyPut(()=>CheckoutControllerImp());
    Get.put(CheckoutControllerImp()) ;
   // final CheckoutControllerImp controller = Get.put(CheckoutControllerImp());
    final controller = Get.find<CheckoutControllerImp>();

    // CheckoutController controller = Get.put(CheckoutControllerImp());
    return Scaffold(
      appBar: AppBar(
        title:  Text('73'.tr),
      ),


      body:
      GetBuilder<CheckoutControllerImp>
        (builder:(controller)=>

          Container(

              //   padding: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 30),
          child:
          Form(key:controller.formstate,

            child: ListView(
                    children: [
                       Text(
                        "121".tr,
                        style: TextStyle(
                            color: AppColor.secondColor2,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("0"); // كاش
                        },
                        child: CardPaymentMethodCheckout(
                          title: "122".tr,
                          isActive: controller.paymentMethod == "0",
                        ),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("1"); // تحويل
                        },
                        child: CardPaymentMethodCheckout(
                          title: "123".tr,
                          isActive: controller.paymentMethod == "1",
                        ),
                      ),

                      const SizedBox(height: 10),
                      // InkWell(
                      //   onTap: () {
                      //     controller.choosePaymentMethod("تحويل");
                      //
                      //   },
                      //   child: CardPaymentMethodCheckout(
                      //       title: "تحويل",
                      //       isActive: controller.paymentMethod == "تحويل" // Card
                      //           ? true
                      //           : false),
                      // ),
                      const SizedBox(height: 20),
                       Text(
                        "131".tr,
                        style: const TextStyle(
                            color: AppColor.secondColor2,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),

                      const SizedBox(height: 20),
                      // if (controller.deliveryType == "0")
                          Card(
                         // crossAxisAlignment: CrossAxisAlignment.start,

                            child: Column(mainAxisSize: MainAxisSize.min, children: [


                              CardDeliveryAddressCheckout(
                                isNumber: false,
                               mycontroller:controller.Imara,
                                hinttext: "132".tr,
                                labeltext: "133" .tr,
                                valid:(val){
                                  return validInput(val! ,3,30, "address") ;

                                },

                              ),
                              CardDeliveryAddressCheckout(
                                isNumber: false,
                                mycontroller: controller.mantica,
                                hinttext: "134".tr,
                                labeltext: "135".tr,
                                valid:(val){
                                  return validInput(val! ,3,30, "address") ;

                                },
                              ),
                              CardDeliveryAddressCheckout(
                                isNumber: false,
                                mycontroller: controller.sharae,
                                hinttext: "136".tr,
                                labeltext: "137".tr,
                                valid:(val){
                                  return validInput(val! ,3,30, "address") ;

                                },
                              ),
                              CardDeliveryAddressCheckout(
                                isNumber: true,
                                valid:(val){
                                  return validInput(val! ,8,12, "phone") ;

                                },
                                mycontroller: controller.phone,
                                hinttext: "138".tr,
                                labeltext:"139".tr,

                              ),
                              CustomButtomAuth(text:"73".tr,onPressed:(){
//                                 if(controller.paymentMethod=='1') {
//                                   showDialog(
//                                     context: context,
//                                     barrierDismissible: false, // Prevent dialog from closing if clicked outside
//
//                                     builder: (BuildContext context) {
//                                       return AlertDialog(
//                                         title:  Text("75".tr),
//                                         content:  Text(
//                                             "77".tr),
//                                         actions: [
//                                           TextButton(
//                                             child:  Text("76".tr),
//                                             onPressed: () {
//                                               Navigator.of(context)
//                                                   .pop();
//                                               //controller.checkout() ;
//
//                                               // Close the dialog
//                                             },
//                                           ),
//                                           TextButton(
//                                             child: Text("86".tr),
//                                             onPressed: () {
//                                               // Launch WhatsApp when "OK" is pressed
//                                               launchUrl(Uri.parse(
//                                                   "https://wa.me/+971528816100"));
//                                               Navigator.of(context)
//                                                   .pop();
//
//                                               controller.checkout() ;
// // Close the dialog
//                                             },
//                                           ),
//                                         ],
//                                       );
//                                     },
//                                   );
//                                 }
                               // else
                                controller.checkout() ;
                              },

                              ),

                            // const Text(
                            //   "Shipping Address",
                            //   style: TextStyle(
                            //       color: AppColor.secondColor,
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 16),
                            // ),
                            // TextField(
                            //   // controller: _addresscontroller,
                            //   keyboardType: TextInputType.text,
                            //   decoration: InputDecoration(
                            //     label:Text('الإمارة')
                            //   )
                            // ),
                            // TextField(
                            //   // controller: _addresscontroller,
                            //     keyboardType: TextInputType.text,
                            //     decoration: InputDecoration(
                            //         label:Text('المنطقة')
                            //     )
                            // ),
                            // TextField(
                            //   // controller: _addresscontroller,
                            //     keyboardType: TextInputType.text,
                            //     decoration: InputDecoration(
                            //         label:Text('الشارع')
                            //     )
                            // ),
                            // TextField(
                            //   //z controller: _addresscontroller,
                            //     keyboardType: TextInputType.text,
                            //     decoration: InputDecoration(
                            //         label:Text('رقم المنزل ')
                            //     )
                            // ) ,
                              // TextField(
                              //
                              //   //z controller: _addresscontroller,
                              //     keyboardType: TextInputType.number,
                              //     decoration: InputDecoration(
                              //         label:Text('رقم الهاتف ')
                              //     )
                              // ) ,

                           // SizedBox(height:20),

                            //CustomButtomAuth(text:"15".tr,onPressed:() {
                             // controller.checkout();
                            //}
                            //)
                          ],
                                                 ),
                                                  )
              ]


                  ),

          )

          )
      ),

    );
  }
}
