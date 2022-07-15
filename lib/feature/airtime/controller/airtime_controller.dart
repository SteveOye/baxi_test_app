import 'dart:developer';

import 'package:baxi_app/constant/widget/custom_dialog.dart';
import 'package:baxi_app/constant/widget/snackbar.dart';
import 'package:baxi_app/feature/airtime/data/repository/airtime_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AirtimeController extends GetxController {
  final AirtimeImpl _airtimeImpl = AirtimeImpl();

  Future<void> buyAirtime(var params, BuildContext context) async {
    try {
      context.loaderOverlay.show();
      var response = await _airtimeImpl.buyAirtime(params);
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
