import 'package:tip100/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/app_defaults.dart';

class LitigationsSectionCard extends StatelessWidget {
  final String cardtitle;
  final bool newTag;
  final void Function() onTap;
  const LitigationsSectionCard(
      {Key? key,
      required this.cardtitle,
      required this.newTag,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: AppColors.primary.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
          child: Card(
            // elevation: 4,
            color: Colors.grey.shade200,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
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
        ),
      ),
    );
  }
}
