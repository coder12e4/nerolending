import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/constrains/constants.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer(
      {super.key,
      this.heading,
      this.contentOne,
      this.contentTwo,
      this.contentThree});
  final String? heading;
  final String? contentOne;
  final String? contentTwo;
  final String? contentThree;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170.h,
      decoration: BoxDecoration(
        color: lightBlackColor.withOpacity(.4),
        border: const Border.symmetric(
          horizontal: BorderSide(color: textFieldBoarderColor),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0).r,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                heading!,
                style: const TextStyle(
                    color: smallTextColor, fontWeight: FontWeight.w600),
              ),
            ),
            kSizedBoxH,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 170.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: lightBlackColor),
                      borderRadius: BorderRadius.circular(10).r,
                      color: lightBlackColor.withOpacity(.6)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        contentOne!,
                        style: const TextStyle(color: whiteColor),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 170.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: lightBlackColor),
                      borderRadius: BorderRadius.circular(10).r,
                      color: lightBlackColor.withOpacity(.6)),
                  child: Center(
                    child: Text(
                      contentTwo!,
                      style: const TextStyle(color: whiteColor),
                    ),
                  ),
                ),
              ],
            ),
            kSizedBoxH20,
            Container(
              width: 360.w,
              height: 30.h,
              decoration: BoxDecoration(
                  border: Border.all(color: lightBlackColor),
                  borderRadius: BorderRadius.circular(10).r,
                  color: lightBlackColor.withOpacity(.6)),
              child: Center(
                child: Text(
                  contentThree!,
                  style: const TextStyle(color: whiteColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
