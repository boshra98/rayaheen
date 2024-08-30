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
ThemeData customDarkTheme = ThemeData.dark().copyWith(
visualDensity: VisualDensity.adaptivePlatformDensity,);

ThemeData customLightTheme = ThemeData.light().copyWith(
visualDensity: VisualDensity.adaptivePlatformDensity,);

// class Themes{
//   static ThemeData customDarkTheme = ThemeData.dark().copyWith(
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//
//     textTheme:  const TextTheme(
//       titleLarge:  TextStyle(
//         fontWeight: FontWeight.bold, fontSize: 18,color:AppColor.primaryColor,fontFamily: "playfairDisplay",
//       ) ,
//       bodyMedium: TextStyle(
//         height:2,color:AppColor.grey,fontWeight: FontWeight.bold,fontSize: 16 , fontFamily: "playfairDisplay",
//       ),
//       displaySmall: TextStyle(
//         height:2,color:AppColor.grey,fontSize: 14 ,fontFamily: "playfairDisplay",
//       ),
//     ),
//
//     // appBarTheme: AppBarTheme(color: AppColor.fourthColor),
//     //scaffoldBackgroundColor: AppColor.thirdColor,
//     // bottomAppBarTheme:  BottomAppBarTheme(color: AppColor.fourthColor),
//     //primarySwatch: Colors.pink,
//     //bottomNavigationBar :  AppColor.fourthColor,
//     // GNav
//   );
//   static ThemeData customLightTheme = ThemeData.light().copyWith(
//     visualDensity: VisualDensity.adaptivePlatformDensity,
//
//     textTheme: const TextTheme(
//       titleLarge:  TextStyle(
//         fontWeight: FontWeight.bold, fontSize: 20,color:AppColor.black,fontFamily: "playfairDisplay",
//       ) ,
//       bodyMedium: TextStyle(
//         height:2,color:AppColor.grey,fontWeight: FontWeight.bold,fontSize: 17 , fontFamily: "playfairDisplay",
//       ),
//       displaySmall: TextStyle(
//         height:2,color:AppColor.grey,fontSize: 14 ,fontFamily: "playfairDisplay",
//       ),
//     ),
//
//     appBarTheme: AppBarTheme(color:Colors.white),
//     //scaffoldBackgroundColor: ScaffoldBackgroundColorTheme(),
//     bottomAppBarTheme:  BottomAppBarTheme(color:Colors.white),
//     //bottomNavigationBar:
//
//   );
//
// }
