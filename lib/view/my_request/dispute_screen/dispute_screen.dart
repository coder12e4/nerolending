import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/dispute_screen/dispute_controller.dart';
import '../../../controller/rating_screen/rating_screen_controller.dart';
import '../../../core/common_widgets/baground_design.dart';
import '../../../core/common_widgets/common_button_widget.dart';
import '../../../core/constrains/constants.dart';

import '../../../core/colors/colors.dart';
import '../dispute_created/dispute_created.dart';

class DisputeScreen extends StatelessWidget {
  const DisputeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        scrolledUnderElevation: 0,
        backgroundColor: smallTextColor.withOpacity(.2),
        foregroundColor: whiteColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Create Dispute',
          style: TextStyle(
              color: whiteColor, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: BackgroundDesign(
        child: GetBuilder<DisputeController>(builder: (value) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: <Widget>[
                kSizedBoxH20,
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      buttonBackgroundColor: lightBlackColor.withOpacity(.5),
                      width: 180.w,
                      buttonForegroundColor: whiteColor,
                      boarderColor: lightBlackColor,
                      buttonText: 'CANCEL',
                      borderAvalable: true,
                      press: () => Get.back(),
                    ),
                    ButtonWidget(
                      width: 180.w,
                      buttonBackgroundColor: buttonBgColor.withOpacity(.4),
                      buttonForegroundColor: whiteColor,
                      buttonText: 'CREATE',
                      borderAvalable: true,
                      press: () {
                        // Get.find<RatingScreenController>().createDispute();
                        value.addDispute();
                      },
                    ),
                  ],
                ),
                kSizedBoxH,
                kSizedBoxH20
              ],
            ),
          );
        }),
      ),
    );
  }
}
