import 'dart:developer';

import 'package:baxi_app/constant/api_client/api_client.dart';
import 'package:baxi_app/constant/api_client/endpoints.dart';
import 'package:baxi_app/constant/api_client/exception.dart';
import 'package:baxi_app/feature/airtime/data/repository/airtime_interface.dart';

class AirtimeImpl extends ApiClient implements AirtimeInterface {
  @override
  Future<String> buyAirtime(var params) async {
    try {
      var response = await post(PROVIDERS, params: params.toJson());
      log(response.toString());
      return response['status'];
    } on NetworkException {
      rethrow;
    }
  }
}
