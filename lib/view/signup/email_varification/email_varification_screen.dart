import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/sign_up/email_varification_controller/email_varification_controller.dart';
import '../../../core/colors/colors.dart';
import '../../../core/common_widgets/baground_design.dart';

import '../../../core/common_widgets/common_button_widget.dart';
import '../../../core/common_widgets/otp_textfield.dart';
import '../../../core/constrains/constants.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: BackgroundDesign(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SingleChildScrollView(
              child: GetBuilder<EmailVerificationSignUpController>(
                  builder: (value) {
                return Column(
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    const Text(
                      '     Email\nVerification',
                      style: TextStyle(
                          color: whiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    kSizedBoxH20,
                    const Text(
                      'Kindly enter the 6-digit OTP that has\n    been sent to your email address.',
                      style: TextStyle(color: smallTextColor),
                    ),
                    kSizedBoxH20,
                    SizedBox(
                      height: 30.h,
                    ),
                    Form(
                      key: otpValidationKey,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OtpTextField(controller: value.otp1Controller),
                          OtpTextField(controller: value.otp2Controller),
                          OtpTextField(controller: value.otp3Controller),
                          OtpTextField(controller: value.otp4Controller),
                          OtpTextField(controller: value.otp5Controller),
                          OtpTextField(controller: value.otp6Controller),
                        ],
                      ),
                    ),
                    kSizedBoxH20,
                    const Text(
                      'Did you not receive the email?',
                      style: TextStyle(color: smallTextColor),
                    ),
                    kSizedBoxH20,
                    InkWell(
                      onTap: () => value.resendOtp(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.refresh,
                            color: Color(0xff2974FF),
                            size: 17,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Text(
                            'Resend',
                            style: TextStyle(color: Color(0xff2974FF)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 230.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonWidget(
                          buttonBackgroundColor:
                              lightBlackColor.withOpacity(.4),
                          buttonForegroundColor: whiteColor,
                          boarderColor: textFieldBoarderColor,
                          buttonText: 'BACK',
                          borderAvalable: true,
                          press: () => Get.back(),
                          width: 170.w,
                        ),
                        ButtonWidget(
                          buttonBackgroundColor: buttonBgColor.withOpacity(.4),
                          buttonForegroundColor: whiteColor,
                          buttonText: 'SUBMIT',
                          borderAvalable: true,
                          width: 170.w,
                          press: () {
                            if (otpValidationKey.currentState!.validate()) {
                              value.verifyEmail();
                            }
                          },
                        )
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

final GlobalKey<FormState> otpValidationKey = GlobalKey<FormState>();
