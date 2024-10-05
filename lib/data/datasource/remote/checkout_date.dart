
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  postdata(String id ,String city ,String area ,String street ,String paymentMethod) async {
    var response = await crud.postData(AppLink.checkout, {
      "user_id":id,
      "city":city,
      "area":area,
      "street":street,
      "paymentMethod":paymentMethod,

    }
       );
    return response.fold((l) => l, (r) => r);
  }
}
