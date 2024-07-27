


import 'package:get/get.dart';
import 'package:rayaheen_bookstore/test_view.dart';
import 'package:rayaheen_bookstore/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:rayaheen_bookstore/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:rayaheen_bookstore/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:rayaheen_bookstore/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:rayaheen_bookstore/view/screen/auth/forgetpassword/verifycodesignup.dart';
import 'package:rayaheen_bookstore/view/screen/auth/login.dart';
import 'package:rayaheen_bookstore/view/screen/auth/signup.dart';
import 'package:rayaheen_bookstore/view/screen/auth/success_signup.dart';
import 'package:rayaheen_bookstore/view/screen/home.dart';
import 'package:rayaheen_bookstore/view/screen/language.dart';
import 'package:rayaheen_bookstore/view/screen/onboarding.dart';

import 'core/constant/routes.dart';
import 'core/middleware/mymiddleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const Language() , middlewares: [
    MyMiddleWare()
  ]),


  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.homePage, page: () => const HomePage()),

  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successResetPassword, page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
];