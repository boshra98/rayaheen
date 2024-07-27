

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String email ,String password) async {
    var response = await crud.postData(AppLink.login, {
      "email" : email ,
      "password" : password
    });
    return response.fold((l) => l, (r) => r);
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class Apilogin {
//   final String baseUrl = 'http://192.168.1.123:8000/api';
//
//   Future<void> registerUser(String name, String email, String password) async {
//     final url = Uri.parse('$baseUrl/register');
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'name': name,
//         'email': email,
//         'password': password,
//         'password_confirmation': password,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       print('User registered successfully');
//     } else {
//       print('Failed to register user');
//       print(response.body);
//     }
//   }
//
//   Future<void> verifyUser(String email, String code) async {
//     final url = Uri.parse('$baseUrl/verify');
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'email': email,
//         'code': code,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       print('User verified successfully');
//     } else {
//       print('Failed to verify user');
//       print(response.body);
//     }
//   }
//   Future<void> login2(String email, String password) async {
//     final url = Uri.parse('$baseUrl/login');
//     final response = await http.post(
//       url,
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'email': email,
//         'password': password,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       final responseBody = jsonDecode(response.body);
//       print('Login successful: ${responseBody['access_token']}');
//       // You can save the token and navigate to the next screen
//     } else {
//       print('Failed to login');
//       print(response.body);
//     }
//   }
//
//
//
// }
