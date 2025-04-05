
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/pending_data.dart';
import '../../data/model/ordersmodel.dart';

class OrdersPendingController extends GetxController {
  
  OrdersPendingData ordersPendingData = OrdersPendingData(Get.find());

  List<OrdersModel> data = [];

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "71".tr;
    } else {
      return "72".tr;
    }
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    }  else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }
  getOrders() async {
    final userId = myServices.sharedPreferences.getString("id");
    if (userId == "guest") {
      Get.snackbar("تنبيه", "يرجى تسجيل الدخول لعرض الطلبات");
      Future.delayed(Duration(seconds: 1), () {
        Get.toNamed(AppRoute.login);
      });
      return;
    }
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData
        .getData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  deleteOrder(int orderid) async {
    final userId = myServices.sharedPreferences.getString("id");
    if (userId == "guest") {
      Get.snackbar("تنبيه", "يرجى تسجيل الدخول لعرض الطلبات");
      Future.delayed(Duration(seconds: 1), () {
        Get.toNamed(AppRoute.login);
      });
      return;
    }
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersPendingData.deleteData("${orderid}");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        refrehOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrehOrder() {
    getOrders();
  }

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}
