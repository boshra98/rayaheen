

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postdata(String phone ,String password) async {
    var response = await crud.postData(AppLink.resetPassword, {
      "phone" : phone ,
      "password" : password
    });
    return response.fold((l) => l, (r) => r);
  }
}
