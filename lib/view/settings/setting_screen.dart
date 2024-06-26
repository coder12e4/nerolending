import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/settings_controller/settings.dart';
import '../../../core/common_widgets/baground_design.dart';
import '../../../core/common_widgets/common_button_widget.dart';
import '../../../core/constrains/constants.dart';

import '../../core/colors/colors.dart';
import 'widgets/language_bottom_sheet.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        scrolledUnderElevation: 0,
        backgroundColor: smallTextColor.withOpacity(.2),
        foregroundColor: whiteColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'settings'.tr,
          style: TextStyle(
              color: whiteColor, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: BackgroundDesign(
        child: GetBuilder<SettingsController>(builder: (value) {
          return Column(
            children: <Widget>[
              kSizedBoxH20,
              Container(
                width: double.infinity,
                height: 100.h,
                decoration: BoxDecoration(
                  color: lightBlackColor.withOpacity(.4),
                  border: const Border.symmetric(
                    horizontal: BorderSide(color: textFieldBoarderColor),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'appsettings'.tr,
                        style: TextStyle(
                            color: smallTextColor, fontWeight: FontWeight.w600),
                      ),
                      kSizedBoxH,
                      ButtonWidget(
                        buttonBackgroundColor: lightBlackColor.withOpacity(.5),
                        width: double.infinity,
                        boarderColor: lightBlackColor,
                        buttonForegroundColor: whiteColor,
                        buttonText: 'Change Language',
                        borderAvalable: true,
                        press: () => showModalBottomSheet(
                          backgroundColor: bgColor,
                          context: context,
                          builder: (context) {
                            return const LanguageBottomSheet();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              kSizedBoxH20,
              Container(
                width: double.infinity,
                height: 160.h,
                decoration: BoxDecoration(
                  color: lightBlackColor.withOpacity(.4),
                  border: const Border.symmetric(
                    horizontal: BorderSide(color: textFieldBoarderColor),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0).r,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'support'.tr,
                        style: TextStyle(
                            color: smallTextColor, fontWeight: FontWeight.w600),
                      ),
                      kSizedBoxH,
                      ButtonWidget(
                          buttonBackgroundColor:
                              lightBlackColor.withOpacity(.5),
                          width: double.infinity,
                          boarderColor: lightBlackColor,
                          buttonForegroundColor: whiteColor,
                          buttonText: '1800 1009 03838 938',
                          borderAvalable: true,
                          press: () {}),
                      kSizedBoxH,
                      Align(
                        child: Text(
                          "feelfreetoreachouttouswithanyqueriesorfeedback.Customersatisfactionremainsourtoppriority"
                              .tr,
                          style: TextStyle(color: smallTextColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              kSizedBoxH,
              kSizedBoxH20,
              ButtonWidget(
                buttonBackgroundColor: lightBlackColor.withOpacity(.5),
                boarderColor: lightBlackColor,
                buttonForegroundColor: whiteColor,
                buttonText: 'logout'.tr,
                borderAvalable: true,
                press: () => showModalBottomSheet(
                  backgroundColor: bgColor,
                  context: context,
                  builder: (context) {
                    return logoutBottomSheet(value);
                  },
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  Padding logoutBottomSheet(SettingsController value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.horizontal_rule_rounded,
            size: 60,
            weight: 80,
            color: lightBlackColor,
          ),
          const Text(
            'Are you sure you want to sign out?',
            style:
                TextStyle(color: smallTextColor, fontWeight: FontWeight.w600),
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
                buttonBackgroundColor: buttonBgColor.withOpacity(.4),
                buttonForegroundColor: whiteColor,
                buttonText: "LOG OUT",
                borderAvalable: true,
                press: () => value.logOut(),
              ),
            ],
          ),
          kSizedBoxH20
        ],
      ),
    );
  }
}
