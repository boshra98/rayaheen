// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../core/constant/imageasset.dart';
//
// class Menue extends StatelessWidget {
//   const Menue({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//
//
//         Container(
//           width:80 ,
//
//           child:
//           Drawer(
//               child: Container(
//               padding: const EdgeInsets.all(15),
//
//               // padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: ListView(
//               children:  [
//               Row(
//               children: [
//               SizedBox(
//               width: 80,
//               height:80 ,
//
//               child:ClipRRect(
//               borderRadius: BorderRadius.circular(60),
//               child: Image.asset(
//               ImageAsset.logo ,
//               fit: BoxFit.cover ,
//               ),
//               )
//               ),
//               const Expanded(child:ListTile(
//               title: Text("رياحين")
//               ))
//               ],
//               ) ,
//               ListTile(
//               title:  Text("8".tr),
//               leading: const Icon(Icons.wb_sunny_outlined),
//               // onTap:(){
//               // if(Get.isDarkMode){
//               // Get.changeTheme(Themes.customLightTheme);
//               // } else{
//               // Get.changeTheme(Themes.customDarkTheme);
//               // }
//               // },
//                ),
//               ListTile(
//               title:  Text("9".tr),
//               leading: const Icon(Icons.language),
//               onTap:(){
//              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Language()));
//               },
//               ),
//               ListTile(
//               title:  Text("7".tr),
//               leading: const Icon(Icons.help_outline_outlined),
//               onTap:(){
//             //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OnBoarding()));
//
//
//               },
//               ),
//               ListTile(
//               title:  Text("27".tr),
//               leading: const Icon(Icons.phone_android_outlined),
//               onTap:(){
//             //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Guide()));
//
//               },
//               ),
//               ListTile(
//               title:  Text("36".tr),
//               leading: const Icon(Icons.policy),
//               onTap:(){
//               //showAlertDialog(context);
//               },
//               ),
//               ListTile(
//               title: Text("38".tr),
//               leading: const Icon(Icons.star),
//               onTap: () {
//             //  _launchStoreURL();
//               },
//               ),
//               ListTile(
//               title: Text('40'.tr),
//               leading: const Icon(Icons.apps),
//               onTap: () {},
//               ),
//               ])
//
//               )
//               ),
//         );
//
//
//   }
// }
//
