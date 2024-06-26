import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/filter_screen_controller/filter_screen_controller.dart';
import '../../../core/colors/colors.dart';
import '../../../core/common_widgets/agent_tile_widget.dart';
import '../../../core/common_widgets/baground_design.dart';
import '../../../core/constrains/constants.dart';
import '../../../helper/router.dart';
import '../../../view/home/filter_screen/widget/search_bar.dart';

class AgentFilterScreen extends StatelessWidget {
  const AgentFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterScreenController>(builder: (value) {
      return Scaffold(
        appBar: SearchBarWidget(controller: value),
        backgroundColor: bgColor,
        body: BackgroundDesign(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SingleChildScrollView(
                child: value.loading != true
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kSizedBoxH20,
                          Visibility(
                            visible: value.filterList.isNotEmpty,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Filter',
                                  style: TextStyle(
                                      color: smallTextColor,
                                      fontWeight: FontWeight.w600),
                                ),
                                kSizedBoxH,
                                SizedBox(
                                  height: 30.h,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) =>
                                          filterItemContainer(
                                            value.filterList[index].toString(),
                                            () => value.deleteFilter(index),
                                          ),
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                      itemCount: value.filterList.length),
                                ),
                                kSizedBoxH,
                              ],
                            ),
                          ),
                          const Text(
                            'Agents',
                            style: TextStyle(
                                color: smallTextColor,
                                fontWeight: FontWeight.w600),
                          ),
                          kSizedBoxH,
                          SizedBox(
                            height: 5 * 100.h,
                            child: value.agentListData.isNotEmpty
                                ? ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        AgentTileWidget(
                                      image: value.agentListData[index].image,
                                      title: value.agentListData[index].name,
                                      rating: value
                                          .agentListData[index].starRating
                                          .toString(),
                                      onTap: () => Get.toNamed(
                                          AppRouter.getAgentProfileRoute(),
                                          arguments: [
                                            index,
                                            value.agentListData[index].id
                                          ]),
                                    ),
                                    separatorBuilder: (context, index) =>
                                        kSizedBoxH,
                                    itemCount: value.agentListData.length,
                                  )
                                : const Center(
                                    child: Text(
                                    'No agents available',
                                    style: TextStyle(
                                        color: whiteColor, fontSize: 19),
                                  )),
                          )
                        ],
                      )
                    : SizedBox(
                        height: 550.h,
                        child: Center(
                          child: CupertinoActivityIndicator(
                            color: whiteColor.withOpacity(.4),
                            radius: 20.r,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Container filterItemContainer(String text, Function()? onTap) {
    return Container(
      height: 28.h,
      // width: 120.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10).r,
        border: Border.all(width: 1, color: lightBlackColor),
        color: lightBlackColor.withOpacity(.5),
      ),
      child: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: whiteColor,
              ),
            ),
            // GestureDetector(
            //   onTap: onTap,
            //   child: const Icon(
            //     Icons.close,
            //     color: whiteColor,
            //     size: 18,
            //   ),
            // ),
          ],
        ),
      )),
    );
  }
}
