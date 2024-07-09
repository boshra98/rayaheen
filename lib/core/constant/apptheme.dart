import 'package:flutter/material.dart';
import 'package:rayaheen_bookstore/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "playfairDisplay",
  textTheme: const TextTheme(
    headline1:  TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20,color:AppColor.black) ,
    bodyText1: TextStyle(
        height:2,color:AppColor.grey,fontWeight: FontWeight.bold,fontSize: 17),
    bodyText2: TextStyle(
        height:2,color:AppColor.grey,fontSize: 14),
  ),
);
ThemeData themeArabic = ThemeData(
  fontFamily: "cairo",
  textTheme: const TextTheme(
    headline1:  TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20,color:AppColor.black) ,
    bodyText1: TextStyle(
        height:2,color:AppColor.grey,fontWeight: FontWeight.bold,fontSize: 17),
    bodyText2: TextStyle(
        height:2,color:AppColor.grey,fontSize: 14),
  ),
);