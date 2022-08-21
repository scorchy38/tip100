import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SmallButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonIcon;
  final VoidCallback onTap;
   final IconData icon ;

   const SmallButton({
    Key? key,
    required this.onTap,
    required this.buttonColor,
    required this.buttonIcon,
     this.icon = Icons.ten_k,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 45,
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
          padding: const EdgeInsets.all(10),
          child: Center(
            child:Icon(icon, color: Colors.white,)
          ),
        ),
      ),
    );
  }
}
