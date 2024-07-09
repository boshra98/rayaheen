
import 'package:flutter/material.dart';
import 'package:rayaheen_bookstore/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:rayaheen_bookstore/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:rayaheen_bookstore/view/screen/auth/forgetpassword/verifycodesignup.dart';
import 'package:rayaheen_bookstore/view/screen/auth/success_signup.dart';
import 'package:rayaheen_bookstore/view/screen/onboarding.dart';

import 'core/constant/routes.dart';
import 'view/screen/auth/forgetpassword/forgetpassword.dart';
import 'view/screen/auth/forgetpassword/verifycode.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup.dart';

Map<String,Widget Function(BuildContext)> routes = {
  //Auth
  AppRoute.login:(context) => const Login(),
  AppRoute.signUp:(context) => const SignUp(),
  AppRoute.forgetPassword:(context) => const ForgetPassword(),
  AppRoute.verfiyCode:(context) => const VerifyCode(),
  AppRoute.resetPassword:(context) => const ResetPassword(),

  AppRoute.successResetPassword:(context) => const SuccessResetPassword(),
  AppRoute.successSignUp:(context) => const SuccessSignUp(),



  //OnBoarding
  AppRoute.onBoarding:(context) => const OnBoarding() ,
  AppRoute.verifyCodeSignUp:(context) => const VerifyCodeSignUp() ,

  // AppRoute.onBoarding:(context) => const OnBoarding() ,


};