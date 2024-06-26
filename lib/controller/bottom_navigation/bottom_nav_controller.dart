import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController
    with GetTickerProviderStateMixin {
  // final BottomNavParser parser;
  late TabController tabController;
  BottomNavController();
  int? pageIndex;
  int tabId = 0;

  @override
  void onInit() {
    try {
      tabId = int.parse(Get.arguments[0].toString());
    } catch (e) {
      debugPrint("Exception from tabs");
      debugPrint(e.toString());
    }
    tabController = TabController(length: 3, vsync: this, initialIndex: tabId);
    super.onInit();

    debugPrint("tabid");
    debugPrint(tabId.toString());
  }

  void updateTabId(int index) {
    pageIndex = index;
    tabController.animateTo(pageIndex!);
    update();
  }
}
