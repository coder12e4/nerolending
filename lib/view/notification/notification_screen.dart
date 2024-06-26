import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/notification/notification_controller.dart';
import '../../../core/colors/colors.dart';
import '../../../core/common_widgets/baground_design.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helper/router.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    controller.getnotificationDatails();
    super.initState();
  }

  final NotificationController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.offAllNamed('/bottomNav'),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 1,
        scrolledUnderElevation: 0,
        backgroundColor: smallTextColor.withOpacity(.2),
        foregroundColor: whiteColor,
        title: Text(
          'Notifications'.tr,
          style: const TextStyle(
              color: whiteColor, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: bgColor,
      body: BackgroundDesign(
          child: GetBuilder<NotificationController>(builder: (value) {
        return value.loading != true
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: value.notificationDatails?.data.length,
                itemBuilder: (context, index) {
                  if (value.notificationDatails?.data[index].data.title !=
                      null) {
                    if (value.notificationDatails?.data[index].data.title ==
                        "Booking Approved") {
                      value.bookingStatus = "Approved";
                    } else if (value
                            .notificationDatails?.data[index].data.title ==
                        "Booking Rejected") {
                      value.bookingStatus = "Rejected";
                    } else {
                      value.bookingStatus = "pending";
                    }

                    if (value.notificationDatails?.data[index].data.body !=
                            null &&
                        value.notificationDatails?.data[index].data.body !=
                            "") {
                      value.body =
                          value.notificationDatails!.data[index].data.body;
                    }
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 5),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: textFieldBoarderColor,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            onTap: () {
                              log("booking id:${value.notificationDatails?.data[index].data.bookingId}");
                              Get.toNamed(
                                  AppRouter.getRequestDetailsRoutesRoute(),
                                  arguments: [
                                    value.notificationDatails?.data[index].data
                                        .bookingId,
                                    "/notificationRoute"
                                  ]);
                            },
                            style: ListTileStyle.drawer,
                            leading: const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/app_logo.png"),
                            ),
                            title: Text(
                              value.body,
                              style: TextStyle(color: whiteColor),
                            ),
                            // trailing: Text(
                            //   "${value.notificationDatails!.data[index].createdAt.day.toString()}days ago",
                            //   style: TextStyle(color: whiteColor),
                            // ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 22.0, vertical: 10),
                            child: Row(
                              children: [
                                Text(
                                  "Booking Status :${value.bookingStatus}",
                                  style: TextStyle(color: whiteColor),
                                ),
                                Spacer(),
                                Text(
                                  "${value.notificationDatails?.data[index].createdAt.day.toString()}days ago",
                                  style: TextStyle(color: whiteColor),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            : Center(
                child: CupertinoActivityIndicator(
                  color: whiteColor.withOpacity(.4),
                  radius: 20.r,
                ),
              );
      })),
    );
  }
}
