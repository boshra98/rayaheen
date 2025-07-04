// import 'dart:io';
//
// checkInternet() async {
//   try {
//     var result = await InternetAddress.lookup("google.com");
//     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//       return true;
//     }
//   }on SocketException catch (_) {
//     return false;
//   }
// }

import 'package:http/http.dart' as http;

/// دالة تتحقق من وجود الإنترنت وتدعم Flutter Web
// Future<bool> checkInternet() async {
//   try {
//     final response = await http.get(Uri.parse("https://www.google.com"));
//     return response.statusCode == 200;
//   } catch (_) {
//     return false;
//   }
// }

Future<bool> checkInternet() async {
  return true; // مؤقتًا فقط للتجربة
}

