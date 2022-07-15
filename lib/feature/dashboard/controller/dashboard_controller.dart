import 'dart:developer';
import 'package:baxi_app/feature/dashboard/data/repository/dashboard_impl.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var balance = 0.0.obs;
  final DashboardImpl _dashboardImpl = DashboardImpl();

  @override
  void onInit() {
    super.onInit();
    getBalance();
  }

  Future<void> getBalance() async {
    try {
      var response = await _dashboardImpl.getBalance();
      log(response.balance.toString());
      balance(response.balance);
    } finally {
      // context.loaderOverlay.hide();
    }
  }
}
