import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/rating_screen/rating_screen_controller.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/common_widgets/common_button_widget.dart';
import '../../../../core/common_widgets/textfield_with_title.dart';
import '../../../../core/constrains/constants.dart';
import '../../../../util/toast.dart';

class SubmitFeedBackWidget extends StatelessWidget {
  const SubmitFeedBackWidget({
    super.key,
    required this.controller,
  });
  final RatingScreenController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 370.h,
      decoration: BoxDecoration(
        color: lightBlackColor.withOpacity(.4),
        border: const Border.symmetric(
          horizontal: BorderSide(color: textFieldBoarderColor),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Feedback',
                style: TextStyle(
                    color: smallTextColor, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            RatingBar.builder(
              ignoreGestures: controller.requestDetails?.data.isRating ?? false,
              initialRating: controller.requestDetails?.data.isRating == true
                  ? controller.totalrating.toDouble()
                  : 0,
              itemSize: 45.0,
              unratedColor: starGoldColor.withOpacity(.3),
              minRating: .5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: starGoldColor,
              ),
              onRatingUpdate: (rating) {
                controller.rating = rating;
              },
            ),
            kSizedBoxH,
            controller.requestDetails?.data.isRating == false
                ? Column(
                    children: [
                      TextFieldWithTitle(
                          controller: controller.questionOneController,
                          titleText:
                              controller.ratingQuestions?.data[0].toString() ??
                                  "Not available"),
                      kSizedBoxH,
                      TextFieldWithTitle(
                          controller: controller.questionTwoController,
                          titleText:
                              controller.ratingQuestions?.data[1].toString() ??
                                  "Not available"),
                      kSizedBoxH,
                      TextFieldWithTitle(
                          controller: controller.questionThreeController,
                          titleText:
                              controller.ratingQuestions?.data[2].toString() ??
                                  "Not available"),
                    ],
                  )
                : const SizedBox(),
            kSizedBoxH20,
            ButtonWidget(
              buttonBackgroundColor:
                  controller.requestDetails?.data.isRating == false
                      ? buttonBgColor.withOpacity(.4)
                      : lightBlackColor.withOpacity(.5),
              buttonForegroundColor: whiteColor,
              boarderColor: controller.requestDetails?.data.isRating == false
                  ? buttonBgColor
                  : lightBlackColor,
              buttonText: controller.requestDetails?.data.isRating == false
                  ? 'SUBMIT'
                  : 'SUBMITTED',
              borderAvalable: true,
              press: () {
                if (controller.requestDetails?.data.isRating == false) {
                  controller.addRating();
                  return;
                } else {
                  successToast("Already Submitted");
                  return;
                }
              },
            ),
            kSizedBoxH
          ],
        ),
      ),
    );
  }
}
