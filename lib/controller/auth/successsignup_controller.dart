import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SuccessSignUpController extends GetxController{

  goToPageLogin() ;

}

class SuccessSignUpControllerImp extends SuccessSignUpController{
  goToPageLogin(){
    Get.offAllNamed(AppRoute.login);
  }
}