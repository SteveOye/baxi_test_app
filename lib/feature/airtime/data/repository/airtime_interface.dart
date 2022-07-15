import 'package:baxi_app/feature/airtime/data/model.dart/airtime.dart';

abstract class AirtimeInterface {
  Future<String> buyAirtime(Airtime airtime);
}
