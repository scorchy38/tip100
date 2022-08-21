import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SmallButtonTransparent extends StatelessWidget {
  final Color buttonColor;
  final String buttonIcon;
  const SmallButtonTransparent({
    Key? key,
    required this.buttonColor,
    required this.buttonIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0xFF2236470D).withOpacity(0.05),
                spreadRadius: 0,
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: buttonColor.withOpacity(0.1)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SvgPicture.asset(
            buttonIcon,
            height: AppDefaults.padding,
            width: AppDefaults.padding,
            color: buttonColor,
          ),
        ),
      ),
    );
  }
}
