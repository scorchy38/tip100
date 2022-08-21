import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconButtonWithText extends StatelessWidget {
  final Color buttonColor;
  final String buttonIcon;
  final String buttonText;
  final VoidCallback onTap;
  IconData icon;
  IconButtonWithText(
      {Key? key,
      required this.buttonColor,
      required this.buttonIcon,
      required this.buttonText,
      required this.onTap,
      this.icon = EvaIcons.globe,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF2236470D).withOpacity(0.05),
                  spreadRadius: 0,
                  blurRadius: 10)
            ],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: buttonColor),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Row(
              children: [
                Icon(icon, color: Colors.white,),
                SizedBox(
                  width: 10,
                ),
                Text(
                  buttonText,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 15,
                      color: AppColors.white,
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
