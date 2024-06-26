import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/login/login_controller.dart';
import '../../../core/colors/colors.dart';
import '../../../core/common_widgets/baground_design.dart';
import '../../../core/common_widgets/common_button_widget.dart';
import '../../../core/common_widgets/textfield_with_title.dart';
import '../../../core/constrains/constants.dart';
import '../../../util/validators.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: BackgroundDesign(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: GetBuilder<LoginController>(builder: (value) {
              return SingleChildScrollView(
                child: Form(
                  key: changePassKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60.h,
                      ),
                      const Text(
                        'Change Password',
                        style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      kSizedBoxH20,
                      const Text(
                        'Kindly enter your registered email address.',
                        style: TextStyle(color: smallTextColor),
                      ),
                      kSizedBoxH20,
                      TextFieldWithTitle(
                          textInputType: TextInputType.emailAddress,
                          validator: SweepValidators.emailValidator,
                          controller: value.changePasswordEmailController,
                          titleText: 'Email'),
                      SizedBox(
                        height: 350.h,
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
                            buttonBackgroundColor:
                                buttonBgColor.withOpacity(.4),
                            buttonForegroundColor: whiteColor,
                            buttonText: 'SUBMIT',
                            borderAvalable: true,
                            width: 170.w,
                            press: () {
                              if (changePassKey.currentState!.validate())
                                value.sendOtp();
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

final GlobalKey<FormState> changePassKey = GlobalKey<FormState>();
