import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../../../backend/api/api_end_points.dart';
import '../../../helper/router.dart';
import '../../../util/loading_widget.dart';
import '../../../util/toast.dart';

import '../../backend/model/getUserdata/user_model.dart';
import '../../backend/parser/edit_profile_parser/edit_profile_parser.dart';

class EditProfileController extends GetxController implements GetxService {
  final EditProfileParser parser;

  EditProfileController({required this.parser});
  @override
  void onInit() {
    getUserDetails();
    super.onInit();
  }

  XFile? image;
  TextEditingController nameController = TextEditingController();
  TextEditingController mobNumController = TextEditingController();
  User? userData;
  Future<void> getUserDetails() async {
    Response response = await parser.getUserDetailesFunction();

    try {
      if (response.statusCode == 200) {
        userData = User.fromJson(response.body);
        if (userData != null && userData?.data != null) {
          nameController.text = userData?.data.name ?? '';
          mobNumController.text = userData?.data.phone ?? '';
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

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      image = XFile(pickedFile.path);
    } else {
      log('No image selected.');
    }
    update();
  }

  Future<dynamic> updateUser(XFile? profileImage) async {
    loadingWidget();
    var uri = Uri.parse(ApiEndpoint.baseUrl + ApiEndpoint.updateUserDetails);

    try {
      final accessToken =
          parser.sharedPreferencesManager.getString('accessToken');
      var request = http.MultipartRequest('POST', uri);
      debugPrint('url $uri');
      if (profileImage != null) {
        var file1 = await http.MultipartFile.fromPath(
            'profile_image', profileImage.path); // Swap the parameters
        request.files.add(file1);
      }
      request.fields['name'] = nameController.text;
      request.fields['phone'] = mobNumController.text;
      request.headers.addAll({
        "Accept": "application/json",
        "Authorization": "Bearer $accessToken"
      });
      var response = await request.send();
      debugPrint(response.statusCode.toString());
      var responseData = await response.stream.bytesToString();
      var parsedData = json.decode(responseData);
      debugPrint(' message Data: $parsedData');
      if (parsedData['status'] == true) {
        Get.back();
        successToast(parsedData['message']);
        Get.offAllNamed(AppRouter.getBottomNavRoute(), arguments: [2]);
        debugPrint(' Response Data: $responseData');
      }
      if (parsedData['status'] != true) {
        Get.back();
        String errorMessage = '';

        for (var error in parsedData['error']) {
          errorMessage = "${errorMessage + error['error_name']}\n ";
          log(errorMessage.toString());
          // error += error;
        }

        longToast(errorMessage.toString());
      }

      return parsedData['status'];
    } catch (e) {
      debugPrint('File upload error: $e');
    }
  }
}
