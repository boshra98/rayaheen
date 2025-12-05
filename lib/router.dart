


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaheen_bookstore/test_view.dart';
import 'package:rayaheen_bookstore/view/screen/aboutus.dart';

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
import 'package:rayaheen_bookstore/view/screen/contectwithdeveloper.dart';
import 'package:rayaheen_bookstore/view/screen/home.dart';
import 'package:rayaheen_bookstore/view/screen/homescreen.dart';
import 'package:rayaheen_bookstore/view/screen/items.dart';
import 'package:rayaheen_bookstore/view/screen/itemsage.dart';
import 'package:rayaheen_bookstore/view/screen/itemspublishers.dart';
import 'package:rayaheen_bookstore/view/screen/language.dart';
import 'package:rayaheen_bookstore/view/screen/language2.dart';
import 'package:rayaheen_bookstore/view/screen/myfavorite.dart';
import 'package:rayaheen_bookstore/view/screen/onboarding.dart';
import 'package:rayaheen_bookstore/view/screen/orders/archive.dart';
import 'package:rayaheen_bookstore/view/screen/orders/details.dart';
import 'package:rayaheen_bookstore/view/screen/orders/pending.dart';
import 'package:rayaheen_bookstore/view/screen/productdetails.dart';
import 'package:rayaheen_bookstore/view/screen/settings.dart';
import 'package:rayaheen_bookstore/view/screen/splashscreen.dart';
import 'package:rayaheen_bookstore/view/widget/profile.dart';

import 'controller/productdetails_controller.dart';
import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';
import 'data/model/itemsmodel.dart';

List<GetPage<dynamic>>? routes = [
  //GetPage(name: "/", page: () => const Language() ),
  // GetPage(name: "/", page: () => const Language() , middlewares: [
  //   MyMiddleWare()
  // ]),
  GetPage(name: '/', page: () => SplashScreen()),

  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.language, page: () => const Language()),
  GetPage(name: AppRoute.language2, page: () => const Language2()),



  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),

  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifycode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetPassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
 // GetPage(name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: '/settings', page: () => Settings()),


  GetPage(name: AppRoute.homePage, page: () =>  HomeScreen()),
  GetPage(name: AppRoute.items, page: () => const items()),
  GetPage(name: AppRoute.itemsage, page: () => const itemsage()),
  // GetPage(name: AppRoute.itemspublisher, page: () => const itemspublishers()),


  //GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
 // GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
 //  GetPage(
 //    name: AppRoute.productdetails,
 //    page: () => ProductDetails(item: Get.arguments),
 //  ),

  // GetPage(
  //   name: AppRoute.productdetails,
  //   page: () {
  //     final args = Get.arguments;
  //
  //     // إذا كانت Map تمرر من goToPageProductDetails
  //     if (args is Map && args.containsKey('itemsmodel')) {
  //       return ProductDetails(item: args['itemsmodel']);
  //     }
  //
  //     // إذا تم تمرير العنصر مباشرة
  //     if (args is ItemsModel) {
  //       return ProductDetails(item: args);
  //     }
  //
  //     // في حال لم يتم تمرير شيء أو التمرير خاطئ
  //     return const Scaffold(
  //       body: Center(child: Text("❌ لم يتم العثور على بيانات المنتج")),
  //     );
  //   },
  // ),
  GetPage(
    name: AppRoute.productdetails,
    page: () => ProductDetails(item: Get.arguments as ItemsModel),
    binding: BindingsBuilder(() {
      final item = Get.arguments as ItemsModel;
      Get.put(ProductDetailsControllerImp(item));
    }),
  ),



  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.aboutus, page: () => const AboutUs()),
  GetPage(name: AppRoute.profile, page: () =>  ProfilePage()),
  GetPage(name: AppRoute.contactdeveloperPage, page: () =>  const ContactDeveloperPage()),

  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),





  // GetPage(name: AppRoute.items, page: () => const Items()),

];