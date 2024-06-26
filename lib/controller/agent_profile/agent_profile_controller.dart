import 'dart:developer';

import 'package:get/get.dart';
import '../../../backend/model/getAgentDetails/get_agent_details.dart';
import '../../../backend/model/getAgentList_model/getagentlist_model_data.dart';
import '../../../util/toast.dart';

import '../../backend/parser/agent_profile/agent_profile_parser.dart';
import '../../util/loading_widget.dart';

class AgentProfileController extends GetxController implements GetxService {
  @override
  void onReady() {
    // TODO: implement onReady
    // agentId.value = Get.arguments[2];
    // log("message");
    // getAgentDetail();
    super.onReady();
  }

  final AgentProfileParser parser;

  AgentProfileController({required this.parser});
  Data? agentDetailsData;
  List<Category> agentCatogery = [];
  List<Location> agentLocations = [];
  RxInt agentId = RxInt(0);

  List<Map<String, String>> agentProfileItems = [
    {
      "image": "assets/images/cleaning_995016 1.png",
      "designation": "Maid",
      "hourWage": "",
      "dailyWage": "",
    },
    {
      "image": "assets/images/hands_3410364 1.png",
      "designation": "Driver",
      "hourWage": "",
      "dailyWage": "",
    },
    {
      "image": "assets/images/iris_3200079 1.png",
      "designation": "Gardener",
      "hourWage": "",
      "dailyWage": "",
    }
  ];

  Future<void> getAgentDetail() async {
    Map<String, dynamic> body = {};

    // Add locationValue to the body only if it is not 0

    Response response = await parser.getAgentDetailsFunction(agentId.value);
    Future.delayed(Duration(seconds: 2));
    loadingWidget();
    log("ID: ${agentId.toString()}");
    agentCatogery.clear();
    agentLocations.clear();
    try {
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        Get.back();
        GetAgentDetails catogeryResponse =
            GetAgentDetails.fromJson(response.body);
        log(response.body.toString());
        agentDetailsData = catogeryResponse.data;
        if (agentDetailsData!.locations.isNotEmpty &&
            agentDetailsData!.categories.isNotEmpty) {
          agentCatogery = agentDetailsData!.categories;
          agentLocations = agentDetailsData!.locations;
          log("agentDetailsData function${agentCatogery[0].name.toString()}");
        }
        // for (Data element in collection) {
        //   Data data = element;
        //   agentListData.add(data);
        // }
      } else {
        showToast('error');
      }
    } catch (e, stackTrace) {
      log('agentListData catch $e  ', error: e, stackTrace: stackTrace);
    }
    update();
  }
}
