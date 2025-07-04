import 'package:get_storage/get_storage.dart';

void storeUserData(Map<String, dynamic> userMap, String userId) {
  userMap['id'] = userId;
  GetStorage().write("user", userMap);
  print("✅ تم تخزين بيانات المستخدم: $userMap");
}
