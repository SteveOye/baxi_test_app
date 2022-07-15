import 'dart:developer';

import 'package:baxi_app/constant/api_client/exception.dart';
import 'package:baxi_app/constant/widget/custom_dialog.dart';
import 'package:baxi_app/constant/widget/snackbar.dart';
import 'package:baxi_app/feature/cable/data/model/packages.dart';
import 'package:baxi_app/feature/cable/data/model/user.dart';
import 'package:baxi_app/feature/cable/data/repository/cable_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CableController extends GetxController {
  final CableImpl _cableImpl = CableImpl();

  var name = ''.obs;
  var listOfOptions = <String>[].obs;
  var listOfPlans = <String>[].obs;
  var listOfPackages = <Package>[].obs;
  var user = User().obs;
  var options;

  Future<void> validateCard(var params, BuildContext context) async {
    try {
      context.loaderOverlay.show();
      var response = await _cableImpl.validateCard(params);
      name(response.name);
      user(response);

      listOfOptions.clear();
      listOfPlans.clear();

      Map<String, dynamic> package_params = {
        "service_type": 'dstv',
      };

      options = await _cableImpl.getPackages(package_params);
      listOfPackages(options);

      for (Package package in options) {
        listOfOptions.add(package.name.toString());
        // optios = package.availablePricingOptions;
      }
      context.loaderOverlay.hide();
    } on NetworkException {
      context.loaderOverlay.hide();
      rethrow;
    }
  }

  Future<void> buyCable(var params, BuildContext context) async {
    try {
      context.loaderOverlay.show();
      var response = await _cableImpl.buyCable(params);
      log(response);
      if (response == "success") {
        showDialog(context: context, builder: (_) => const SuccessDialog());
      } else {
        showGetSnackBar(message: "An error occurred, Try again");
      }
    } finally {
      context.loaderOverlay.hide();
    }
  }
}
