import 'package:baxi_app/feature/airtime/controller/airtime_controller.dart';
import 'package:baxi_app/feature/cable/controller/cable_controller.dart';
import 'package:baxi_app/feature/dashboard/controller/dashboard_controller.dart';
import 'package:baxi_app/feature/subscription/controller/data_controller.dart';
import 'package:get/get.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(), fenix: true);
    Get.lazyPut(() => AirtimeController(), fenix: true);
    Get.lazyPut(() => DataController(), fenix: true);
    Get.lazyPut(() => CableController(), fenix: true);
  }
}
