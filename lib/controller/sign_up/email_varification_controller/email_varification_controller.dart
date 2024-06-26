import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../helper/router.dart';
import '../../../util/loading_widget.dart';
import '../../../util/toast.dart';

import '../../../backend/parser/signup/email_varification_parser/email_varification_parser.dart';

class EmailVerificationSignUpController extends GetxController
    implements GetxService {
  final EmailVerificationSignUpParser parser;
  EmailVerificationSignUpController({required this.parser});
  @override
  void onInit() {
    otp = Get.arguments[0];
    email = Get.arguments[1];

    super.onInit();
  }

  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  TextEditingController otp5Controller = TextEditingController();
  TextEditingController otp6Controller = TextEditingController();
  String otp = '';
  String email = '';
  String submitOtp = '';
  // void getOtp() {
  //   List<String> otpList = otp.split('');
  //   otp1Controller.text = otpList[0];
  //   otp2Controller.text = otpList[1];
  //   otp3Controller.text = otpList[2];
  //   otp4Controller.text = otpList[3];
  //   otp5Controller.text = otpList[4];
  //   otp6Controller.text = otpList[5];
  // }

  Future<void> verifyEmail() async {
    loadingWidget();
    submitOtp = otp1Controller.text +
        otp2Controller.text +
        otp3Controller.text +
        otp4Controller.text +
        otp5Controller.text +
        otp6Controller.text;
    final body = {
      "email": email,
      "otp": submitOtp,
    };
    Response response = await parser.verifyEmail(body);
    Get.back();
    log("verify email response : ${response.body}");

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

  Future<void> resendOtp() async {
    loadingWidget();
    final body = {
      "email": email,
    };
    Response response = await parser.resendOtp(body);
    Get.back();
    log("Resend Otp response : ${response.body}");

    try {
      if (response.statusCode == 200) {
        if (response.body['status'] == true) {
          otp1Controller.clear;
          otp2Controller.clear;
          otp3Controller.clear;
          otp4Controller.clear;
          otp5Controller.clear;
          otp6Controller.clear;
          otp = response.body['data']['otp'].toString();
          // List<String> otpList = otp.split('');
          // otp1Controller.text = otpList[0];
          // otp2Controller.text = otpList[1];
          // otp3Controller.text = otpList[2];
          // otp4Controller.text = otpList[3];
          // otp5Controller.text = otpList[4];
          // otp6Controller.text = otpList[5];
          successToast(response.body['message']);
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
}
