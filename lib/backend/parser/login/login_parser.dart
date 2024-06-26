import 'package:get/get.dart';
import '../../../backend/api/api_end_points.dart';

import '../../../helper/shared_pref.dart';
import '../../api/api.dart';

class LoginParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;
  LoginParser(
      {required this.sharedPreferencesManager, required this.apiService});
  Future<Response> login(dynamic body) async {
    var response = await apiService.postPublic(
        ApiEndpoint.baseUrl + ApiEndpoint.login, body);
    return response;
  }

  Future<Response> sendOtp(dynamic body) async {
    var response = await apiService.postPublic(
        ApiEndpoint.baseUrl + ApiEndpoint.resendSignUpOtp, body);
    return response;
  }

  Future<Response> verifyEmail(dynamic body) async {
    var response = await apiService.postPublic(
        ApiEndpoint.baseUrl + ApiEndpoint.verifyEmail, body);
    return response;
  }

  Future<Response> changePassword(dynamic body) async {
    var response = await apiService.postPublic(
        ApiEndpoint.baseUrl + ApiEndpoint.forgetPassword, body);
    return response;
  }
}
