import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomTitleHome extends StatelessWidget {
  final String title ; 
  const CustomTitleHome({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center, // This centers the text inside the container
      child:
      Text(title,
          textAlign: TextAlign.center,
          style:const  TextStyle(
              fontSize: 20,
              color: AppColor.primaryColor,

              fontWeight: FontWeight.bold),
      ),
    );

  }
}
