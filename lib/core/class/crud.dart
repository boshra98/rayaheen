// import 'dart:convert';
// import 'package:rayaheen_bookstore/core/class/statusrequest.dart';
// import '../functions/checkinternet.dart';
// import 'package:http/http.dart' as http;
// import 'package:dartz/dartz.dart';
//
//
// class Crud {
//   Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
//
//     if (await checkInternet()) {
//       var response = await http.post(Uri.parse(linkurl), body: data);
//       print(response.statusCode) ;
//
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Map responsebody = jsonDecode(response.body);
//         print(responsebody) ;
//         return Right(responsebody);
//       } else {
//         return const Left(StatusRequest.serverfailure);
//       }
//     } else {
//       return const Left(StatusRequest.offlinefailure);
//     }
//
//
//   }
// }

import 'dart:convert';
import 'package:rayaheen_bookstore/core/class/statusrequest.dart';
import '../functions/checkinternet.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class Crud {
  /// الدالة الأصلية - تستخدم `application/x-www-form-urlencoded`
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print(responsebody);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }

  /// الدالة الجديدة - ترسل البيانات بصيغة JSON (مثالية للأرقام والتراكيب)
  Future<Either<StatusRequest, Map>> postJsonData(String linkurl, Map<String, dynamic> data) async {
    if (await checkInternet()) {
      try {
        var response = await http.post(
          Uri.parse(linkurl),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(data),
        );

        print(response.statusCode);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } catch (e) {
        print("Error sending JSON data: $e");
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offlinefailure);
    }
  }
}
