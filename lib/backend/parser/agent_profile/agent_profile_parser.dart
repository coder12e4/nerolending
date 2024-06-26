import 'dart:developer';

import 'package:get/get_connect/http/src/response/response.dart';
import '../../../backend/api/api_end_points.dart';

import '../../../helper/shared_pref.dart';
import '../../api/api.dart';

class AgentProfileParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;
  AgentProfileParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getAgentDetailsFunction(body) async {
    log(ApiEndpoint.baseUrl + ApiEndpoint.getAgentDetails);
    var response = await apiService
        .getPublic(ApiEndpoint.baseUrl + ApiEndpoint.getAgentDetails,body);
    return response;
  }
}
