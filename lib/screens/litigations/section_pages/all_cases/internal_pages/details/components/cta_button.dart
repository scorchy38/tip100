import 'package:flutter/material.dart';

class CTAButton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;
  final Widget prefixIcon;

  const CTAButton({
    Key? key,
    required this.buttonColor,
    required this.buttonName,
    required this.prefixIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: buttonColor.withOpacity(0.1),
          boxShadow: [
            BoxShadow(
                color: Color(0xFF2236470D).withOpacity(0.05),
                spreadRadius: 0,
                blurRadius: 10)
          ]),
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
                  color: buttonColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
