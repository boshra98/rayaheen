

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addFavorite(String usersid, String itemsid) async {
    print( AppLink.favoriteAdd);
    var response = await crud.postData(
        AppLink.favoriteAdd, {"user_id": usersid, "book_id": itemsid});
    print(response);
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.favoriteRemove, {"user_id": usersid, "book_id": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
