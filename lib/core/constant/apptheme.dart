import 'package:flutter/material.dart';
import 'package:rayaheen_bookstore/core/constant/color.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "playfairDisplay",
  textTheme:  const TextTheme(
    displayMedium:  TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16,color:AppColor.black) ,
    bodyMedium: TextStyle(
        height:2,color:AppColor.grey,fontWeight: FontWeight.bold,fontSize: 16),
    bodySmall: TextStyle(
        height:2,color:AppColor.grey,fontSize: 14),
  ),
);
ThemeData themeArabic = ThemeData(
  fontFamily: "cairo",
  textTheme: const TextTheme(
    displayMedium:  TextStyle(
        fontWeight: FontWeight.bold, fontSize: 14,color:AppColor.black) ,
    bodyMedium: TextStyle(
        height:2,color:AppColor.grey,fontWeight: FontWeight.bold,fontSize: 14),
    bodySmall: TextStyle(
        height:2,color:AppColor.grey,fontSize: 14),
    headlineLarge: TextStyle(
        height:2,fontSize:12),
      headlineMedium: TextStyle( fontWeight: FontWeight.bold ,fontSize:12),

  ),
);
ThemeData customDarkTheme = ThemeData.dark().copyWith(
visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme:  const TextTheme(
    titleLarge:  TextStyle(
      fontWeight: FontWeight.bold, fontSize: 18,color:AppColor.primaryColor,fontFamily: "ttf",
    ) ,
    bodyMedium: TextStyle(
      height:2,color:AppColor.primaryColor,fontWeight: FontWeight.bold,fontSize: 16 , fontFamily: "ttf",
    ),
    displaySmall: TextStyle(
      height:2,color:AppColor.primaryColor,fontSize: 14 ,fontFamily: "ttf",
    ),
   bodySmall:  TextStyle(
     height:2,color:AppColor.secondColor,fontSize: 14 ,fontFamily: "ttf",
   ),
  ),
   appBarTheme: AppBarTheme(color: AppColor.primaryColor,),
  //bottomAppBarTheme: BottomAppBarTheme(color:AppColor.secondColor),
    searchBarTheme:SearchBarThemeData( backgroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.focused)) {
        return AppColor.black; // Background color when the search bar is focused
      }
      //return Colors.grey.shade300; // Default background color
      return AppColor.secondColor; // Default background color

    }),)


);

ThemeData customLightTheme = ThemeData.light().copyWith(
visualDensity: VisualDensity.adaptivePlatformDensity,


);

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
//     //bottomNavigationBar:
//
//   );
//
// }
