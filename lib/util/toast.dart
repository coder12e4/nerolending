import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../core/colors/colors.dart';

void showToast(String message, {bool isError = true}) {
  Get.closeAllSnackbars();
  HapticFeedback.lightImpact();
  Get.showSnackbar(GetSnackBar(
    backgroundColor: isError ? Colors.redAccent.withOpacity(.4) : Colors.black,
    message: message,
    duration: const Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.all(10),
    borderRadius: 10,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
  ));
}

void longToast(String message, {bool isError = true}) {
  Get.closeAllSnackbars();
  HapticFeedback.lightImpact();
  Get.showSnackbar(GetSnackBar(
    backgroundColor: isError ? Colors.red.withOpacity(.4) : Colors.black,
    // message: message.tr,
    messageText: Text(
      message,
      style: const TextStyle(
        color: whiteColor,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    duration: const Duration(seconds: 6),
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.all(10),
    borderRadius: 10,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
  ));
}

void successToast(String message) {
  Get.closeAllSnackbars();
  HapticFeedback.lightImpact();
  Get.showSnackbar(GetSnackBar(
    backgroundColor: Colors.green.withOpacity(.4),
    message: message.tr,
    duration: const Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    margin: const EdgeInsets.all(10),
    borderRadius: 10,
    isDismissible: true,
    dismissDirection: DismissDirection.horizontal,
  ));
}
