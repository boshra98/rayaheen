import 'package:get/get.dart';
import 'package:rayaheen_bookstore/core/class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud()) ;
  }
}