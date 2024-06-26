import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      required this.controller,
      required this.hitText,
      required this.validator,
      this.textInputType,
      this.isPassword,
      this.onTap});
  final TextEditingController controller;
  final String hitText;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final Function()? onTap;
  final bool? isPassword;
  @override
  Widget build(BuildContext context) {
    // FocusNode node = FocusNode();
    return SizedBox(
      width: 350.w,
      // height: 40.h,
      child: Center(
        child: TextFormField(
          validator: validator,
          controller: controller,
          keyboardType: textInputType,
          obscureText: isPassword ?? false,

          style: const TextStyle(color: Colors.white),
          autovalidateMode: AutovalidateMode.onUserInteraction,

          decoration: InputDecoration(
              suffixIcon: isPassword != null
                  ? InkWell(
                      onTap: onTap,
                      child: Icon(isPassword!
                          ? Icons.visibility
                          : Icons.visibility_off),
                    )
                  : null,
              border: InputBorder.none, // Removes the underline
              hintText: hitText,
              fillColor: lightBlackColor.withOpacity(.4),
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
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
                borderSide: const BorderSide(color: Color(0xffA53737)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffA53737)),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 112, 111, 111),
                  fontWeight: FontWeight.bold)),
          textAlign: TextAlign.center, // Centers the text inside the field
        ),
      ),
    );
  }
}
