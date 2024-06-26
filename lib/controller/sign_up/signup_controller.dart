import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../helper/router.dart';

import '../../backend/model/firebaseperson/firebaseperson.dart';
import '../../backend/model/signup_model/signup_data_model.dart';
import '../../backend/parser/signup/sign_up_parser.dart';
import '../../util/loading_widget.dart';
import '../../util/toast.dart';

class SignUpController extends GetxController implements GetxService {
  final SignUpParser parser;
  SignUpController({required this.parser});
  TextEditingController signUpNameController = TextEditingController();
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmPasswordController =
      TextEditingController();
  TextEditingController signUpMobileNumController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool signUpPassword = true;
  bool signUpConfirmPassword = true;
  RegisterData? registerData;
  String otp = '';
  void passwordVisibility() {
    signUpPassword = !signUpPassword;
    update();
  }

  void confirmPasswordVisibility() {
    signUpConfirmPassword = !signUpConfirmPassword;
    update();
  }

  Future<void> signUp() async {
    loadingWidget();

    dynamic result = await signUpWIthwithemail(
        signUpEmailController.text, signUpPasswordController.text);

    if (result == null) {
      print("enter a valied e mail id");
      showToast('enter a valied id');
    } else {
      showToast('Sign up Success login');
      Get.offAllNamed(AppRouter.getLoginRoute());
    }

    final body = {
      "email": signUpEmailController.text,
      "password": signUpPasswordController.text,
      "name": signUpNameController.text,
      "c_password": signUpConfirmPasswordController.text,
      "phone": signUpMobileNumController.text
    };
    Response response = await parser.signUp(body);
    try {
      Get.back();
      log("responce data ${response.body}");
      if (response.statusCode == 200) {
        registerData = RegisterData.fromJson(response.body);
        log("registered otp ${registerData!.data.otp}");
        if (registerData!.status == true) {
          otp = registerData!.data.otp.toString();

          successToast(registerData!.message);
          Get.toNamed(AppRouter.getEmailVerificationSignUpRoute(),
              arguments: [otp, signUpEmailController.text]);
        }
      } else {
        showToast('${response.body['data']['error'][0]}'.toString());
      }
    } catch (e, stackTrace) {
      log('signUp catch $e  ', error: e, stackTrace: stackTrace);
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //firebase auth
  Future signUpWIthwithemail(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
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
