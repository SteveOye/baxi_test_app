import 'package:flutter/material.dart';
import 'package:get/get.dart';

showGetSnackBar({
  required message,
  int? duration,
  var position = SnackPosition.BOTTOM,
}) {
  return Get.showSnackbar(
    GetSnackBar(
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
      message: message,
      borderRadius: 6.0,
      isDismissible: true,
      snackPosition: position,
      duration: Duration(seconds: duration ?? 4),
    ),
  );
}
