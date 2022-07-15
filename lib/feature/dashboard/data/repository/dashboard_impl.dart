import 'package:baxi_app/constant/api_client/api_client.dart';
import 'package:baxi_app/constant/api_client/endpoints.dart';
import 'package:baxi_app/constant/api_client/exception.dart';
import 'package:baxi_app/feature/dashboard/data/model/balance.dart';

import 'dashboard_interface.dart';

class DashboardImpl extends ApiClient implements DashboardInterface {
  @override
  Future<Balance> getBalance() async {
    try {
      var response = await get(BALANCE);
      Balance balance = Balance.fromJson(response['data']);
      return balance;
    } on NetworkException {
      rethrow;
    }
  }
}
