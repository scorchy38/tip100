import 'package:tip100/core/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final String title;
  final String cases;


  const Indicator({
    Key? key,
    required this.color,
    required this.title,
    required this.cases,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'O',
            style:  Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontSize: 22, fontWeight: FontWeight.w500, color: color),
          ),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:  Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.appGrey),
              ),Text(
                cases,
                style:  Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: color),
              ),
            ],
          ),
        ],
      ),
    );
  }
}