import 'package:get/get.dart';

import '../../../controller/sign_up/signup_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => SignUpController(parser: Get.find()),
    );
  }
}
