import 'package:get/get.dart';

import '../../../helper/shared_pref.dart';
import '../../api/api.dart';
import '../../api/api_end_points.dart';

class SignUpParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;
  SignUpParser(
      {required this.sharedPreferencesManager, required this.apiService});
  Future<Response> signUp(dynamic body) async {
    var response = await apiService.postPublic(
        ApiEndpoint.baseUrl + ApiEndpoint.signUp, body);
    return response;
  }
}
