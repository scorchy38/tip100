import 'package:tip100/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class RemovableTag extends StatelessWidget {
  final String tagName;
  bool? overflow;

  RemovableTag({Key? key, required this.tagName, this.overflow})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.primary.withOpacity(0.1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            overflow != null
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      tagName,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 14,
                          color: AppColors.textColorBlack,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                : SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.7,
                    child: Text(
                      tagName,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 14,
                          color: AppColors.textColorBlack,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
            const SizedBox(
              width: 5,
            ),
            Icon(
              Icons.close,
              size: 15,
              color: AppColors.textColorBlack,
            )
          ],
        ),
      ),
    );
  }
}
