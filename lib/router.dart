


import 'package:get/get.dart';
import 'package:rayaheen_bookstore/test_view.dart';
import 'package:rayaheen_bookstore/view/screen/aboutus.dart';
import 'package:rayaheen_bookstore/view/screen/address/add.dart';
import 'package:rayaheen_bookstore/view/screen/address/adddetails.dart';
import 'package:rayaheen_bookstore/view/screen/address/view.dart';
import 'package:rayaheen_bookstore/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:rayaheen_bookstore/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:rayaheen_bookstore/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:rayaheen_bookstore/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:rayaheen_bookstore/view/screen/auth/verifycodesignup.dart';
import 'package:rayaheen_bookstore/view/screen/auth/login.dart';
import 'package:rayaheen_bookstore/view/screen/auth/signup.dart';
import 'package:rayaheen_bookstore/view/screen/auth/success_signup.dart';
import 'package:rayaheen_bookstore/view/screen/cart.dart';
import 'package:rayaheen_bookstore/view/screen/checkout.dart';
import 'package:rayaheen_bookstore/view/screen/home.dart';
import 'package:rayaheen_bookstore/view/screen/homescreen.dart';
import 'package:rayaheen_bookstore/view/screen/items.dart';
import 'package:rayaheen_bookstore/view/screen/language.dart';
import 'package:rayaheen_bookstore/view/screen/myfavorite.dart';
import 'package:rayaheen_bookstore/view/screen/onboarding.dart';
import 'package:rayaheen_bookstore/view/screen/orders/archive.dart';
import 'package:rayaheen_bookstore/view/screen/orders/details.dart';
import 'package:rayaheen_bookstore/view/screen/orders/pending.dart';
import 'package:rayaheen_bookstore/view/screen/productdetails.dart';

import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes = [
  //GetPage(name: "/", page: () => const Language() ),
  GetPage(name: "/", page: () => const Language() , middlewares: [
    MyMiddleWare()
  ]),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),

  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetPassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
 // GetPage(name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),


  GetPage(name: AppRoute.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),

  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),

   GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.aboutus, page: () => const AboutUs()),

  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),





  // GetPage(name: AppRoute.items, page: () => const Items()),

];