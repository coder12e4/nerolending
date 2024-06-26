// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(
      {super.key,
      required this.buttonBackgroundColor,
      required this.buttonForegroundColor,
      required this.buttonText,
      required this.borderAvalable,
      required this.press,
      this.width,
      this.boarderColor,
      this.height,
      this.controller});
  final controller;
  final Color buttonBackgroundColor;
  final Color buttonForegroundColor;
  final String buttonText;
  bool borderAvalable = false;
  final Color? boarderColor;
  final Function() press;
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 42.h,
        width: width ?? 340.w,
        child: ElevatedButton(
          style: ButtonStyle(
            // splashFactory:,
            surfaceTintColor:
                const MaterialStatePropertyAll(Colors.transparent),
            side: MaterialStateProperty.all(BorderSide(
                color:
                    boarderColor ?? const Color(0xff6C50C7).withOpacity(.5))),
            foregroundColor: MaterialStateProperty.all(buttonForegroundColor),
            backgroundColor: MaterialStateProperty.all(buttonBackgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0).r, // Adjust the value as needed
              ),
            ),
          ),
          onPressed: press,
          child: Text(buttonText),
        ));
  }
}

class ButtonWithIconWidget extends StatelessWidget {
  ButtonWithIconWidget(
      {super.key,
      required this.buttonBackgroundColor,
      required this.buttonForegroundColor,
      required this.buttonText,
      required this.borderAvalable,
      required this.press,
      this.width,
      this.boarderColor,
      this.height,
      this.controller,
      required this.icon});
  final controller;
  final Color buttonBackgroundColor;
  final Color buttonForegroundColor;
  final String buttonText;
  final IconData icon;
  bool borderAvalable = false;
  final Color? boarderColor;
  final Function() press;
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 42.h,
        width: width ?? 340.w,
        child: ElevatedButton(
          style: ButtonStyle(
            // splashFactory:,
            surfaceTintColor:
                const MaterialStatePropertyAll(Colors.transparent),
            side: MaterialStateProperty.all(BorderSide(
                color:
                    boarderColor ?? const Color(0xff6C50C7).withOpacity(.5))),
            foregroundColor: MaterialStateProperty.all(buttonForegroundColor),
            backgroundColor: MaterialStateProperty.all(buttonBackgroundColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10.0).r, // Adjust the value as needed
              ),
            ),
          ),
          onPressed: press,
          child: Icon(icon, size: 40),
        ));
  }
}
