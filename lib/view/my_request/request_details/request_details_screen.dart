import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/my_request/request_details_controller/request_details_controller.dart';
import '../../../core/common_widgets/baground_design.dart';
import '../../../core/common_widgets/common_button_widget.dart';
import '../../../core/constrains/constants.dart';
import '../../../view/my_request/request_details/widgets/details_container.dart';

import '../../../core/colors/colors.dart';
import 'widgets/agent_detais_tile.dart';
import 'widgets/dispute_widget.dart';
import 'widgets/payment_options_bottomsheet.dart';
import 'widgets/widraw_request_bottom_sheet.dart';

class RequestDetailsScreen extends StatelessWidget {
  const RequestDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestDetailsController>(builder: (value) {
      return WillPopScope(
        onWillPop: () async {
          if (value.navigation.isNotEmpty == true) {
            Get.offAllNamed(value.navigation);
          } else {
            Get.back();
          }
          return true; 
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            scrolledUnderElevation: 0,
            backgroundColor: smallTextColor.withOpacity(.2),
            foregroundColor: whiteColor,
            leading: IconButton(
              onPressed: () {
                if (value.navigation.isNotEmpty == true) {
                  Get.offAllNamed(value.navigation);
                } else {
                  Get.back();
                }
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(
              'Booking ID: ${value.requestDetails?.data.requestNumber}',
              style: const TextStyle(
                  color: whiteColor, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            actions: [
              IconButton(
                onPressed: () => showModalBottomSheet(
                    backgroundColor: bgColor,
                    isScrollControlled: true,
                    builder: (context) {
                      return WithdrawRequestBottomSheet(
                        onTap: () {
                          Get.back();
                          showModalBottomSheet(
                            backgroundColor: bgColor,
                            context: context,
                            builder: (context) => confirmWidrawRequest(value),
                          );
                        },
                      );
                    },
                    context: context),
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          body: SingleChildScrollView(
            // physics: const NeverScrollableScrollPhysics(),
            child: BackgroundDesign(
              child: value.loading != true
                  ? Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        agentDetailsContainer(value),
                        kSizedBoxH20,
                        DetailsContainer(
                          heading: "bookingdetails".tr,
                          contentOne:
                              "Category: ${value.requestDetails?.data.category}",
                          contentTwo:
                              "Workers: ${value.requestDetails?.data.workerCount}",
                          contentThree:
                              'Status: ${value.requestDetails?.data.status}',
                        ),
                        kSizedBoxH20,
                        DetailsContainer(
                            heading: "workdetails".tr,
                            contentOne:
                                "Time: ${value.requestDetails?.data.startTime}",
                            contentTwo:
                                "Frequency: ${value.requestDetails?.data.schedule}",
                            contentThree:
                                "Wage Mode: ${value.requestDetails?.data.wageMode}"),
                        kSizedBoxH20,
                        value.requestDetails?.data.dispute != null
                            ? DisputeDetailContainer(
                                heading: "Dispute Details".tr,
                                contentOne: "Title: ${value.disputeTitle}",
                                contentTwo: "Ans: ${value.disputeAns}",
                                contentThree:
                                    "Discription: ${value.disputeDes}")
                            : const Offstage(),
                        kSizedBoxH20,
                        Container(
                          width: double.infinity,
                          height: 150.h,
                          decoration: BoxDecoration(
                            color: lightBlackColor.withOpacity(.4),
                            border: const Border.symmetric(
                              horizontal:
                                  BorderSide(color: textFieldBoarderColor),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0).r,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'totalAmounttopay'.tr,
                                  style: const TextStyle(
                                      color: smallTextColor,
                                      fontWeight: FontWeight.w600),
                                ),
                                kSizedBoxH,
                                Text(
                                  '${value.requestDetails?.data.amount} AED',
                                  style: const TextStyle(
                                      color: whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20),
                                ),
                                kSizedBoxH20,
                                ButtonWidget(
                                  width: double.infinity,
                                  buttonBackgroundColor:
                                      value.requestDetails?.data.status ==
                                              "Pending"
                                          ? buttenBlue.withOpacity(.4)
                                          : smallTextColor.withOpacity(.4),
                                  boarderColor:
                                      value.requestDetails?.data.status ==
                                              "Pending"
                                          ? buttenBlue
                                          : lightBlackColor,
                                  buttonForegroundColor: whiteColor,
                                  buttonText: 'paynow'.tr,
                                  borderAvalable: true,
                                  press: () {
                                    value.requestDetails?.data.status ==
                                            "Pending"
                                        ? showModalBottomSheet(
                                            backgroundColor: bgColor,
                                            isScrollControlled: true,
                                            builder: (context) {
                                              return const PaymentOptionsBottomSheet();
                                            },
                                            context: context)
                                        : null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  : Center(
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

  Padding agentDetailsContainer(RequestDetailsController value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kSizedBoxH,
          Text(
            'agentdetails'.tr,
            style: const TextStyle(
                color: smallTextColor, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5.h,
          ),
          AgentDetailsTile(
            name: value.requestDetails?.data.agentDetail.name ?? "",
            location: value.requestDetails?.data.agentDetail.location ?? '',
            image: value.requestDetails?.data.agentDetail.image ?? '',
            starRating:
                value.requestDetails?.data.agentDetail.starRating.toString() ??
                    '',
            totalReviews: value.requestDetails?.data.agentDetail.totalRatings
                    .toString() ??
                "",
          ),
        ],
      ),
    );
  }

  SizedBox confirmWidrawRequest(RequestDetailsController value) {
    return SizedBox(
      height: 120.h,
      width: double.infinity,
      child: Column(children: [
        const Icon(
          Icons.horizontal_rule_rounded,
          size: 60,
          weight: 80,
          color: lightBlackColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonWidget(
              buttonBackgroundColor: lightBlackColor.withOpacity(.4),
              width: 160.w,
              buttonForegroundColor: whiteColor,
              boarderColor: textFieldBoarderColor,
              buttonText: 'cancel'.tr,
              borderAvalable: true,
              press: () => Get.back(),
            ),
            ButtonWidget(
              width: 160.w,
              buttonBackgroundColor: buttenBlue.withOpacity(.4),
              buttonForegroundColor: whiteColor,
              buttonText: 'confirm'.tr,
              borderAvalable: true,
              press: () => value.deleteRequest(),
            ),
          ],
        )
      ]),
    );
  }

  Container datailsContainer(
      {String? heading,
      String? contentOne,
      String? contentTwo,
      String? contentThree}) {
    return Container(
      width: double.infinity,
      height: 150.h,
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
                  height: 30.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: lightBlackColor),
                      borderRadius: BorderRadius.circular(10).r,
                      color: lightBlackColor.withOpacity(.6)),
                  child: Center(
                    child: Text(
                      contentOne!,
                      style: const TextStyle(color: whiteColor),
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
