import 'dart:convert';

import 'package:baxi_app/constant/api_client/api_client.dart';
import 'package:baxi_app/constant/api_client/endpoints.dart';
import 'package:baxi_app/constant/api_client/exception.dart';
import 'package:baxi_app/feature/Subscription/data/repository/data_interface.dart';

import '../../../subscription/data/model/data_request.dart';
import '../../../subscription/data/model/plans.dart';

class DataImpl extends ApiClient implements DataInterface {
  @override
  Future<List<Plans>> getPlans(var params) async {
    try {
      var response = await post(
        GET_BUNDLE,
        params: {
          'service_type': params,
        },
      );
      return plansFromJson(json.encode(response['data']));
    } on NetworkException {
      rethrow;
    }
  }

  @override
  Future<String> buyData(DataRequest dataRequest) async {
    try {
      var response = await post(
        BUY_DATA,
        params: dataRequest.toJson(),
      );
      return response['status'];
    } on NetworkException {
      rethrow;
    }
  }
}
