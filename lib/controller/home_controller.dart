import 'dart:async';
import 'dart:convert';

import 'package:rayaheen_bookstore/core/class/statusrequest.dart';
import 'package:rayaheen_bookstore/core/constant/routes.dart';
import 'package:rayaheen_bookstore/core/services/services.dart';
import 'package:rayaheen_bookstore/data/datasource/remote/home_data.dart';
import 'package:rayaheen_bookstore/data/model/itemsmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uni_links3/uni_links.dart';

import '../core/functions/handlingdatacontroller.dart';
import '../data/model/categorymodel.dart';
import '../linkapi.dart';
import '../view/screen/productdetails.dart';
import '../view/widget/productdetails/prodectdetailsfromlink.dart';

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
  late ItemsModel itemsModel;

  HomeData homedata = HomeData(Get.find());

  //List data = [];
  List categories = [];
  List publishers = [];
  // List books = [];
  // List items = [];
  List<ItemsModel> books = []; // ✅ قائمة تحتوي على جميع الكتب
  List<ItemsModel> items = []; // ✅ قائمة تحتوي على الكتب المصنفة حسب الفئات

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

    print("✅ HomeController بدأ العمل");

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
    print("🔄 جاري جلب جميع الكتب...");

    var response = await homedata.getallitems();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      print("✅ تم جلب البيانات بنجاح");

      if (response['status'] == "success") {
        print("📢 عدد الكتب قبل التحديث: ${books.length}");

        // ✅ تحديث `books` وتحويل البيانات إلى `ItemsModel`
        books = (response['data'] as List)
            .map((json) => ItemsModel.fromJson(json as Map<String, dynamic>))
            .toList();

        print("📢 عدد الكتب بعد التحديث: ${books.length}");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  // Future<void> loadProductById(int id) async {
  //   await fetchAll(); // جلب كل الكتب
  //
  //   itemsModel = books.firstWhere(
  //         (book) => book.itemsId == id,
  //     orElse: () {
  //       statusRequest = StatusRequest.failure;
  //       return ItemsModel(); // تفادي الخطأ
  //     },
  //   );
  //
  //   update();
  // }
  Future<ItemsModel?> loadProductById(int id) async {
    await fetchAll(); // جلب جميع الكتب

    try {
      final matchedBook = books.firstWhere(
            (book) => book.itemsId == id,
      );
      itemsModel = matchedBook;
      update();
      return matchedBook;
    } catch (e) {
      statusRequest = StatusRequest.failure;
      update();
      return null;
    }
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
  // @override
  // getdata() async {
  //   statusRequest = StatusRequest.loading;
  //   var response = await homedata.getData();
  //   print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       // print("heloo2");
  //       categories.addAll(response['categories']['data']);
  //       items.addAll(response['items']['data']);
  //       //categories.addAll(response['data']);
  //       //items.addAll(response[3]['data']);
  //
  //       //print(items[1]);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }
  @override
  getdata() async {
    print("🔄 جاري جلب بيانات الفئات والكتب...");

    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.clear();
        items.clear();

        categories.addAll(response['categories']['data']);

        // ✅ تحويل البيانات إلى `List<ItemsModel>` بدلاً من `Map<String, dynamic>`
        items = (response['items']['data'] as List)
            .map((json) => ItemsModel.fromJson(json as Map<String, dynamic>))
            .toList();

        print("📢 عدد الفئات المحملة: ${categories.length}");
        print("📢 عدد الكتب المحملة داخل items: ${items.length}");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  // List<ItemsModel> getDiscountedBooks() {
  //   return books.where((book) {
  //     if (book.discount == null) return false;
  //
  //     double discount = double.tryParse(book.discount!.discountPercentage ?? "0") ?? 0.0;
  //     if (discount <= 0) return false;
  //
  //     DateTime? expiryDate;
  //     if (book.discount!.expiresAt != null) {
  //       try {
  //         expiryDate = DateTime.parse(book.discount!.expiresAt!);
  //       } catch (e) {
  //         print("❌ خطأ في تحليل expiresAt للكتاب ${book.itemsId}: $e");
  //         return false;
  //       }
  //     }
  //
  //     return expiryDate != null && DateTime.now().isBefore(expiryDate);
  //   }).toList();
  // }


  Future<List<ItemsModel>> getDiscountedBooksAsync() async {
    if (books.isEmpty) {
      await fetchAll(); // أو whatever you use to load the books
    }

    return books.where((book) {
      if (book.discount == null) return false;

      double discount = double.tryParse(book.discount!.discountPercentage ?? "0") ?? 0.0;
      if (discount <= 0) return false;

      DateTime? expiryDate;
      if (book.discount!.expiresAt != null) {
        try {
          expiryDate = DateTime.parse(book.discount!.expiresAt!);
        } catch (e) {
          print("❌ خطأ في تحليل expiresAt للكتاب ${book.itemsId}: $e");
          return false;
        }
      }

      return expiryDate != null && DateTime.now().isBefore(expiryDate);
    }).toList();
  }


  // @override
  // getdata() async {
  //   statusRequest = StatusRequest.loading;
  //   var response = await homedata.getData();
  //   print("=============================== Controller $response ");
  //   statusRequest = handlingData(response);
  //
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       categories.addAll(response['categories']['data']);
  //
  //       // ✅ تحويل البيانات إلى List<ItemsModel> بدلاً من Map<String, dynamic>
  //       items = (response['items']['data'] as List)
  //           .map((json) => ItemsModel.fromJson(json as Map<String, dynamic>))
  //           .toList();
  //
  //       print("📢 عدد الكتب المحملة داخل items: ${items.length}");
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  //   update();
  // }







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

  // goToPageProductDetails(itemsModel) {
  //   //print("hhhheeew");
  //   //print(itemsModel);
  //   Get.toNamed("productdetails", arguments: {"itemsmodel": itemsModel});
  //
  // }

  goToPageProductDetails(ItemsModel itemsModel) {
    Get.toNamed("productdetails", arguments: itemsModel);
  }



}

class SearchMixController extends GetxController {
  List<ItemsModel> listdata = [];
  bool isSearch = false;
  TextEditingController? search;

  late StatusRequest statusRequest;
  HomeData homedata = HomeData(Get.find());
  String normalizeArabic(String text) {
    return text
        .replaceAll(RegExp(r"[أإآ]"), "ا")
        .replaceAll("ؤ", "و")
        .replaceAll("ئ", "ي")
        .replaceAll("ء", "")
        .replaceAll("ة", "ه")
        .replaceAll("ى", "ي")
        .replaceAll(RegExp(r"[\u064B-\u0652]"), ""); // حذف التشكيل
  }


  searchData() async {
    statusRequest = StatusRequest.loading;
    //هذه استخدمها بعد التطبيع من الباكند
    var response = await homedata.searchData(normalizeArabic(search!.text));

    // مؤقتاً أزل التطبيع إذا أردت نتائج البحث تظهر بشكل أفضل
    //var response = await homedata.searchData(search!.text);


    //print(response);
    print("🔍 Search Response: $response"); // Print full response
    print(jsonEncode(response['data']));

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

// class DeepLinkService {
//   static StreamSubscription? _sub;
//
//   static void initLinkListener() {
//     _sub = uriLinkStream.listen((Uri? uri) {
//       if (uri != null && uri.scheme == 'rayaheenbooks') {
//         if (uri.host == 'product') {
//           final productId = uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : null;
//           if (productId != null) {
//             Get.to(() => ProductDetails(productId: int.parse(productId)));
//           }
//         }
//       }
//     }, onError: (err) {
//       // التعامل مع الأخطاء إذا لزم
//     });
//   }
//
//   static void dispose() {
//     _sub?.cancel();
//   }
// }
// class DeepLinkHandler {
//   static StreamSubscription? _sub;
//
//   static void init() {
//     _sub = uriLinkStream.listen((Uri? uri) {
//       if (uri != null && uri.scheme == 'rayaheenbooks' && uri.host == 'product') {
//         final String? id = uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : null;
//         if (id != null) {
//           Get.to(() => ProductDetailsFromLink(productId: int.parse(id))); // أنشئ هذه الصفحة لفتح المنتج مباشرة
//         }
//       }
//     });
//   }
//
//   static void dispose() => _sub?.cancel();
// }



class DeepLinkHandler {
  static StreamSubscription? _sub;

  /// ✅ استدعِ هذه في بداية التطبيق
  static Future<void> init() async {
    // ⬅️ أولاً: التعامل مع الرابط الأول إذا تم فتح التطبيق به
    final initialUri = await getInitialUri();
    _handleUri(initialUri);

    // ⬅️ ثانيًا: الاستماع للتغييرات أثناء التشغيل
    _sub = uriLinkStream.listen((Uri? uri) {
      _handleUri(uri);
    }, onError: (err) {
      print("خطأ في قراءة الرابط: $err");
    });
  }

  static void _handleUri(Uri? uri) {
    if (uri != null && uri.scheme == 'rayaheenbooks' && uri.host == 'product') {
      final String? id = uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : null;
      if (id != null) {
        final int? productId = int.tryParse(id);
        if (productId != null) {
          Get.to(() => ProductDetailsFromLink(productId: productId));
        }
      }
    }
  }

  static void dispose() => _sub?.cancel();
}
