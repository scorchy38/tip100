import 'package:tip100/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CTAButtonSolid extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final Widget prefixIcon;

  const CTAButtonSolid({
    Key? key,
    required this.buttonColor,
    required this.buttonName,
    required this.prefixIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: buttonColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: Row(
          children: [
            prefixIcon,
            SizedBox(
              width: 5,
            ),
            Text(
              buttonName,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  fontSize: 14,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
