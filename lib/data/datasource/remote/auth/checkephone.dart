

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class CheckphoneData {
  Crud crud;
  CheckphoneData(this.crud);
  postdata(String phone, String email) async {
    var response = await crud.postData(AppLink.requestReset, {
      "phone" : phone,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
