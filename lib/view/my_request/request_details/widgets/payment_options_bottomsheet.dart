import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controller/my_request/request_details_controller/request_details_controller.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/common_widgets/common_button_widget.dart';
import '../../../../core/constrains/constants.dart';

class PaymentOptionsBottomSheet extends StatelessWidget {
  const PaymentOptionsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: GetBuilder<RequestDetailsController>(builder: (value) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.horizontal_rule_rounded,
              size: 60,
              weight: 80,
              color: lightBlackColor,
            ),
            const Text(
              'Payment Options',
              style: TextStyle(
                  color: smallTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
            kSizedBoxH20,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () => value.updatePaymentSelection(),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: value.paymentSelected == true
                                ? Border.all(color: buttenBlue)
                                : null,
                          ),
                          height: 70.h,
                          width: 75.w,
                          child: Image.asset(
                            'assets/images/cash_image.png',
                          ),
                        ),
                      ),
                      const Text(
                        "Cash",
                        style: TextStyle(
                            color: whiteColor, fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
            kSizedBoxH20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  width: 170.w,
                  buttonBackgroundColor: lightBlackColor.withOpacity(.5),
                  boarderColor: lightBlackColor,
                  buttonForegroundColor: whiteColor,
                  buttonText: 'CANCEL',
                  borderAvalable: true,
                  press: () => Get.back(),
                ),
                ButtonWidget(
                    width: 170.w,
                    buttonBackgroundColor: value.paymentSelected == true
                        ? buttonBgColor.withOpacity(.4)
                        : smallTextColor.withOpacity(.1),
                    boarderColor: value.paymentSelected == true
                        ? buttenBlue
                        : lightBlackColor,
                    buttonForegroundColor: whiteColor,
                    buttonText: "PROCEED",
                    borderAvalable: true,
                    press: () {
                      value.paymentSelected == true
                          ? value.updatePayment()
                          : null;
                    }),
              ],
            ),
            kSizedBoxH20
          ],
        );
      }),
    );
  }
}
