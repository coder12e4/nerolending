import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../backend/model/getlocation_model/getlocation_data_model.dart';
import '../../../controller/home/home_controller.dart';
import '../../../core/colors/colors.dart';

class DropedownWidget extends StatefulWidget {
  DropedownWidget({
    super.key,
    required this.hintText,
    required this.dropDownlist,
    required this.height,
    required this.width,
    this.selectedValue,
    required this.controller,
  });

  final String hintText;
  final double height;
  final double width;
  final HomeController controller;
  final List<DropdownMenuItem<LocationData>>? dropDownlist;
  LocationData? selectedValue;

  @override
  State<DropedownWidget> createState() => _DropedownWidgetState();
}

class _DropedownWidgetState extends State<DropedownWidget> {
  @override
  Widget build(BuildContext context) {
    log("dropdown${widget.dropDownlist.toString()}");
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: smallTextColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(width: 10.w),
            const Icon(
              Icons
                  .location_on_outlined, // Replace 'your_prefix_icon' with the desired icon
              color: whiteColor, // Set the color of the icon
            ),
            SizedBox(
              width: 10.w,
            ),
            Flexible(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<LocationData>(
                  dropdownColor: lightBlackColor.withOpacity(.7),
                  underline: null,
                  style: const TextStyle(color: Colors.white),
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: whiteColor,
                  ),
                  padding: EdgeInsets.only(right: 10.w),
                  hint: Text(
                    widget.hintText,
                    style: const TextStyle(color: whiteColor),
                  ),
                  value: widget.selectedValue,
                  items: widget.dropDownlist,
                  isExpanded: true,
                  onChanged: (LocationData? newValue) {
                    if (newValue != null) {
                      setState(() {
                        widget.selectedValue = newValue;
                        controller.locationValue.value =
                            widget.selectedValue!.id;
                        controller.country.value = newValue.name;
                      });
                      widget.controller.getAgentList();
                      log(widget.selectedValue!.country);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
