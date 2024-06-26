import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/edit_profile/edit_profile_controller.dart';
import '../../../controller/profile_controller/profile_controller.dart';
import '../../../core/common_widgets/baground_design.dart';
import '../../../core/common_widgets/common_button_widget.dart';
import '../../../core/constrains/constants.dart';
import '../../../helper/router.dart';

import '../../core/colors/colors.dart';
import '../../core/common_widgets/common_text_field.dart';
import '../../core/common_widgets/textfield_with_title.dart';
import '../../util/validators.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        scrolledUnderElevation: 0,
        backgroundColor: smallTextColor.withOpacity(.2),
        foregroundColor: whiteColor,
        title: Text(
          'profile'.tr,
          style: const TextStyle(
              color: whiteColor, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: BackgroundDesign(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Obx(
            () => Column(
              children: [
                SizedBox(
                  height: 40.h,
                ),
                profileController.profileImage != null
                    ? CachedNetworkImage(
                        imageUrl: profileController.profileImage.value,
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          backgroundColor: lightBlackColor,
                          radius: 70.r,
                          backgroundImage: imageProvider,
                        ),
                        placeholder: (context, url) => CircleAvatar(
                          backgroundColor: lightBlackColor,
                          radius: 70.r,
                          child: const Icon(
                            Icons.person,
                            size: 30,
                          ),
                        ),
                        errorWidget: (context, url, error) => CircleAvatar(
                          backgroundColor: lightBlackColor,
                          radius: 70.r,
                          child: const Icon(
                            Icons.person,
                            size: 30,
                          ),
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: lightBlackColor,
                        radius: 70.r,
                        child: const Icon(
                          Icons.person,
                          size: 30,
                        ),
                      ),
                kSizedBoxH,
                Text(
                  profileController.userName.value.capitalize ?? "",
                  style: const TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                kSizedBoxH20,
                ButtonWidget(
                  buttonBackgroundColor: lightBlackColor.withOpacity(.5),
                  buttonForegroundColor: whiteColor,
                  boarderColor: lightBlackColor,
                  buttonText: "editprofile".tr,
                  borderAvalable: true,
                  width: 150.w,
                  height: 30.h,
                  press: () {
                    Get.delete<EditProfileController>(force: true);
                    Get.toNamed(AppRouter.getEditProfileRoute());
                  },
                ),
                kSizedBoxH20,
                profileDetailsContainer(
                    title: 'mobilenumber'.tr,
                    details: "+91 ${profileController.number.value ?? ""}"),
                kSizedBoxH20,
                profileDetailsContainer(
                    title: 'email'.tr,
                    details: profileController.email.value ?? ""),
                SizedBox(
                  height: 30.h,
                ),
                ButtonWidget(
                  width: double.infinity,
                  buttonBackgroundColor: lightBlackColor.withOpacity(.4),
                  buttonForegroundColor: whiteColor,
                  boarderColor: lightBlackColor,
                  buttonText: 'deleteaccount'.tr,
                  borderAvalable: true,
                  press: () {
                    showModalBottomSheet(
                      backgroundColor: bgColor,
                      // isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return deleteAcBottomSheet();
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                ButtonWidget(
                  width: double.infinity,
                  buttonBackgroundColor: lightBlackColor.withOpacity(.4),
                  buttonForegroundColor: whiteColor,
                  boarderColor: lightBlackColor,
                  buttonText: 'changepassword'.tr,
                  borderAvalable: true,
                  press: () {
                    showModalBottomSheet(
                      backgroundColor: bgColor,
                      // isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return changePasswordBottomSheet();
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }

  changePasswordBottomSheet() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: GetBuilder<ProfileController>(builder: (profileController) {
          return Form(
            key: profileController.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.horizontal_rule_rounded,
                  size: 60,
                  weight: 80,
                  color: lightBlackColor,
                ),
                TextFieldWithTitle(
                  controller: profileController.currentPasswordController,
                  titleText: 'Current Password',
                  validator: SweepValidators.passwordValidator,
                  textInputType: TextInputType.text,
                  isPassword: profileController.loginPassword,
                  onTap: () => profileController.loginVisibilityChange(),
                ),
                SizedBox(height: 20.h),
                TextFieldWithTitle(
                  controller: profileController.newPasswordController,
                  titleText: 'New Password',
                  validator: SweepValidators.passwordValidator,
                  textInputType: TextInputType.text,
                  isPassword: profileController.newPassword,
                  onTap: () => profileController.newPasswordVisibilityChange(),
                ),
                SizedBox(height: 20.h),
                TextFieldWithTitle(
                  controller: profileController.confirmController,
                  titleText: 'Confirm Password',
                  validator: (newValue) {
                    if (newValue!.isEmpty) {
                      return "Please Re-Enter New Password";
                    } else if (newValue.length < 5) {
                      return "Password must be at least 5 characters long";
                    } else if (newValue !=
                        profileController.newPasswordController.text) {
                      return "Password must be same as above";
                    } else {
                      return null;
                    }
                  },
                  textInputType: TextInputType.text,
                  isPassword: profileController.confirmNewPassword,
                  onTap: () =>
                      profileController.confirmPasswordVisibilityChange(),
                ),
                SizedBox(height: 20.h),
                ButtonWidget(
                  width: 350.w,
                  buttonBackgroundColor: buttonBgColor.withOpacity(.4),
                  buttonForegroundColor: whiteColor,
                  buttonText: "CHANGE PASSWORD",
                  borderAvalable: true,
                  press: () {
                    if (profileController.formKey.currentState!.validate()) {
                      profileController.changePasswordFunction();
                    }
                  },
                ),
                SizedBox(
                  height: 30.h,
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Padding deleteAcBottomSheet() {
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
            'Are you sure you want to delete your account?',
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
                  buttonText: "DELETE",
                  borderAvalable: true,
                  press: () => profileController.deletAccount()),
            ],
          ),
          kSizedBoxH20
        ],
      ),
    );
  }

  Column profileDetailsContainer(
      {required String title, required String details}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: smallTextColor, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 45.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: lightBlackColor.withOpacity(.4),
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: lightBlackColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(13).r,
            child: Text(
              details,
              style: const TextStyle(color: whiteColor, fontSize: 17),
            ),
          ),
        ),
      ],
    );
  }
}
