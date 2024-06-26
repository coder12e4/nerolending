import 'package:get/get.dart';

import '../../../controller/settings_controller/settings.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => SettingsController(parser: Get.find()),
    );
  }
}
