import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/colors/colors.dart';
import '../../../../core/common_widgets/common_button_widget.dart';

class WithdrawRequestBottomSheet extends StatelessWidget {
  const WithdrawRequestBottomSheet({
    super.key,
    required this.onTap,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      width: double.infinity,
      child: Column(children: [
        const Icon(
          Icons.horizontal_rule_rounded,
          size: 60,
          weight: 80,
          color: lightBlackColor,
        ),
        ButtonWidget(
          buttonBackgroundColor: lightBlackColor.withOpacity(.4),
          buttonForegroundColor: whiteColor,
          boarderColor: textFieldBoarderColor,
          buttonText: 'WITHDRAW REQUEST',
          borderAvalable: true,
          press: onTap,
        )
      ]),
    );
  }
}
