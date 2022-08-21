import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CTABlueButtons extends StatelessWidget {
  final Color buttonColor;
  final String buttonIcon;
  final String buttonText;
  final double width;
  final VoidCallback onTap;
  CTABlueButtons( {
    Key? key,
    required this.buttonColor,
    required this.buttonIcon,
    required this.buttonText,
    required this.onTap,
    required this.width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: buttonColor),bottom: BorderSide(color: buttonColor),left: BorderSide(color: buttonColor),right: BorderSide(color: buttonColor),),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Row(
              children: [
                SvgPicture.asset(
                  buttonIcon,
                  color: buttonColor,
                  height: AppDefaults.padding,
                  width: AppDefaults.padding,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  buttonText,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14,
                      color: buttonColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
