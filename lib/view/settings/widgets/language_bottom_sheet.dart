import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constrains/constants.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.h,
          right: 20.h,
          // top: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Align(
              child: Icon(
                Icons.horizontal_rule_rounded,
                size: 60,
                weight: 80,
                color: lightBlackColor,
              ),
            ),
            clickableText(text: 'English'),
            const Divider(
              color: textFieldBoarderColor,
            ),
            clickableText(text: 'Arabic'),
            const Divider(color: textFieldBoarderColor),
            clickableText(text: 'French'),
            const Divider(color: textFieldBoarderColor),
            clickableText(text: 'German'),
            kSizedBoxH,
          ],
        ),
      ),
    );
  }

  GestureDetector clickableText({required String text}) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: SizedBox(
        width: double.infinity,
        child: Text(
          text,
          style: const TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
