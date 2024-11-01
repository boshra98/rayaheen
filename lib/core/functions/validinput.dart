// import 'package:get/get_utils/src/get_utils/get_utils.dart';
//
// validInput( String val , int min , int max ,  String type)
// {
//   if( type =="username"){
//     if(!GetUtils.isUsername(val)){
//       return"not valid username" ;
//     }
//   }
//
//   if( type =="email"){
//     if(!GetUtils.isEmail(val)){
//       return"not valid email" ;
//     }
//   }
//
//   if( type =="phone"){
//     if(!GetUtils.isPhoneNumber(val)){
//       return"not valid phone" ;
//     }
//
//     if(type=="address"){
//       if(!GetUtils.isUsername(val)){
//         return"not valid address" ;
//       }
//
//     }
//   }
//
//   if(val.length<min){
//     return " can't be less than $min" ;
//   }
//
//   if(val.length>max){
//     return " can't be larger than $max" ;
//   }
//
//   if(val.isEmpty){
//     return " can't be Empty" ;
//   }
//
// }

import 'package:get/get_utils/src/get_utils/get_utils.dart';

// Function to check if the input contains only Arabic characters
bool isArabic(String val) {
  final arabicRegex = RegExp(r'^[\u0600-\u06FF\s]+$');
  return arabicRegex.hasMatch(val);
}

String? validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "لا يمكن أن يكون فارغاً"; // "Can't be empty" in Arabic
  }

  // Handle username validation (allow Arabic characters)
  if (type == "username" || type == "address") {
    if (!isArabic(val)) {
      return "الاسم غير صالح، يجب أن يحتوي على أحرف عربية فقط"; // "Invalid username/address, should contain only Arabic letters"
    }
  }

  // Handle email validation
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "البريد الإلكتروني غير صالح"; // "Not a valid email" in Arabic
    }
  }

  // Handle phone number validation
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "رقم الهاتف غير صالح"; // "Not a valid phone number" in Arabic
    }
  }

  // Check length
  if (val.length < min) {
    return "لا يمكن أن يكون أقل من $min"; // "Can't be less than $min" in Arabic
  }

  if (val.length > max) {
    return "لا يمكن أن يكون أكبر من $max"; // "Can't be larger than $max" in Arabic
  }

  return null; // Return null if the input is valid
}
