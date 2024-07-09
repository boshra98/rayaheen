
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

 alertExitApp(){
   return Get.defaultDialog(
    title: "تنبيه" ,
      middleText:"هل تريد الخروج من التطبيق" ,
      actions:[
        ElevatedButton(onPressed: (){
          exit(0);
        },child:Text("اجل"))   ,
  ElevatedButton(onPressed: (){
    Get.back();
  },child:Text("لا أرغب"))

  ]);
}