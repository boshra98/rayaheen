
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/address_data.dart';
import '../data/datasource/remote/checkout_date.dart';
import '../data/model/addressmodel.dart';



abstract class CheckoutController  extends GetxController{
  checkout();
}
class CheckoutControllerImp extends CheckoutController {

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController Imara;

  late TextEditingController mantica;

  late TextEditingController sharae;
  late TextEditingController phone;


  // late String couponid;
  // late String coupondiscount;
  // late String priceorders;

  //AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
 // String? deliveryAddress;
  //String addressid = "0";

  //List<AddressModel> dataaddress = [];


  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }
  PaymentMethod() {
    return paymentMethod;
  }
  // chooseDeliveryAddress(String val) {
  //   deliveryAddress = val;
  //   update();
  // }

  // chooseShippingAddress(String val) {
  //   addressid = val;
  //   update();
  // }

  // getShippingAddress() async {
  //   statusRequest = StatusRequest.loading;
  //
  //   // var response = await addressData
  //   //     .getData(myServices.sharedPreferences.getString("id")!);
  //
  // //  print("=============================== Controller $response ");
  //
  //   //statusRequest = handlingData(response);
  //
  //   if (StatusRequest.success == statusRequest) {
  //     // Start backend
  //     //if (response['status'] == "success") {
  //      // List listdata = response['data'];
  //      // dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));
  //    // } else {
  //       statusRequest = StatusRequest.success;
  //     }
  //     // End
  //   }


    //update();

@override
   checkout() async {
  update() ;
    if (PaymentMethod() == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update() ;
      var response = await checkoutData.postdata(myServices.sharedPreferences.getString("id")!,
          Imara.text, sharae.text, mantica.text,paymentMethod!);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offAllNamed(AppRoute.homePage);
          Get.snackbar("Success", "the order was successfully");

        } else {
          statusRequest = StatusRequest.none;
          Get.snackbar("Error", "try again");
        }
      }
      update();
    } else {
         return Get.snackbar("Error", "Please select location $sharae");

    }
  }



  @override
  void onInit() {
    Imara=TextEditingController();
    mantica=TextEditingController();
    sharae=TextEditingController();
    phone=TextEditingController();
    super.onInit();


    // couponid = Get.arguments['couponid'];
    // priceorders = Get.arguments['priceorder'];
    // coupondiscount = Get.arguments['discountcoupon'].toString();
    //
    // getShippingAddress();
    // super.onInit();


  }
}
