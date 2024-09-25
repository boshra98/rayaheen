
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../controller/checkout_controller.dart';
import '../../core/class/handlingdataview.dart';
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
    Get.lazyPut(()=>CheckoutControllerImp());

    //CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.secondColor,
            textColor: Colors.white,
            onPressed: () {
            // controller.checkout();
            },
            child: const Text("Checkout",
                style: TextStyle(fontWeight: FontWeight.bold, color:AppColor.secondColor2 , fontSize: 16)),
          )),
      body: GetBuilder<CheckoutControllerImp>(builder:(controller)=>Container(
               //   padding: const EdgeInsets.all(20),
          padding: const EdgeInsets.symmetric(vertical: 15 , horizontal: 30),
          child:
          Form(key:controller.formstate,
           child: ListView(
                    children: [
                      const Text(
                        "اختر طريقة الدفع",
                        style: TextStyle(
                            color: AppColor.secondColor2,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("0");
                        },
                        child: CardPaymentMethodCheckout(
                            title: "كاش",

                            isActive: controller.paymentMethod == "0" // cash
                                ? true
                                : false),
                      ),
                      const SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          controller.choosePaymentMethod("1");
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Confirmation"),
                                content: Text("Do you want to proceed to WhatsApp?"),
                                actions: [
                                  TextButton(
                                    child: Text("Cancel"),
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                  ),
                                  TextButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      // Launch WhatsApp when "OK" is pressed
                                      launchUrl(Uri.parse("https://wa.me/+971528816100"));
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: CardPaymentMethodCheckout(
                            title: "تحويل",
                            isActive: controller.paymentMethod == "1" // Card
                                ? true
                                : false),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "حدد عنوان السكن",
                        style: TextStyle(
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
                               //mycontroller:controller.Imara,
                                hinttext: "ادخل اسم الامارة",
                                labeltext: "الامارة" ,
                                valid:(val){
                                  return validInput(val! ,5,30, "username") ;

                                },

                              ),
                              CardDeliveryAddressCheckout(
                                isNumber: false,
                                //mycontroller: controller.mantica,
                                hinttext: "ادخل اسم المنطقة".tr,
                                labeltext: "المنطقة".tr,
                                valid:(val){
                                  return validInput(val! ,5,30, "username") ;

                                },
                              ),
                              CardDeliveryAddressCheckout(
                                isNumber: false,
                                //mycontroller: controller.sharae,
                                hinttext: "ادخل اسم الشارع".tr,
                                labeltext: "الشارع".tr,
                                valid:(val){
                                  return validInput(val! ,5,30, "username") ;

                                },
                              ),
                              CardDeliveryAddressCheckout(
                                isNumber: true,
                                //mycontroller: controller.phone,
                                hinttext: "ادخل رقم الهاتف".tr,
                                labeltext:"الهاتف".tr,
                                valid:(val){
                                  return validInput(val! ,9,9, "phone") ;

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


                  )
          )

          )
      ),
    );
  }
}
