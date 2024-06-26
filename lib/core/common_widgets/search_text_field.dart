import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/home/home_controller.dart';

import '../colors/colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.controller,
  });
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.searchController.value,
      style: const TextStyle(color: Colors.white),
      cursorHeight: 20,
      enableSuggestions: false,
      autocorrect: false,
      cursorColor: smallTextColor,
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            Icons.search,
            color: whiteColor,
          ),
          hintText: 'search'.tr,
          fillColor: smallTextColor.withOpacity(.1),
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          // focusedErrorBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(color: Color(0xffA53737)),
          //   borderRadius: BorderRadius.circular(10.0),
          // ),
          // errorBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(color: Color(0xffA53737)),
          //   borderRadius: BorderRadius.circular(10.0),
          // ),
          hintStyle: const TextStyle(
            color: whiteColor,
          )),
      onChanged: (value) {
        controller.debouncer.call(() {
          if (value.isNotEmpty) {
            controller.getAgentList();
          } else {
            controller.getAgentList();
          }
        });
      },
      textAlign: TextAlign.start,
    );
  }
}
