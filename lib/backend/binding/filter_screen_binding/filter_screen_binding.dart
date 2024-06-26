import 'package:get/get.dart';

import '../../../controller/filter_screen_controller/filter_screen_controller.dart';

class FilterScreenBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => FilterScreenController(parser: Get.find()),
    );
  }
}
