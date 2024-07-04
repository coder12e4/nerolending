// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:neru_lending/view/home/widgets/category_container.dart';
import '../../../core/colors/colors.dart';
import '../../../core/common_widgets/baground_design.dart';
import '../../../core/common_widgets/drop_down_widget.dart';
import '../../../helper/router.dart';
import '../../../helper/willpop_helper.dart';
import '../../../view/home/widgets/agent_card.dart';
import '../../../view/home/widgets/allcategory_widget.dart';

import '../../controller/home/home_controller.dart';
import '../../core/common_widgets/search_text_field.dart';
import '../../core/constrains/constants.dart';
import '../notification/notification_screen.dart';
import 'widgets/category_home_tile.dart';
import 'widgets/home_bottom_sheet_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () => Helper.of(context).onWillPop(),
      child: Scaffold(
        // backgroundColor: bgColor,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            'home'.tr,
            style: const TextStyle(
                color: whiteColor, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.toNamed("/notificationRoute");
              },
              child: const Icon(
                Icons.notifications,
                color: whiteColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.toNamed(AppRouter.getSettingsRoutes());
              },
              icon: const Icon(
                Icons.settings,
                color: whiteColor,
              ),
            ),
          ],
        ),
        body: BackgroundDesign(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: GetBuilder<HomeController>(builder: (value) {
                return StreamBuilder(
                    stream: value.todoStream("food"),
                    builder: (c, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData) {
                        return Text('No data');
                      } else {
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 36,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        child:
                                            SearchTextField(controller: value)),
                                  ],
                                ),
                              ),
                              kSizedBoxH,
                              Text(
                                'Industry'.tr,
                                style: const TextStyle(
                                  color: smallTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              kSizedBoxH,
                              Flexible(
                                child: GridView.builder(
                                    scrollDirection: Axis.vertical,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 4.0,
                                            mainAxisSpacing: 4.0

                                            // Number of columns
                                            ),
                                    itemBuilder: (context, index) {
                                      return GlassMorphism(
                                        boarderColor:
                                            controller.listgroup == index
                                                ? buttonBgColor
                                                : lightBlackColor,
                                        start: 0.1,
                                        end: 0.1,
                                        child: SizedBox(
                                          height: 90.h,
                                          width: 83.w,
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                CircleAvatar(
                                                  backgroundColor:
                                                      lightBlackColor,
                                                  radius: 23.r,
                                                  backgroundImage: NetworkImage(
                                                    snapshot.data![index]
                                                        .section_img,
                                                  ),
                                                ),
                                                kSizedBoxH,
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8.0),
                                                  child: Text(
                                                    snapshot.data![index].name,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        color: whiteColor),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      );
                                      return Container(
                                        child: Column(
                                          children: [
                                            Text(snapshot.data![index].name)
                                          ],
                                        ),
                                      );
                                    },
                                    itemCount: snapshot.data!.length),
                              ),
                              kSizedBoxH,
                            ],
                          ),
                        );
                      }
                    });
              }),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
        floatingActionButton: Container(
          padding: EdgeInsets.only(bottom: 60.h, right: 10.w),
          child: Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
                onPressed: () => showModalBottomSheet(
                    backgroundColor: bgColor,
                    isScrollControlled: true,
                    builder: (context) {
                      return const HomeBottomSheetWidget();
                    },
                    context: context),
                foregroundColor: whiteColor,
                backgroundColor: lightBlackColor.withOpacity(.7),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30).r),
                child: const Icon(Icons.filter_alt_outlined)),
          ),
        ),
      ),
    );
  }
}
