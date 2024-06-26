import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/my_request/my_request_controller.dart';
import '../../../controller/notification/notification_controller.dart';

import '../../../core/colors/colors.dart';
import '../../../core/common_widgets/common_button_widget.dart';
import '../../../core/constrains/constants.dart';
import '../../home/widgets/category_container.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile(
      {super.key,
      required this.viewDetails,
      required this.underReview,
      required this.category,
      required this.requestNo,
      required this.workers,
      required this.value,
      required this.index});
  final Function() viewDetails;
  final Function() underReview;
  final String category;
  final String requestNo;
  final String workers;
  final NotificationController value;
  final int index;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      width: double.infinity,
      child: GlassMorphism(
        start: .1,
        end: .1,
        boarderColor: textFieldBoarderColor,
        child: Padding(
          padding: const EdgeInsets.all(15.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    tileHeadingComponent(
                        title: 'category'.tr, content: category),
                    const VerticalDivider(
                      color: textFieldBoarderColor,
                      thickness: 1,
                    ),
                    tileHeadingComponent(
                        content: requestNo, title: 'requestno'.tr),
                    const VerticalDivider(
                      color: textFieldBoarderColor,
                      thickness: 1,
                    ),
                    tileHeadingComponent(
                      title: 'workers'.tr,
                      content: workers,
                    ),
                  ],
                ),
              ),
              kSizedBoxH,
              const Divider(color: textFieldBoarderColor),
              SizedBox(
                height: 3.h,
              ),
              Text(
                'agentdetails'.tr,
                style: const TextStyle(
                    color: smallTextColor, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5.h,
              ),
              // agentDetailsTile(value, index),
              kSizedBoxH,
              const Divider(color: textFieldBoarderColor),
              kSizedBoxH,
              IntrinsicHeight(
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'status'.tr,
                          style: const TextStyle(
                              color: smallTextColor,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        ButtonWidget(
                          buttonBackgroundColor: lightBlackColor,
                          buttonForegroundColor: whiteColor,
                          boarderColor: textFieldBoarderColor,
                          buttonText: "",
                          borderAvalable: true,
                          height: 30.h,
                          width: 150.w,
                          press: underReview,
                        ),
                      ],
                    ),
                    const VerticalDivider(
                      color: textFieldBoarderColor,
                      thickness: 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'action'.tr,
                          style: const TextStyle(
                              color: smallTextColor,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        ButtonWidget(
                          buttonBackgroundColor: buttenBlue.withOpacity(.4),
                          buttonForegroundColor: whiteColor,
                          // boarderColor: textFieldBoarderColor,
                          buttonText: 'viewdetails'.tr,
                          borderAvalable: true,
                          height: 30.h,
                          width: 150.w,
                          press: viewDetails,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Row agentDetailsTile(NotificationController value, int index) {
  //   return Row(
  //     children: [
  //       Image.network(
  //         value.myRequest!.data[index].agentDetail.image,
  //         height: 60.h,
  //         width: 65.w,
  //         errorBuilder: (context, error, stackTrace) => SizedBox(
  //           height: 60.h,
  //           width: 65.w,
  //           child: const Icon(
  //             Icons.error,
  //             color: lightBlackColor,
  //           ),
  //         ),
  //       ),
  //       SizedBox(
  //         width: 20.w,
  //       ),
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //             value.myRequest!.data[index].agentDetail.name,
  //             style: const TextStyle(
  //               color: whiteColor,
  //               fontWeight: FontWeight.w600,
  //               fontSize: 16,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 5.h,
  //           ),
  //           Text(
  //             value.myRequest!.data[index].agentDetail.location,
  //             style: const TextStyle(
  //                 color: smallTextColor,
  //                 fontWeight: FontWeight.w600,
  //                 fontSize: 14),
  //           ),
  //           SizedBox(
  //             height: 5.h,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               RatingBar.builder(
  //                 initialRating: 4.5,
  //                 itemSize: 17.0,
  //                 unratedColor: starGoldColor.withOpacity(.5),
  //                 minRating: .5,
  //                 direction: Axis.horizontal,
  //                 allowHalfRating: true,
  //                 itemCount: 1,
  //                 itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
  //                 itemBuilder: (context, _) => const Icon(
  //                   Icons.star,
  //                   color: starGoldColor,
  //                 ),
  //                 onRatingUpdate: (rating) {},
  //               ),
  //               Text(
  //                 '${value.myRequest!.data[index].agentDetail.starRating.toStringAsPrecision(2)} | ${value.myRequest!.data[index].agentDetail.totalRatings} Reviews',
  //                 style: const TextStyle(
  //                   color: smallTextColor,
  //                   fontSize: 13,
  //                 ),
  //               )
  //             ],
  //           ),
  //         ],
  //       )
  //     ],
  //   );
  // }

  Column tileHeadingComponent({String? title, String? content}) {
    return Column(
      children: [
        Text(
          title ?? '',
          style: const TextStyle(
              color: smallTextColor, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          height: 30.h,
          width: 100.w,
          decoration: BoxDecoration(
              border: Border.all(color: textFieldBoarderColor),
              borderRadius: BorderRadius.circular(10),
              color: lightBlackColor.withOpacity(.5)),
          child: Center(
            child: Text(
              content ?? '',
              style: const TextStyle(color: whiteColor),
            ),
          ),
        )
      ],
    );
  }
}
