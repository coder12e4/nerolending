import '../../../helper/shared_pref.dart';
import '../../api/api.dart';

class LocationSelectionParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;
  LocationSelectionParser(
      {required this.sharedPreferencesManager, required this.apiService});
}
