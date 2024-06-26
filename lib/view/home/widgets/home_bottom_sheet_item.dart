import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/filter_screen_controller/filter_screen_controller.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/common_widgets/common_button_widget.dart';
import '../../../core/constrains/constants.dart';
import '../../../helper/router.dart';

import '../../../core/colors/colors.dart';

class HomeBottomSheetWidget extends StatelessWidget {
  const HomeBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
      ),
      child: GetBuilder<HomeController>(builder: (value) {
        return SizedBox(
          height: 450.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Align(
                child: Icon(
                  Icons.horizontal_rule_rounded,
                  size: 60,
                  weight: 80,
                  color: lightBlackColor,
                ),
              ),
              // kSizedBoxH20,

              kSizedBoxH,

              Text(
                'noofmaids'.tr,
                style: const TextStyle(
                  color: smallTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                height: 40.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        noOfMaidContainer(value, index),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10.w,
                        ),
                    itemCount: 10),
              ),
              // kSizedBoxH,
              // BookWorkerDropdownWidget(
              //     onChanged: (p0) {
              //       value.maidSelection(p0);
              //     },
              //     hintText: 'select'.tr,
              //     selectedValue: value.selectedWageMode,
              //     dropDownlist: value.dropDownWageMode,
              //     height: 45.h,
              //     width: double.infinity,
              //     title: 'wagemode'.tr),
              kSizedBoxH,

              // LocationSelectionWidget(
              //   title: "location".tr,
              //   onTap: () =>
              //       Get.toNamed(AppRouter.getLocationSelectionRoutesRoute()),
              // ),
              kSizedBoxH,

              kSizedBoxH20,
              kSizedBoxH,
              ButtonWidget(
                width: double.infinity,
                buttonBackgroundColor: buttenBlue.withOpacity(.3),
                buttonForegroundColor: whiteColor,
                buttonText: 'apply'.tr,
                borderAvalable: true,
                press: () {
                  Get.back();
                  Get.delete<FilterScreenController>(force: true);
                  Get.toNamed(
                    AppRouter.getFilterScreenRoute(),
                    arguments: [
                      value.selectedCategory,
                      value.selectedNoOfMaid,
                      value.selectedLocation,
                      value.selectedRating,
                    ],
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  GestureDetector noOfMaidContainer(HomeController value, int index) {
    return GestureDetector(
      onTap: () => value.noOfMaidSelection(index),
      child: Container(
        height: 35.h,
        width: 45.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10).r,
          border: Border.all(
              width: 1,
              color: value.selectedNoOfMaid == index
                  ? buttenBlue
                  : lightBlackColor),
          color: lightBlackColor.withOpacity(.5),
        ),
        child: Center(
          child: Text(
            '${index + 1}',
            style: const TextStyle(color: whiteColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
