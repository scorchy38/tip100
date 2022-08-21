import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_defaults.dart';
import '../../../core/constants/app_images.dart';

class OptionsCard extends StatelessWidget {
  final String cardtitle;
  final bool newTag;
  final Color cardColor;
  final String icon;
  final bool toggle;

  const OptionsCard(
      {Key? key,
      required this.cardtitle,
      required this.newTag,
      required this.icon,
      required this.cardColor,
      required this.toggle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: Card(
        elevation: 0,
        color: cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Center(child: SvgPicture.asset(icon)),
              const SizedBox(
                width: 20,
              ),
              Text(
                cardtitle,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 16,
                    color: AppColors.textColorBlack,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 10,
              ),
              newTag
                  ? Container(
                      decoration: const BoxDecoration(
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
                                  fontSize: 12, color: AppColors.purpleTag),
                        ),
                      ),
                    )
                  : Container(),
              Spacer(),
             !toggle? const Icon(
                Icons.arrow_forward,
                color: AppColors.textColorBlack,
              ) : SvgPicture.asset(AppIcons.toggle)
            ],
          ),
        ),
      ),
    );
  }
}
