import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/colors/colors.dart';

loadingWidget() {
  return Get.dialog(
    SimpleDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      children: [
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CupertinoActivityIndicator(
              color: whiteColor.withOpacity(.4),
              radius: 20.r,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                child: Text(
              "Please wait".tr,
              style: const TextStyle(
                color: whiteColor,
              ),
            )),
          ],
        )
      ],
    ),
    barrierDismissible: false,
  );
}
