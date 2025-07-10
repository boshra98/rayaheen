// import '../../../../core/class/crud.dart';
// import '../../../../linkapi.dart';
//
// class VerifyCodeForgetPasswordData {
//   Crud crud;
//   VerifyCodeForgetPasswordData(this.crud);
//   postdata(String email ,String verifycode) async {
//     var response = await crud.postData(AppLink.verifycode, {
//       "email" : email ,
//       "verifycode" : verifycode
//     });
//     return response.fold((l) => l, (r) => r);
//   }
// }

class VerifyCodeResponseModel {
  final String status;
  final String message;

  VerifyCodeResponseModel({
    required this.status,
    required this.message,
  });

  factory VerifyCodeResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyCodeResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
