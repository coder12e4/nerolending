import 'package:get/get.dart';
import '../../../../controller/sign_up/email_varification_controller/email_varification_controller.dart';

class EmailVerificationSignUpBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => EmailVerificationSignUpController(parser: Get.find()),
    );
  }
}
