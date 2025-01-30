import 'package:get/get.dart';

import '../class/crud.dart';

class CartService extends Crud {
  var cartItemCount = 0.obs; // Observable variable for real-time updates
CartService? cartService;

  void increment() {
    cartItemCount++;
  }

  void decrement() {
    if (cartItemCount > 0) {
      cartItemCount--;
    }
  }

  void setCount(int count) {
    cartItemCount.value = count;
  }
}
