import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../backend/model/getAgentList_model/getagentlist_model_data.dart';
import '../../backend/model/getcatogery_model/getcatogery_model_data.dart';
import '../../backend/model/getlocation_model/getlocation_data_model.dart';
import '../../backend/parser/filter_screen_parser/filter_screen_parser.dart';
import '../../util/toast.dart';

class FilterScreenController extends GetxController implements GetxService {
  final FilterScreenParser parser;

  FilterScreenController({required this.parser});

  @override
  void onInit() {
    // filterList.clear();
    selectedCategory = Get.arguments[0];
    selectedNoOfMaid = Get.arguments[1];
    selectedLocation = Get.arguments[2];
    selectedRating = Get.arguments[3];
    filterButton();
    getAgentList();
    super.onInit();
  }

  List<AgentListData> agentListData = <AgentListData>[];
  List<dynamic> filterList = <dynamic>[];
  String? a = '';
  bool loading = true;
  TextEditingController searchController = TextEditingController();

  void clearController() {
    searchController.clear();
    update();
  }

  void filterButton() {
    filterList.clear();
    if (selectedCategory != null) {
      filterList.add(selectedCategory?.name);
    }
    if (selectedNoOfMaid != null) {
      filterList.add("Workers: ${selectedNoOfMaid! + 1}");
    }
    if (selectedLocation != null) {
      filterList.add(selectedLocation?.name);
    }
    if (selectedRating != null) {
      filterList.add("Rating: $selectedRating");
    }
  }

  CatogoryData? selectedCategory;
  int? selectedNoOfMaid;
  LocationData? selectedLocation;
  String? selectedRating;
  void deleteFilter(int index) {
    log('Filter list $filterList}');
    filterList.removeAt(index);

    getAgentList();
    update();
  }

  Future<void> getAgentList() async {
    Map<String, dynamic> body = {};

    // Add locationValue to the body only if it is not 0
    if (selectedLocation != null) {
      body["status"] = selectedLocation?.id;
    }
    if (searchController.value != null && searchController.value != "") {
      body["search"] = searchController.value.text;
    }
    if (selectedCategory != null) {
      body["category"] = selectedCategory?.id;
    }

    Response response = await parser.getAgentFunction(body);
    loading = false;
    try {
      agentListData.clear();
      if (response.statusCode == 200) {
        AgentList catogeryResponse = AgentList.fromJson(response.body);
        List<AgentListData> collection = catogeryResponse.data;
        for (AgentListData element in collection) {
          AgentListData data = element;
          agentListData.add(data);
        }
        log("agentListData function${agentListData.toString()}");
      } else {
        showToast('error');
      }
    } catch (e, stackTrace) {
      log('agentListData catch $e  ', error: e, stackTrace: stackTrace);
    }
    update();
  }
}
