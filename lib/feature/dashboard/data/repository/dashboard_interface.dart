import 'package:baxi_app/feature/dashboard/data/model/balance.dart';

abstract class DashboardInterface {
  Future<Balance> getBalance();
}
