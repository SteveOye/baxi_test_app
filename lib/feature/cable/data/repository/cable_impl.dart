import 'dart:convert';

import 'package:baxi_app/constant/api_client/api_client.dart';
import 'package:baxi_app/constant/api_client/endpoints.dart';
import 'package:baxi_app/constant/api_client/exception.dart';
import 'package:baxi_app/feature/cable/data/model/cable_request.dart';
import 'package:baxi_app/feature/cable/data/model/packages.dart';
import 'package:baxi_app/feature/cable/data/model/user.dart';
import 'package:baxi_app/feature/cable/data/repository/cable_interface.dart';

class CableImpl extends ApiClient implements CableInterface {
  @override
  Future<User> validateCard(var params) async {
    try {
      var response = await post(
        NAME_FINDER,
        params: params,
      );
      User user = User.fromJson(response['data']['user']);
      return user;
    } on NetworkException {
      rethrow;
    }
  }

  @override
  Future<List<Package>> getPackages(params) async {
    try {
      var response = await post(
        CABLE_PACKAGES,
        params: params,
      );
      List<Package> lisOfOptions =
          packageFromJson(json.encode(response['data']));
      return lisOfOptions;
    } on NetworkException {
      rethrow;
    }
  }

  @override
  Future<String> buyCable(CableRequest params) async {
    try {
      var response = await post(
        CABLE_BUY,
        params: params.toJson(),
      );
      return response['status'];
    } on NetworkException {
      rethrow;
    }
  }
}
