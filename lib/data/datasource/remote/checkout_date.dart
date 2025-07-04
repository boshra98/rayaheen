
import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

// class CheckoutData {
//   Crud crud;
//   CheckoutData(this.crud);
//   postdata(String id ,String city ,String area ,String street ,String paymentMethod,String phone) async {
//     var response = await crud.postData(AppLink.checkout, {
//       "user_id":id,
//       "city":city,
//       "area":area,
//       "street":street,
//       "paymentMethod":paymentMethod,
//       "phone":phone,
//
//     }
//        );
//     return response.fold((l) => l, (r) => r);
//   }
// }

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);

  Future postdata(
      String id,
      String city,
      String area,
      String street,
      String paymentMethod,
      String phone,
      double total, // ✅ السعر بعد الحسم فقط
      ) async {
    var response = await crud.postJsonData(AppLink.checkout, {
      "user_id": id,
      "city": city,
      "area": area,
      "street": street,
      "payment_method": paymentMethod,
      "phone": phone,
      "total": total, // ✅ هذا ما تريده زميلتك
    });

    return response.fold((l) => l, (r) => r);
  }
}

