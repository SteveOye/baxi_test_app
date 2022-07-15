import 'package:baxi_app/constant/widget/custom_dialog.dart';
import 'package:baxi_app/constant/widget/snackbar.dart';
import 'package:baxi_app/feature/subscription/data/repository/data_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../subscription/data/model/plans.dart';

class DataController extends GetxController {
  final DataImpl _dataImpl = DataImpl();
  var listOfPlans = <String>[].obs;
  var originalPlan = <Plans>[].obs;
  Future<void> getPlans(var params, BuildContext context) async {
    try {
      context.loaderOverlay.show();
      var response = await _dataImpl.getPlans(params);
      originalPlan(response);
      listOfPlans.clear();
      for (Plans plans in response) {
        listOfPlans.add('${plans.name} - NGN${plans.price}');
      }
    } finally {
      context.loaderOverlay.hide();
    }
  }
  //bug in the list of airtime for glo,
  //duplicate entry of data plan from server.
  //causing the list on dropdown to break

  Future<void> buyData(var params, BuildContext context) async {
    try {
      context.loaderOverlay.show();
      var response = await _dataImpl.buyData(params);
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
