import 'package:get/get.dart';

import '../../../helper/shared_pref.dart';
import '../../api/api.dart';
import '../../api/api_end_points.dart';

class EditProfileParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;
  EditProfileParser(
      {required this.sharedPreferencesManager, required this.apiService});
  Future<Response> getUserDetailesFunction() async {
    final String? token = sharedPreferencesManager.getString("accessToken");
    var response = await apiService.getPrivate(
        ApiEndpoint.baseUrl + ApiEndpoint.getUsersDetails, token!);
    return response;
  }

  Future<Response> updateUserDetails(body) async {
    final String? token = sharedPreferencesManager.getString("accessToken");
    var response = await apiService.postPrivate(
        ApiEndpoint.baseUrl + ApiEndpoint.updateUserDetails, body, token!);
    return response;
  }
}
