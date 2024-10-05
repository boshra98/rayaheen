import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CardDeliveryAddressCheckout extends StatelessWidget {
  final String hinttext ;
  final String labeltext ;
  final TextEditingController? mycontroller;
  final String? Function(String?)valid ;
  final bool isNumber;
  const CardDeliveryAddressCheckout({Key? key, required this.hinttext, required this.labeltext, this.mycontroller, required this.valid, required this.isNumber, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.only(bottom:20),
      child: // Add some space between text and fields

          // First TextField
          TextFormField(
            keyboardType:isNumber ?TextInputType.numberWithOptions(decimal:true):TextInputType.text,
            validator: valid ,
            controller: mycontroller,
            decoration: InputDecoration(
              labelText: labeltext,
              hintText: hinttext,
              hintStyle:const  TextStyle(fontSize: 14),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(vertical:5 , horizontal: 30)

          ),
          ),



    );
  }
}
