import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/constrains/constants.dart';
import '../../../helper/router.dart';
import '../../../view/home/widgets/category_container.dart';

import '../../../core/colors/colors.dart';

class AgencyCard extends StatelessWidget {
  const AgencyCard({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);
  final HomeController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRouter.getAgentProfileRoute(),
            arguments: [index, controller.agentListData[index].id]);
      },
      child: SizedBox(
        height: 170.h,
        width: 160.w,
        child: GlassMorphism(
          boarderColor: lightBlackColor,
          start: 0.1,
          end: 0.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.agentListData[index].image != null
                  ? CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          Image.asset("assets/images/app_logo.png").image,
                    )
                  : CircleAvatar(
                      backgroundColor: lightBlackColor,
                      radius: 70.r,
                      backgroundImage: controller.agentListData[index].image !=
                              null
                          ? NetworkImage(controller.agentListData[index].image)
                          : null,
                    ),
              kSizedBoxH,
              Text(
                controller.agentListData[index].name,
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              kSizedBoxH,
              Text(
                controller.agentListData[index].location ?? '',
                style: const TextStyle(color: smallTextColor),
              ),
              // kSizedBoxH,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: starGoldColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    controller.agentListData[index].totalRatings.toString(),
                    style: const TextStyle(
                      color: smallTextColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
