import 'package:tip100/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_defaults.dart';

class NoticeSectionCard extends StatelessWidget {
  final String cardtitle;
  final bool newTag;
  const NoticeSectionCard(
      {Key? key, required this.cardtitle, required this.newTag})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: Card(
        elevation: 4,
        color: AppColors.tertiary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                cardtitle,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 16,
                    color: AppColors.textColorBlack,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                width: 10,
              ),
              newTag
                  ? Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: AppColors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 3.0),
                        child: Text(
                          '7 New',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 12, color: AppColors.primary),
                        ),
                      ),
                    )
                  : Container(),
              Spacer(),
              Icon(
                Icons.arrow_forward,
                color: AppColors.textColorBlack,
              )
            ],
          ),
        ),
      ),
    );
  }
}
