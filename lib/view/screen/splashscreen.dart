import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constant/color.dart';
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
    return Scaffold(
      backgroundColor: AppColor.secondColor, // Set background color
      body: Center(
        child: Container(
          width: 180, // Set the desired circle size
          height: 180,
          decoration: BoxDecoration(
            shape: BoxShape.circle, // Circular shape
            color: Colors.white, // Optional background color
            border: Border.all(
              color: Colors.grey.shade300, // Border color
              width: 3, // Border width
            ),
            boxShadow: [ // Optional shadow for a polished look
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipOval( // Ensures the logo image is clipped to a circle
            child: Image.asset(
              'assets/images/logo.png', // Path to the image
              fit: BoxFit.cover, // Ensures the image fills the circle
            ),
          ),
        ),
      ),
    );
  }
}