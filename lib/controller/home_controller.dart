import 'package:rayaheen_bookstore/core/class/statusrequest.dart';
import 'package:rayaheen_bookstore/core/constant/routes.dart';
import 'package:rayaheen_bookstore/core/services/services.dart';
import 'package:rayaheen_bookstore/data/datasource/remote/home_data.dart';
import 'package:rayaheen_bookstore/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdatacontroller.dart';
import '../data/model/categorymodel.dart';
import '../linkapi.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoryid);
  goToItemsage(List  categories, int selectedCat);
  goToItemsByPublisher(String publisher,List  categories);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;
  String? lang;

  HomeData homedata = HomeData(Get.find());

  //List data = [];
  List categories = [];
  List publishers = [];
  List books = [];
  List items = [];
  List newitems = [];

  // CategoriesModel categoriesModel = controller.categories[index];


  // List items = [];

  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    initialData();
    fetchPublishers();
    fetchAll();
    fetchnew();// Fetch publishers when the controller initializes
    super.onInit();
  }



  @override
  fetchAll() async {
    //statusRequest = StatusRequest.loading;
    var response = await homedata.getallitems();
    print("fetch");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("fetch coreect");

      if (response['status'] == "success") {
        // print("heloo2");
        print("fetch coreect1");

        books.addAll(response['data']);
        // items.addAll(response['items']['data']);
        //categories.addAll(response['data']);
        //items.addAll(response[3]['data']);

        //print(items[1]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();

  }
  @override
  fetchnew() async {
    //statusRequest = StatusRequest.loading;
    var response = await homedata.getnewitems();
    print("fetch");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("fetch coreect");

      if (response['status'] == "success") {
        // print("heloo2");
        print("fetch coreect1");

        newitems.addAll(response['data']);
        // items.addAll(response['items']['data']);
        //categories.addAll(response['data']);
        //items.addAll(response[3]['data']);

        //print(items[1]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  fetchPublishers() async {
    //statusRequest = StatusRequest.loading;
    var response = await homedata.fetchPublishers();
    print("fetch");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      print("fetch coreect");

      if (response['status'] == "success") {
        // print("heloo2");
        print("fetch coreect1");

        publishers.addAll(response['data']);
       // items.addAll(response['items']['data']);
        //categories.addAll(response['data']);
        //items.addAll(response[3]['data']);

        //print(items[1]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // print("heloo2");
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        //categories.addAll(response['data']);
        //items.addAll(response[3]['data']);

        //print(items[1]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }









  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }
  @override
  goToItemsage( categories, selectedCat) {
    Get.toNamed(AppRoute.itemsage, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,

    });
  }
  @override
  goToItemsByPublisher( publisher,categories) {
    Get.toNamed(AppRoute.itemspublisher, arguments: {
      "publisher": publisher,
      "categories": categories,


    });
  }

  goToPageProductDetails(itemsModel) {
    //print("hhhheeew");
    //print(itemsModel);
    Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});

  }




}

class SearchMixController extends GetxController {
  List<ItemsModel> listdata = [];
  bool isSearch = false;
  TextEditingController? search;

  late StatusRequest statusRequest;
  HomeData homedata = HomeData(Get.find());

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    //print(response);
    print("🔍 Search Response: $response"); // Print full response

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response['data'];
        listdata.addAll(responsedata.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
      listdata.clear(); // Clear the list if input is empty

    }
    update();
  }

  onSearchItems( search) {
    isSearch = true;
    searchData();
    update();
  }
// Method to clear the search text and results
  void clearSearch() {
    search?.clear(); // Clear the search text
    listdata.clear(); // Clear the search results
    statusRequest = StatusRequest.none; // Reset the status
    update(); // Notify the UI
  }
// void onSearchItems(String search) {
//   if (searchText.isNotEmpty) {
//     // Perform search logic here, update listdata accordingly
//     print('Searching for: $searchText');
//     // Example logic to filter items based on the searchText
//     listdata = filterItems(searchText);
//     isSearch = true;
//   } else {
//     isSearch = false;
//   }
//   update();  // Make sure to call update to refresh UI
// }

}
