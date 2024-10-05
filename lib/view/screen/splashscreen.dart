import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constant/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Check if the user is logged in or not
  Future<void> _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //String? token = prefs.getString('auth_token');
    String? token = prefs.getString('id');


    // Simulate loading time (optional)
    await Future.delayed(Duration(seconds: 2));

    if (token != null) {
      // If user is logged in, navigate to home screen
      //Get.offAllNamed('/homePage');
      Get.offAllNamed(AppRoute.homePage);
    } else {
      // If user is not logged in, navigate to login screen
     // Get.offAllNamed('/login');
      Get.offAllNamed(AppRoute.language);

    }
  }
  void triggerCheckLoginStatus() {
    _checkLoginStatus(); // Public method to trigger the private method
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(

        child:
        CircularProgressIndicator(),


        // Loading indicator while checking login status
      ),


    );
  }
}
