import '../../../helper/shared_pref.dart';
import '../../api/api.dart';

class SettingsParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;
  SettingsParser(
      {required this.sharedPreferencesManager, required this.apiService});
}
