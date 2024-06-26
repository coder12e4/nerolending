import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helper/router.dart';
import '../../../util/toast.dart';
import '../../backend/model/firebaseperson/firebaseperson.dart';
import '../../backend/model/login_model/login_model.dart';
import '../../backend/parser/login/login_parser.dart';
import '../../util/loading_widget.dart';
import '../../view/login/change_password/create_new_password.dart';
import '../../view/login/change_password/otp_varification.dart';

class LoginController extends GetxController implements GetxService {
  final LoginParser parser;
  LoginController({required this.parser});
  @override
  void onInit() async {
    // TODO: implement
    fcm_Token = parser.sharedPreferencesManager.getString('fcm_token')!;

    super.onInit();
    log("onInit Login");
  }

  String fcm_Token = "";
  String submitOtp = "";

  TextEditingController loginUserNameController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController changePasswordEmailController = TextEditingController();

  TextEditingController newPasswordEmailController = TextEditingController();
  TextEditingController confirmNewPasswordEmailController =
      TextEditingController();
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  TextEditingController otp5Controller = TextEditingController();
  TextEditingController otp6Controller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> changePassKey = GlobalKey<FormState>();
  LoginData? loginData;
  bool loginPassword = true;
  bool currentPassword = true;
  bool newPassword = true;
  bool confirmNewPassword = true;
  void loginVisibilityChange() {
    loginPassword = !loginPassword;
    update();
  }

  void currentPVisibilityChange() {
    currentPassword = !currentPassword;
    update();
  }

  void newPVisibilityChange() {
    newPassword = !newPassword;
    update();
  }

  void confirmNewPVisibilityChange() {
    confirmNewPassword = !confirmNewPassword;
    update();
  }

  Future<void> loginWithCredential() async {
    loadingWidget();

    dynamic result = await signUpWIthwithemail(
        loginUserNameController.text, loginPasswordController.text);

    if (result == null) {
      showToast('enter a valied id', isError: true);
      print("enter a valied e mail id");
    } else {
      parser.sharedPreferencesManager.putString('accessToken', result.id);
      Get.offAllNamed(AppRouter.getBottomNavRoute());
    }
    Get.back();

    /*try {
      if (response.statusCode == 200) {
        loginData = LoginData.fromJson(response.body);
        parser.sharedPreferencesManager
            .putString('accessToken', loginData!.data.token);
        Get.offAllNamed(AppRouter.getBottomNavRoute());
      } else {
        showToast('${response.body['data']['error']}');
      }
    } catch (e, stackTrace) {
      log('login catch $e  ', error: e, stackTrace: stackTrace);
    }*/
  }

  Future<void> sendOtp() async {
    loadingWidget();
    final body = {
      "email": changePasswordEmailController.text,
    };
    Response response = await parser.sendOtp(body);
    Get.back();
    log("Resend Otp response : ${response.body}");

    try {
      if (response.statusCode == 200) {
        if (response.body['status'] == true) {
          successToast(response.body['message']);
          Get.to(const OtpVerification());
        } else {
          showToast(response.body['message']);
        }
      } else {
        showToast(response.body['message']);
      }
    } catch (e, stackTrace) {
      log('Resend Otp catch $e', error: e, stackTrace: stackTrace);
    }
  }

  Future<void> verifyEmail() async {
    loadingWidget();
    submitOtp = otp1Controller.text +
        otp2Controller.text +
        otp3Controller.text +
        otp4Controller.text +
        otp5Controller.text +
        otp6Controller.text;
    final body = {
      "email": changePasswordEmailController.text,
      "otp": submitOtp,
    };
    Response response = await parser.verifyEmail(body);
    Get.back();
    log("verify email response : ${response.body}");

    try {
      if (response.statusCode == 200) {
        if (response.body['status'] == true) {
          successToast(response.body['message']);
          Get.to(
            const CreateNewPasswordScreen(),
          );
          // Get.offNamed(AppRouter.getLoginRoute());
        } else {
          showToast(response.body['message']);
        }
      } else {
        showToast(response.body['message']);
      }
    } catch (e, stackTrace) {
      log('Email verification catch $e', error: e, stackTrace: stackTrace);
    }
  }

  Future<void> changePassword() async {
    loadingWidget();
    final body = {
      "email": changePasswordEmailController.text,
      "password": newPasswordEmailController.text,
      "c_password": confirmNewPasswordEmailController.text,
    };
    Response response = await parser.changePassword(body);
    Get.back();
    log("change password response : ${response.body}");

    try {
      if (response.statusCode == 200) {
        if (response.body['status'] == true) {
          successToast(response.body['message']);

          Get.offNamed(AppRouter.getLoginRoute());
        } else {
          showToast(response.body['message']);
        }
      } else {
        showToast(response.body['message']);
      }
    } catch (e, stackTrace) {
      log('Email verification catch $e', error: e, stackTrace: stackTrace);
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //firebase auth
  Future signUpWIthwithemail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return getFirebaseuser(user);
    } catch (e) {
      print(e);
    }
  }

  person? getFirebaseuser(User? user) {
    return user == null ? null : person(user.uid);
  }
}
