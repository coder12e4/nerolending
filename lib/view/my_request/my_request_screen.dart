import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/my_request/my_request_controller.dart';
import '../../../controller/my_request/request_details_controller/request_details_controller.dart';
import '../../../core/common_widgets/baground_design.dart';
import '../../../core/constrains/constants.dart';
import '../../../view/my_request/widgets/request_tile.dart';

import '../../core/colors/colors.dart';
import '../../helper/router.dart';
import 'widgets/filter_reqest_bottom_sheet.dart';

class MyRequestScreen extends StatelessWidget {
  const MyRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyRequestController>(
      builder: (value) {
        return Scaffold(
          // backgroundColor: bgColor,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            scrolledUnderElevation: 0,
            elevation: 0,
            backgroundColor: smallTextColor.withOpacity(.1),
            title: Text(
              'myrequest'.tr,
              style: const TextStyle(
                  color: whiteColor, fontSize: 24, fontWeight: FontWeight.w600),
            ),
            bottom: categorySelection(context, value),
          ),
          body: BackgroundDesign(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kSizedBoxH,
                    Text(
                      'Showing ${value.myRequest?.data.length ?? 0} results',
                      style: const TextStyle(
                          color: smallTextColor, fontWeight: FontWeight.w600),
                    ),
                    kSizedBoxH,
                    value.loading != true
                        ? SizedBox(
                            height: 500.h,
                            child: value.myRequest?.data.length != 0
                                ? ListView.separated(
                                    // physics:
                                    //     const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) =>
                                        RequestTile(
                                          index: index,
                                          value: value,
                                          category: value
                                              .myRequest!.data[index].category,
                                          requestNo: value.myRequest!
                                              .data[index].requestNumber
                                              .toString(),
                                          workers: value
                                              .myRequest!.data[index].worker,
                                          viewDetails: () {
                                            Get.delete<
                                                    RequestDetailsController>(
                                                force: true);
                                            Get.toNamed(
                                                AppRouter
                                                    .getRequestDetailsRoutesRoute(),
                                                arguments: [
                                                  value.myRequest!.data[index]
                                                      .id,
                                                  ""
                                                ]);
                                          },
                                          underReview: () {},
                                        ),
                                    separatorBuilder: (context, index) =>
                                        kSizedBoxH,
                                    itemCount:
                                        value.myRequest?.data.length ?? 0)
                                : Center(
                                    child: Text(
                                      '${value.selectedRequest} not found',
                                      style: const TextStyle(
                                          color: smallTextColor, fontSize: 18),
                                    ),
                                  ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  PreferredSize categorySelection(
      BuildContext context, MyRequestController value) {
    return PreferredSize(
      preferredSize: Size.fromHeight(30.0.h),
      child: Container(
        height: 30.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: textFieldBoarderColor),
            bottom: BorderSide(color: textFieldBoarderColor),
          ),
        ),
        child: GestureDetector(
          onTap: () => showModalBottomSheet(
            backgroundColor: bgColor,
            isScrollControlled: true,
            builder: (context) {
              return FilterCategoryBottomSheet(
                value: value,
              );
            },
            context: context,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                value.selectedRequest,
                style: const TextStyle(color: whiteColor),
              ),
              SizedBox(
                width: 10.w,
              ),
              const Icon(
                Icons.keyboard_arrow_down,
                color: whiteColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
