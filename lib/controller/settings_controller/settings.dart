import 'package:get/get.dart';
import '../../../helper/router.dart';

import '../../backend/parser/settings_parser/settings.dart';

class SettingsController extends GetxController implements GetxService {
  final SettingsParser parser;
  SettingsController({required this.parser});

  void logOut() async {
    await parser.sharedPreferencesManager
        .clearAll()!
        .then((value) => Get.offAllNamed(AppRouter.getLoginRoute()));
  }
}
