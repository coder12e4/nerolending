import 'package:get/get.dart';

import '../../../controller/splash/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => SplashScreenController(parser: Get.find()),
    );
  }
}
