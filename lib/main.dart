import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rayaheen_bookstore/router.dart';
import 'package:rayaheen_bookstore/view/screen/language.dart';

import 'binding/initialbinding.dart';
import 'core/constant/color.dart';
import 'core/localization/changelocal.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
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
      theme: controller.appTheme ,
      initialBinding:InitialBindings() ,
      // routes: routes,
      getPages: routes,
     // home:
      //Test(),

      //const Language(),
     // routes: routes,
    );
  }
}