import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaheen_bookstore/router.dart';
import 'package:rayaheen_bookstore/view/screen/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'binding/initialbinding.dart';
import 'controller/cart_controller.dart';
import 'controller/home_controller.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/cartservices.dart';
import 'core/services/services.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
  //Get.put<CartService>(CartService(), permanent: true);
  Get.put<CartService>(CartService(), permanent: true);

  await initialservices();
  await GetStorage.init(); // ← مهم جداً
  await DeepLinkHandler.init();

  // DeepLinkService.initLinkListener();
  // await DeepLinkHandler.init();

  // Register CartService

 // Get.put(CartService(), permanent: true);

  // Register CartController (dependencies resolved in onInit)
  // Get.put(CartController(), permanent: true);
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());

    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale:controller.language,
      themeMode: ThemeMode.light, // ✅ مانع التبديل التلقائي للوضع الداكن

      theme: controller.appTheme ,
      initialBinding:InitialBindings() ,

      //: routes,
     getPages: routes,
     // home:
       //HomeScreen(),


      //const Language(),
     // routes: routes,
    );
  }
}