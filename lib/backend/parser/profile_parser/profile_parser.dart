import 'dart:developer';

import 'package:get/get.dart';

import '../../../helper/shared_pref.dart';
import '../../api/api.dart';
import '../../api/api_end_points.dart';

class ProfileParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;
  ProfileParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getUserDetailesFunction() async {
    final String? token = sharedPreferencesManager.getString("accessToken");
    var response = await apiService.getPrivate(
        ApiEndpoint.baseUrl + ApiEndpoint.getUsersDetails, token!);
    return response;
  }

  Future<Response> deleteAccountFunction(body, id) async {
    final String? token = sharedPreferencesManager.getString("accessToken");

    log("id $id");
    var response = await apiService.postPrivate(
      ApiEndpoint.baseUrl + ApiEndpoint.deteteAccount,
      body,
      token!,
    );
    return response;
  }

  Future<Response> changePassword(dynamic body) async {
    final String? token = sharedPreferencesManager.getString("accessToken");
    var response = await apiService.postPrivate(
        ApiEndpoint.baseUrl + ApiEndpoint.changePassword, body, token!);
    return response;
  }
}
