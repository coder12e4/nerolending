import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/splash/splash_controller.dart';
import '../../../core/colors/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: GetBuilder<SplashScreenController>(builder: (value) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/Logo 1.png',
              fit: BoxFit.cover,
            ),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                color: Colors.black
                    .withOpacity(0.5), // Adjust the opacity as needed
              ),
            ),
            Positioned(
              top: 90.h,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/sweep_logo.png',
                    height: 270.h,
                    width: 270.w,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: LinearProgressIndicator(
                  backgroundColor: const Color(0xff6048AD).withOpacity(.3),
                  valueColor: const AlwaysStoppedAnimation(Color(0xff6048AD)),
                  minHeight: 7.h,
                  borderRadius: BorderRadius.circular(10).r,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
