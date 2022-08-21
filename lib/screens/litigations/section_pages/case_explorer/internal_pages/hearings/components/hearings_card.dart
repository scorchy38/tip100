import 'package:tip100/core/components/card_tags.dart';
import 'package:tip100/core/components/icon_button_with_text.dart';
import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/model/case_explorer_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../details/components/cta_button.dart';
import 'cta_button_solid.dart';

class HearingsCard extends StatelessWidget {
  final Hearings hearingDetails;

  const HearingsCard({Key? key, required this.hearingDetails})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: Card(
        elevation: 4,
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            // height: 214,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    // CardTag(tagName: 'High Court', tagColor: AppColors.primary),
                    Spacer(),
                    IconButtonWithText(
                        onTap: () {},
                        buttonColor: AppColors.primary,
                        buttonText: 'View Proceedings',
                        buttonIcon: AppIcons.show),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'DOH',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        Text(
                          hearingDetails.doh!.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 15,
                                  color: AppColors.textColorBlack,
                                  fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NDOH',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        Text(
                          hearingDetails.ndoh!.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 15,
                                  color: AppColors.textColorBlack,
                                  fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                Text(
                  'Stage',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  hearingDetails.status!.toString(),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14,
                      color: AppColors.textColorBlack,
                      fontWeight: FontWeight.w500),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // Row(
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           'Stage',
                //           style: Theme.of(context)
                //               .textTheme
                //               .bodyText1
                //               ?.copyWith(
                //                   fontSize: 13,
                //                   color: AppColors.appGrey,
                //                   fontWeight: FontWeight.w500),
                //         ),
                //         Text(
                //           hearingDetails.status!.toString(),
                //           style: Theme.of(context)
                //               .textTheme
                //               .bodyText1
                //               ?.copyWith(
                //                   fontSize: 15,
                //                   color: AppColors.textColorBlack,
                //                   fontWeight: FontWeight.w500),
                //         ),
                //       ],
                //     ),
                //     Spacer(),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           'Cause List',
                //           style: Theme.of(context)
                //               .textTheme
                //               .bodyText1
                //               ?.copyWith(
                //                   fontSize: 13,
                //                   color: AppColors.appGrey,
                //                   fontWeight: FontWeight.w500),
                //         ),
                //         Text(
                //           hearingDetails.causeListType!.toString(),
                //           style: Theme.of(context)
                //               .textTheme
                //               .bodyText1
                //               ?.copyWith(
                //                   fontSize: 15,
                //                   color: AppColors.textColorBlack,
                //                   fontWeight: FontWeight.w500),
                //         ),
                //       ],
                //     ),
                //     Spacer(),
                //   ],
                // ),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                CardTag(
                    tagName: hearingDetails.court!.toString(),
                    tagColor: AppColors.textColorBlack),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
