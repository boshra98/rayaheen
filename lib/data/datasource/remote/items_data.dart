

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id , String userid) async {
    var response = await crud.postData(AppLink.items, {"id" : "${id}" , "user_id" : userid});
    return response.fold((l) => l, (r) => r);
  }
  getDataage(String id , String userid) async {
    var response = await crud.postData(AppLink.itemsage, {"id" : "${id}" , "user_id" : userid});
    return response.fold((l) => l, (r) => r);
  }
  getDatapubliher( String publisher) async {
    var response = await crud.postData(AppLink.itemspublisher, {"publisher" : publisher});
    return response.fold((l) => l, (r) => r);
  }
}
