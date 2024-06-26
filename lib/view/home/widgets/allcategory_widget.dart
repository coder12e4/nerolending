import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/home/home_controller.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constrains/constants.dart';
import 'category_container.dart';

class AllCategoryWidget extends StatelessWidget {
  const AllCategoryWidget({
    super.key,
    required this.controller,
    required this.index,
  });

  final HomeController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("pressed");
        log("Indexxxxxxxxxx:$index");

        controller.locationValue.value = 0;
        controller.categoryValue.value = 0;
        controller.searchController.value.clear();
        // controller.country.value = "Location";
        // Assuming getAgentList clears some data, you can call it here
        log("After setting values: location=${controller.locationValue.value}, category=${controller.categoryValue.value}");
        controller.getCatogery();
        controller.country.value = controller.firstLocation.value;
        controller.getLocation();
        controller.getAgentList();
        controller.updateSelectedCategoryIndex(index);
        controller.categorySelection(index - 1);
      },
      child: GlassMorphism(
        boarderColor: controller.selectedCategoryIndex == index
            ? buttonBgColor
            : lightBlackColor,
        start: 0.1,
        end: 0.1,
        child: SizedBox(
          height: 90.h,
          width: 83.w,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                    backgroundColor: controller.selectedCategoryIndex == index
                        ? buttonBgColor
                        : lightBlackColor,
                    radius: 23.r,
                    child: Image.asset(
                      controller.categoryItems[0]["image"],
                      height: 20.h,
                      width: 20.w,
                    )),
                kSizedBoxH,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    controller.categoryItems[0]["name"],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: whiteColor),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
