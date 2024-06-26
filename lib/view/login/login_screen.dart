import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/login/login_controller.dart';
import '../../../core/common_widgets/common_button_widget.dart';
import '../../../util/validators.dart';
import '../../../view/login/change_password/change_passwrd.dart';

import '../../core/colors/colors.dart';
import '../../core/common_widgets/baground_design.dart';
import '../../core/common_widgets/common_text_field.dart';
import '../../helper/router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: BackgroundDesign(
        child: SafeArea(
          child: SingleChildScrollView(
            child: GetBuilder<LoginController>(builder: (value) {
              return Form(
                key: value.formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80.h,
                    ),
                    Image.asset(
                      'assets/images/app_logo.png',
                      height: 154.h,
                      width: 200.w,
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    TextFormFieldWidget(
                        controller: value.loginUserNameController,
                        hitText: 'Email',
                        validator: SweepValidators.emailValidator,
                        textInputType: TextInputType.emailAddress),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormFieldWidget(
                      controller: value.loginPasswordController,
                      hitText: 'Password',
                      validator: SweepValidators.noneEmptyValidator,
                      textInputType: TextInputType.text,
                      isPassword: value.loginPassword,
                      onTap: value.loginVisibilityChange,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    ButtonWidget(
                      buttonBackgroundColor: buttonBgColor.withOpacity(.3),
                      buttonForegroundColor: Colors.white,
                      buttonText: 'loginlabel'.tr,
                      borderAvalable: true,
                      press: () {
                        if (value.formKey.currentState!.validate()) {
                          value.loginWithCredential();
                        }
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Forget password?',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: smallTextColor,
                          color: smallTextColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.to(
                                const ChangePasswordScreen(),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: smallTextColor),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Get.delete<SignUpController>(force: true);
                        Get.toNamed(AppRouter.getSignUpRoute());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.arrow_circle_up,
                            color: Color(0xff2974FF),
                            size: 19,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const Text(
                            'Sign up',
                            style: TextStyle(color: Color(0xff2974FF)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
