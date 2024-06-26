import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/login/login_controller.dart';
import '../../../core/colors/colors.dart';
import '../../../core/common_widgets/baground_design.dart';
import '../../../util/validators.dart';

import '../../../core/common_widgets/common_button_widget.dart';
import '../../../core/common_widgets/textfield_with_title.dart';
import '../../../core/constrains/constants.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

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
                key: value.changePassKey,
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
                      'Reset your password using the provided\n                      fields below.',
                      style: TextStyle(color: smallTextColor),
                    ),
                    // kSizedBoxH20,
                    // TextFieldWithTitle(
                    //     controller: value.currentPasswordEmailController,
                    //     validator: SweepValidators.passwordValidator,
                    //     isPassword: value.currentPassword,
                    //     onTap: value.currentPVisibilityChange,
                    //     titleText: 'Current Password'),
                    kSizedBoxH20,
                    TextFieldWithTitle(
                        controller: value.newPasswordEmailController,
                        validator: SweepValidators.passwordValidator,
                        isPassword: value.newPassword,
                        onTap: value.newPVisibilityChange,
                        titleText: 'New Password'),
                    kSizedBoxH20,
                    TextFieldWithTitle(
                      controller: value.confirmNewPasswordEmailController,
                      isPassword: value.confirmNewPassword,
                      onTap: value.confirmNewPVisibilityChange,
                      titleText: 'Confirm Password',
                      validator: (newValue) {
                        if (newValue!.isEmpty) {
                          return "Please Re-Enter New Password";
                        } else if (newValue.length < 5) {
                          return "Password must be at least 5 characters long";
                        } else if (newValue !=
                            value.confirmNewPasswordEmailController.text) {
                          return "Password must be same as above";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 235.h,
                    ),
                    ButtonWidget(
                      buttonBackgroundColor: buttonBgColor.withOpacity(.4),
                      buttonForegroundColor: whiteColor,
                      buttonText: 'CHANGE PASSWORD',
                      borderAvalable: true,
                      // width: 170.w,
                      press: () {
                        if (value.changePassKey.currentState!.validate()) {
                          value.changePassword();
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      )),
    );
  }
}
