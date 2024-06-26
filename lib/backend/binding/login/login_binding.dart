import 'package:get/get.dart';
import '../../../controller/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => LoginController(parser: Get.find() ),
    );
  }
}
