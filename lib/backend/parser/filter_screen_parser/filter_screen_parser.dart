import 'package:get/get.dart';

import '../../../helper/shared_pref.dart';
import '../../api/api.dart';
import '../../api/api_end_points.dart';

class FilterScreenParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;
  FilterScreenParser(
      {required this.sharedPreferencesManager, required this.apiService});
  Future<Response> getAgentFunction(body) async {
    // log(ApiEndpoint.baseUrl + ApiEndpoint.getAgentList);
    var response = await apiService.postPublic(
        ApiEndpoint.baseUrl + ApiEndpoint.getAgentList, body ?? "");
    return response;
  }
}
