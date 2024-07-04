import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../controller/home/home_controller.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constrains/constants.dart';
import 'category_container.dart';

class CategoryHomeTile extends StatelessWidget {
  const CategoryHomeTile({
    super.key,
    required this.index,
    required this.controller,
    this.secondIndex,
  });
  final int index;
  final HomeController controller;
  final secondIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("secondIndex :$secondIndex");
        controller.categorySelection(index);
        log("message ${controller.categoryValue.value}");
        controller.categoryValue.value =
            controller.categoryData[controller.categoryIndex].id;
        controller.getAgentList();
        controller.isPressed.value = false;
        controller.updateSelectedCategoryIndex(-1);
      },
      child: GlassMorphism(
        boarderColor:
            controller.listgroup == index ? buttonBgColor : lightBlackColor,
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
                  backgroundColor: controller.todoList == index
                      ? buttonBgColor
                      : lightBlackColor,
                  radius: 23.r,
                  backgroundImage: NetworkImage(
                    controller.todoList[index].section_img,
                  ),
                ),
                kSizedBoxH,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    controller.todoList[index].name,
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
