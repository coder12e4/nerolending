import 'package:get/get.dart';

import '../../../controller/agent_profile/agent_profile_controller.dart';

class AgentProfileBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(
      () => AgentProfileController(parser: Get.find()),
    );
  }
}
