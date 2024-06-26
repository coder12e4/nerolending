import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/rating_screen/rating_screen_controller.dart';
import '../../../core/common_widgets/baground_design.dart';
import '../../../core/common_widgets/common_button_widget.dart';
import '../../../helper/router.dart';
import '../../../view/my_request/request_details/widgets/agent_detais_tile.dart';
import '../../../view/my_request/request_details/widgets/details_container.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constrains/constants.dart';
import 'widgets/feedback_widget.dart';

class RatingScreen extends StatelessWidget {
  const RatingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RatingScreenController>(builder: (value) {
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
          title: Text(
            'Booking ID: ${value.requestDetails?.data.requestNumber}',
            style: const TextStyle(
                color: whiteColor, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        body: BackgroundDesign(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: value.loading != true
                ? Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            kSizedBoxH,
                            const Text(
                              'Agent Details',
                              style: TextStyle(
                                  color: smallTextColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            AgentDetailsTile(
                              name:
                                  value.requestDetails?.data.agentDetail.name ??
                                      "Not available",
                              location: value.requestDetails?.data.agentDetail
                                      .location ??
                                  "Not available",
                              image: value
                                      .requestDetails?.data.agentDetail.image ??
                                  "",
                              starRating: value.requestDetails?.data.agentDetail
                                      .starRating
                                      .toString() ??
                                  "0",
                              totalReviews: value.requestDetails?.data
                                      .agentDetail.totalRatings
                                      .toString() ??
                                  "Not available",
                            ),
                          ],
                        ),
                      ),
                      kSizedBoxH20,
                      DetailsContainer(
                        heading: 'Booking Details',
                        contentOne:
                            'Category: ${value.requestDetails?.data.category ?? "Not available"}',
                        contentTwo:
                            'Workers: ${value.requestDetails?.data.workerCount ?? "Not available"}',
                        contentThree:
                            'Status: ${value.requestDetails?.data.status ?? "Not available"}',
                      ),
                      kSizedBoxH20,
                      SubmitFeedBackWidget(controller: value),
                      kSizedBoxH20,
                      DetailsContainer(
                          heading: "Work Details",
                          contentOne:
                              "Time: ${value.requestDetails?.data.startTime ?? "Not available"}",
                          contentTwo:
                              "Frequency: ${value.requestDetails?.data.schedule ?? "Not available"}",
                          contentThree:
                              "Wage Mode: ${value.requestDetails?.data.wageMode ?? "Not available"}"),
                      kSizedBoxH20,
                      value.requestDetails?.data.isDispute == false
                          ? ButtonWidget(
                              buttonBackgroundColor:
                                  lightBlackColor.withOpacity(.5),
                              buttonForegroundColor: whiteColor,
                              boarderColor: lightBlackColor,
                              buttonText: 'CREATE DISPUTE',
                              borderAvalable: true,
                              press: () {
                                Get.toNamed(AppRouter.getDisputeScreeRoute());
                              },
                            )
                          : disputeResponceContainer(),
                      kSizedBoxH20,
                    ],
                  )
                : SizedBox(
                    height: 600.h,
                    child: Center(
                      child: CupertinoActivityIndicator(
                        color: whiteColor.withOpacity(.4),
                        radius: 20.r,
                      ),
                    ),
                  ),
          ),
        ),
      );
    });
  }

  Container disputeResponceContainer() {
    return Container(
      width: double.infinity,
      height: 105.h,
      decoration: BoxDecoration(
        color: lightBlackColor.withOpacity(.4),
        border: const Border.symmetric(
          horizontal: BorderSide(color: textFieldBoarderColor),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0).r,
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Dispute Info',
                style: TextStyle(
                    color: smallTextColor, fontWeight: FontWeight.w600),
              ),
            ),
            kSizedBoxH20,
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                  color: lightBlackColor.withOpacity(.5),
                  border: Border.all(color: lightBlackColor),
                  borderRadius: BorderRadius.circular(10).r),
              width: double.infinity,
              child: const Center(
                child: Text(
                  'Waiting for response!',
                  style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
