import 'package:get/get.dart';

import '../../../../helper/shared_pref.dart';
import '../../../api/api.dart';
import '../../../api/api_end_points.dart';

class EmailVerificationSignUpParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;
  EmailVerificationSignUpParser(
      {required this.sharedPreferencesManager, required this.apiService});
  Future<Response> verifyEmail(dynamic body) async {
    var response = await apiService.postPublic(
        ApiEndpoint.baseUrl + ApiEndpoint.verifyEmail, body);
    return response;
  }

  Future<Response> resendOtp(dynamic body) async {
    var response = await apiService.postPublic(
        ApiEndpoint.baseUrl + ApiEndpoint.resendSignUpOtp, body);
    return response;
  }
}
