

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  postdata(String phone ,String password) async {
    print(phone);
    print(password);

    var response = await crud.postData(AppLink.login, {
      "phone" : phone ,
      "password" : password
    });
    return response.fold((l) => l, (r) => r);
  }
}

