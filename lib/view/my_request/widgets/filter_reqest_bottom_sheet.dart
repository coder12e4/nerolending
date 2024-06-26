import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/my_request/my_request_controller.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constrains/constants.dart';

class FilterCategoryBottomSheet extends StatelessWidget {
  const FilterCategoryBottomSheet({
    super.key,
    required this.value,
  });
  final MyRequestController value;
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
            clickableText(
              text: 'All Requests',
              onTap: () {
                value.selectedRequest = 'All Requests';
                value.getMyRequests();
                Get.back();
              },
            ),
            const Divider(
              color: textFieldBoarderColor,
            ),
            clickableText(
              text: 'Pending Requests',
              onTap: () {
                value.selectedRequest = 'Pending Requests';
                value.getMyRequests(id: 3);
                Get.back();
              },
            ),
            const Divider(
              color: textFieldBoarderColor,
            ),
            clickableText(
              text: 'Cancelled Requests',
              onTap: () {
                value.selectedRequest = 'Cancelled Requests';
                value.getMyRequests(id: 6);
                Get.back();
              },
            ),
            const Divider(color: textFieldBoarderColor),
            clickableText(
              text: 'Paid/Completed Requests',
              onTap: () {
                value.selectedRequest = 'Paid/Completed Requests';
                value.getMyRequests(id: 7);
                Get.back();
              },
            ),
            const Divider(color: textFieldBoarderColor),
            clickableText(
              text: 'Rejected Requests',
              onTap: () {
                value.selectedRequest = 'Rejected Requests';
                value.getMyRequests(id: 5);
                Get.back();
              },
            ),
            kSizedBoxH,
          ],
        ),
      ),
    );
  }

  GestureDetector clickableText({required String text, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
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
