import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../controller/edit_profile/edit_profile_controller.dart';
import '../../../core/common_widgets/baground_design.dart';
import '../../../core/common_widgets/textfield_with_title.dart';

import '../../../core/colors/colors.dart';
import '../../../core/common_widgets/common_button_widget.dart';
import '../../../core/constrains/constants.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

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
          'editprofile'.tr,
          style: const TextStyle(
              color: whiteColor, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      body: BackgroundDesign(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: GetBuilder<EditProfileController>(builder: (value) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  value.image != null
                      ? CircleAvatar(
                          radius: 70.0,
                          backgroundImage:
                              Image.file(File(value.image!.path)).image,
                        )
                      : CircleAvatar(
                          backgroundColor: lightBlackColor,
                          radius: 70.r,
                          backgroundImage: value.userData?.data.image != null
                              ? NetworkImage(value.userData!.data.image!)
                              : null,
                        ),

                  kSizedBoxH20,
                  ButtonWidget(
                    buttonBackgroundColor: lightBlackColor.withOpacity(.5),
                    buttonForegroundColor: whiteColor,
                    boarderColor: lightBlackColor,
                    buttonText: "changephoto".tr,
                    borderAvalable: true,
                    width: 150.w,
                    height: 30.h,
                    press: () {
                      showModalBottomSheet(
                        backgroundColor: bgColor,
                        // isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return choosePhotoSheet(value);
                        },
                      );
                    },
                  ),
                  kSizedBoxH20,
                  // profileDetailsContainer(
                  //     title: 'Name', details: 'Muhammed Shamseer'),
                  TextFieldWithTitle(
                      controller: value.nameController, titleText: 'Name'),
                  kSizedBoxH20,
                  TextFieldWithTitle(
                      controller: value.mobNumController,
                      titleText: 'mobilenumber'.tr),
                  // profileDetailsContainer(
                  //     title: 'Mobile Number', details: '+976 89 90 87'),
                  SizedBox(
                    height: 150.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonWidget(
                        width: 170.w,
                        buttonBackgroundColor: lightBlackColor.withOpacity(.4),
                        buttonForegroundColor: whiteColor,
                        boarderColor: lightBlackColor,
                        buttonText: 'cancel'.tr,
                        borderAvalable: true,
                        press: () => Get.back(),
                      ),
                      ButtonWidget(
                        width: 170.w,
                        buttonBackgroundColor: buttonBgColor.withOpacity(.3),
                        buttonForegroundColor: whiteColor,
                        // boarderColor: lightBlackColor,
                        buttonText: 'save'.tr,
                        borderAvalable: true,
                        press: () {
                          value.updateUser(value.image);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
            );
          }),
        ),
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

  Padding choosePhotoSheet(EditProfileController controller) {
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
          kSizedBoxH20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  ButtonWithIconWidget(
                      width: 130.w,
                      height: 90.h,
                      buttonBackgroundColor: buttonBgColor.withOpacity(.4),
                      boarderColor: lightBlackColor,
                      buttonForegroundColor: whiteColor,
                      buttonText: '',
                      borderAvalable: true,
                      icon: Icons.camera,
                      press: () {
                        controller.pickImage(ImageSource.camera);
                        Get.back();
                      }),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Camera",
                      style: TextStyle(color: whiteColor),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  ButtonWithIconWidget(
                      width: 130.w,
                      height: 90.h,
                      buttonBackgroundColor: buttonBgColor.withOpacity(.4),
                      buttonForegroundColor: whiteColor,
                      buttonText: "",
                      borderAvalable: true,
                      icon: Icons.photo_camera_back,
                      press: () {
                        controller.pickImage(ImageSource.gallery);
                        Get.back();
                      }),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Gallery",
                      style: TextStyle(color: whiteColor),
                    ),
                  )
                ],
              )
            ],
          ),
          kSizedBoxH20
        ],
      ),
    );
  }
}
