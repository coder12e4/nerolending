import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/sign_up/signup_controller.dart';
import '../../../core/colors/colors.dart';
import '../../../core/common_widgets/baground_design.dart';
import '../../../core/common_widgets/common_button_widget.dart';
import '../../../core/constrains/constants.dart';
import '../../../util/validators.dart';

import '../../core/common_widgets/textfield_with_title.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: BackgroundDesign(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: GetBuilder<SignUpController>(builder: (value) {
              return SingleChildScrollView(
                child: Form(
                  key: value.formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70.h,
                      ),
                      Text(
                        'signUplabel'.tr,
                        style: const TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      TextFieldWithTitle(
                        controller: value.signUpNameController,
                        titleText: 'Name',
                        validator: SweepValidators.noneEmptyValidator,
                        textInputType: TextInputType.text,
                      ),
                      kSizedBoxH,
                      TextFieldWithTitle(
                        controller: value.signUpEmailController,
                        titleText: 'Email',
                        validator: SweepValidators.emailValidator,
                        textInputType: TextInputType.emailAddress,
                      ),
                      kSizedBoxH,
                      TextFieldWithTitle(
                        controller: value.signUpPasswordController,
                        titleText: 'Password',
                        validator: SweepValidators.passwordValidator,
                        textInputType: TextInputType.text,
                        isPassword: value.signUpPassword,
                        onTap: value.passwordVisibility,
                      ),
                      kSizedBoxH,
                      TextFieldWithTitle(
                        controller: value.signUpConfirmPasswordController,
                        titleText: 'Confirm Password',
                        validator: (newValue) {
                          if (newValue!.isEmpty) {
                            return "Please Re-Enter New Password";
                          } else if (newValue.length < 5) {
                            return "Password must be at least 5 characters long";
                          } else if (newValue !=
                              value.signUpPasswordController.text) {
                            return "Password must be same as above";
                          } else {
                            return null;
                          }
                        },
                        textInputType: TextInputType.text,
                        isPassword: value.signUpConfirmPassword,
                        onTap: value.confirmPasswordVisibility,
                      ),
                      kSizedBoxH,
                      TextFieldWithTitle(
                        controller: value.signUpMobileNumController,
                        titleText: 'Mobile Number',
                        validator: SweepValidators.mobileNumberValidator,
                        textInputType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      ButtonWidget(
                        buttonBackgroundColor: buttonBgColor.withOpacity(.3),
                        buttonForegroundColor: whiteColor,
                        buttonText: 'NEXT',
                        borderAvalable: true,
                        press: () {
                          if (value.formKey.currentState!.validate()) {
                            value.signUp();
                          }
                        },
                      ),
                      kSizedBoxH20,
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
      // resizeToAvoidBottomInset: false,
    );
  }
}
