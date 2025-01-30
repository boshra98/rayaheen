

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.homepage, {});
    print("hello");
   // print(response);
    return response.fold((l) => l, (r) => r);
  }
  fetchPublishers() async {
    var response = await crud.postData(AppLink.publishers, {});
    print("hello");
    // print(response);
    return response.fold((l) => l, (r) => r);
  }
  getallitems() async {
    var response = await crud.postData(AppLink.allbooks, {});
    print("hello");
    // print(response);
    return response.fold((l) => l, (r) => r);
  }
  getnewitems() async {
    var response = await crud.postData(AppLink.newitems, {});
    print("hello");
    // print(response);
    return response.fold((l) => l, (r) => r);
  }
  searchData(String search) async {
    var response = await crud.postData(AppLink.searchitems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
