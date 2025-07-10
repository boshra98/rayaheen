import 'package:get/get.dart';
import 'package:rayaheen_bookstore/core/class/crud.dart';

import '../controller/checkout_controller.dart';
import '../controller/homescreen_controller.dart';
import '../core/services/cartservices.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud()) ;
    Get.lazyPut<HomeScreenControllerImp>(() => HomeScreenControllerImp());
    Get.put<CartService>(CartService(), permanent: true);
    Get.lazyPut<CheckoutControllerImp>(() => CheckoutControllerImp());
// Ensure CartService is added here
  }
}
