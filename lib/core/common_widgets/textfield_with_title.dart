import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/colors.dart';
import 'common_text_field.dart';

class TextFieldWithTitle extends StatelessWidget {
  const TextFieldWithTitle({
    super.key,
    required this.controller,
    required this.titleText,
    this.validator,
    this.textInputType,
    this.isPassword,
    this.onTap,
  });
  final TextEditingController controller;
  final String titleText;
  final bool? isPassword;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: const TextStyle(
              color: smallTextColor, fontWeight: FontWeight.w600, fontSize: 14),
        ),
        SizedBox(
          height: 5.h,
        ),
        TextFormFieldWidget(
          controller: controller,
          hitText: '',
          validator: validator,
          textInputType: textInputType,
          onTap: onTap,
          isPassword: isPassword,
        ),
      ],
    );
  }
}
