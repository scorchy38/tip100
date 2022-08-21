import 'package:tip100/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_defaults.dart';

class CardTag extends StatelessWidget {
  final String tagName;
  final Color tagColor;

  const CardTag({
    Key? key,
    required this.tagName,
    required this.tagColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: tagColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Text(
          tagName,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 12,
                color: AppColors.white,
              ),
        ),
      ),
    );
  }
}
