import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/colors/colors.dart';
import '../../../core/common_widgets/baground_design.dart';
import '../../../core/constrains/constants.dart';

class DisputeCreatedScreen extends StatelessWidget {
  const DisputeCreatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: smallTextColor.withOpacity(.2),
        foregroundColor: whiteColor,
        leading: const SizedBox(),
        title: const Text(
          'Dispute Created',
          style: TextStyle(
              color: whiteColor, fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
      backgroundColor: bgColor,
      body: BackgroundDesign(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check,
              color: buttenBlue,
              size: 100,
              weight: 10,
            ),
            kSizedBoxH20,
            const Text(
              '''     Your dispute has been registered, and we will \n    promptly provide you with a fair resolution. We \n    apologize for any inconvenience this may have   
                                   caused.
              
         You can always review the verdict on the 
                      'Request Details' page.''',
              style:
                  TextStyle(color: smallTextColor, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      )),
    );
  }
}
