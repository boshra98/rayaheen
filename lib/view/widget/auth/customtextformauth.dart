import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/services/formatted.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext ;
  final String labeltext ;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?)valid ;
  final bool isNumber;

  const  CustomTextFormAuth({Key? key, required this.hinttext, required this.labeltext, required this.iconData, required this.mycontroller, required this.valid, required this.isNumber ,  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.only(bottom:20),
      child: TextFormField(
        keyboardType:isNumber ?TextInputType.numberWithOptions(decimal:true):TextInputType.text,
        //inputFormatters: [EnglishDigitsFormatter()],
        style: const TextStyle(
            fontSize: 18.0, // Adjust the font size as needed
            color: Colors.black,
          fontFamily:"cairo" ,
// Adjust the text color as needed
        ),

        validator: valid ,
        controller: mycontroller,
        decoration: InputDecoration(

            hintText: hinttext,
            hintStyle:const  TextStyle(fontSize: 14),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(vertical:5 , horizontal: 30),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 9),
                child:  Text(labeltext ,style: const TextStyle(fontSize: 14,fontFamily:"cairo" ,
                ), ) ),
            suffixIcon: Icon(iconData) ,
            border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
            )
        ),
      ),
    );
  }
}