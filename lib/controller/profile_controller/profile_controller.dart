import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../backend/model/getUserdata/user_model.dart';
import '../../../helper/router.dart';
import '../../../util/loading_widget.dart';
import '../../../util/toast.dart';

import '../../backend/parser/profile_parser/profile_parser.dart';

class ProfileController extends GetxController implements GetxService {
  final ProfileParser parser;

  ProfileController({required this.parser});
  @override
  void onReady() {
    getUserDetails();
    super.onReady();
  }

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  String accessToken = "";
  Rx<String> userName = "".obs;
  Rx<int> userId = 0.obs;
  Rx<String> email = "".obs;
  Rx<String> number = "".obs;
  Rx<String> profileImage = "".obs;
  User? userData;
  bool loginPassword = true;
  bool currentPassword = true;
  bool newPassword = true;
  bool confirmNewPassword = true;

  Future<void> getUserDetails() async {
    accessToken = parser.sharedPreferencesManager.getString("accessToken")!;
    log("Access Token : $accessToken");
    Response response = await parser.getUserDetailesFunction();
    loadingWidget();
    try {
      if (response.statusCode == 200) {
        Get.back();
        userData = User.fromJson(response.body);
        if (userData != null && userData?.data != null) {
          userId.value = userData!.data.id;
          parser.sharedPreferencesManager.putInt("userId", userId.value);
          userName.value = userData!.data.name;
          email.value = userData!.data.email;
          number.value = userData!.data.phone;
          profileImage.value = userData!.data.image;
        }

        log("User data${userData!.data.name.toString()}");
        log("User data${userData!.data.id.toString()}");
      } else {
        showToast('error}');
      }
    } catch (e, stackTrace) {
      log('userEtails catch $e  ', error: e, stackTrace: stackTrace);
    }
    update();
  }

  void loginVisibilityChange() {
    loginPassword = !loginPassword;
    update();
  }

  void newPasswordVisibilityChange() {
    newPassword = !newPassword;
    update();
  }

  void confirmPasswordVisibilityChange() {
    confirmNewPassword = !confirmNewPassword;
    update();
  }

// void passwordVisibility() {
//     signUpPassword = !signUpPassword;
//     update();
//   }
  Future<void> deletAccount() async {
    Map<String, dynamic> body = {"name": userName.value, "phone": number.value};
    Response response = await parser.deleteAccountFunction(body, userId.value);
    if (response.statusCode == 200 && response.body['status']) {
      log("${response.body['data']["success"]}");
      parser.sharedPreferencesManager.clearAll();
      successToast(response.body['data']["success"]);
      Get.offAllNamed(
        AppRouter.getLoginRoute(),
      );
    }
  }

  Future<void> changePasswordFunction() async {
    loadingWidget();
    final body = {
      "email": email.value,
      "current_password": currentPasswordController.text,
      "password": newPasswordController.text,
      "c_password": confirmController.text,
    };
    Response response = await parser.changePassword(body);
    try {
      Get.back();
      log("responce data ${response.body}");
      if (response.statusCode == 200) {
        log(body.toString());
        log("Change Password :${response.body}");
        Get.back();
        successToast('${response.body['data']['success']}'.toString());

        newPasswordController.clear();
        confirmController.clear();
        currentPasswordController.clear();
      } else {
        showToast('${response.body['data']['error']}'.toString());
      }
    } catch (e, stackTrace) {
      log('signUp catch $e  ', error: e, stackTrace: stackTrace);
    }
  }
}
