import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../util/validators.dart';

import '../colors/colors.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 45.h,
      width: 50.w,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        validator: (value) => SweepValidators.otpValidator(value),
        controller: controller,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: whiteColor,
            ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
            border: InputBorder.none, // Removes the underline

            fillColor: lightBlackColor.withOpacity(.4),
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: textFieldBoarderColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              gapPadding: 0.0,
              borderSide: const BorderSide(color: textFieldBoarderColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: textFieldBoarderColor),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffA53737)),
              borderRadius: BorderRadius.circular(10.0),
            ),
            hintStyle: const TextStyle(
                color: Color.fromARGB(255, 112, 111, 111),
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
