import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/filter_screen_controller/filter_screen_controller.dart';

import '../../../../core/colors/colors.dart';

class SearchBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const SearchBarWidget({Key? key, required this.controller}) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
  final FilterScreenController controller;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  bool _toggle = true;

  void _doToggle() => setState(() => _toggle = !_toggle);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      scrolledUnderElevation: 0,
      backgroundColor: smallTextColor.withOpacity(.2),
      foregroundColor: whiteColor,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      actions: [
        IconButton(
            onPressed: _doToggle, icon: const Icon(Icons.filter_alt_outlined))
      ],
      title: Stack(alignment: AlignmentDirectional.center, children: [
        Text(
          'Showing ${widget.controller.agentListData.length} results',
          style: const TextStyle(
              color: whiteColor, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        AnimatedContainer(
          width: _toggle ? 0 : MediaQuery.of(context).size.width,
          transform: Matrix4.translationValues(
              _toggle ? MediaQuery.of(context).size.width : 0, 0, 0),
          duration: const Duration(seconds: 1),
          height: kToolbarHeight * 0.7,
          child: TextField(
            onChanged: (value) {
              widget.controller.getAgentList();
            },
            controller: widget.controller.searchController,
            style: const TextStyle(color: Colors.white),
            cursorHeight: 20,
            enableSuggestions: false,
            autocorrect: false,
            cursorColor: smallTextColor,
            decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: widget.controller.clearController,
                  child: const Icon(
                    Icons.clear,
                    color: whiteColor,
                  ),
                ),
                border: OutlineInputBorder(
                  gapPadding: 0.0,
                  borderSide: BorderSide(color: smallTextColor.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: 'Search',
                fillColor: lightBlackColor,
                filled: true,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: smallTextColor.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: OutlineInputBorder(
                  gapPadding: 0.0,
                  borderSide: BorderSide(color: smallTextColor.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintStyle: const TextStyle(
                  color: whiteColor,
                )),
            textAlign: TextAlign.start,
          ),
        )
      ]),
    );
  }
}
