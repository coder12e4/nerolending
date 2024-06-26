import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundDesign extends StatelessWidget {
  const BackgroundDesign({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage('assets/images/Logo 1.png'),
        ),
      ),
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40), child: child),
    );
  }
}
