import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view/my_request/my_request_screen.dart';
import '../../../view/profile/profile_screen.dart';

import '../../controller/bottom_navigation/bottom_nav_controller.dart';
import '../../core/colors/colors.dart';
import '../../helper/router.dart';
import 'home_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final List<Widget> _tablist = [
    HomeScreen(),
    const MyRequestScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavController>(
      builder: (value) {
        return DefaultTabController(
          length: _tablist.length,
          child: Scaffold(
            backgroundColor: bgColor,
            extendBody: true,
            body: Stack(
              children: [
                TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: value.tabController,
                  children: _tablist,
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: whiteColor,
                unselectedItemColor: smallTextColor,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                backgroundColor: lightBlackColor.withOpacity(.5),
                currentIndex: value.tabId,
                onTap: (int index) {
                  // value.updateTabId(index);
                  switch (index) {
                    case 0:
                      {
                        Get.offAllNamed(AppRouter.getBottomNavRoute(),
                            arguments: [index]);
                      }
                      break;
                    case 1:
                      {
                        Get.offAllNamed(AppRouter.getBottomNavRoute(),
                            arguments: [index]);
                      }
                      break;
                    case 2:
                      {
                        Get.offAllNamed(AppRouter.getBottomNavRoute(),
                            arguments: [index]);
                      }
                      break;
                  }
                },
                items: [
                  BottomNavigationBarItem(
                      backgroundColor: Colors.black,
                      icon: Icon(Icons.home),
                      label: 'home'.tr),
                  BottomNavigationBarItem(
                      backgroundColor: Colors.black,
                      icon: Icon(Icons.playlist_add_check),
                      label: 'myrequest'.tr),
                  BottomNavigationBarItem(
                      backgroundColor: Colors.black,
                      icon: Icon(Icons.person_2_outlined),
                      label: 'profile'.tr),
                ]),
          ),
        );
      },
    );
  }
}
