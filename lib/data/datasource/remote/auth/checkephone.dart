

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class CheckphoneData {
  Crud crud;
  CheckphoneData(this.crud);
  postdata(String phone) async {
    var response = await crud.postData(AppLink.checkPhone, {
      "phone" : phone
    });
    return response.fold((l) => l, (r) => r);
  }
}
