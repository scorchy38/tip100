import 'package:tip100/core/components/card_tags.dart';
import 'package:tip100/core/components/icon_button_with_text.dart';
import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/model/counsel_case_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../details/components/cta_button.dart';
import 'cta_button_solid.dart';

class CasesCard extends StatelessWidget {
  final CounselCaseItem caseDetails;

  const CasesCard({Key? key, required this.caseDetails}) : super(key: key);
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
            // height: 178,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Case No.',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  caseDetails.caseNo!.toString(),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14,
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Case Title',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  caseDetails.title!.toString(),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14,
                      color: AppColors.textColorBlack,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'City/Court',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '${caseDetails.court!.toString()}',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14,
                      color: AppColors.textColorBlack,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Case Stage',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  caseDetails.stage!.toString(),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14,
                      color: AppColors.textColorBlack,
                      fontWeight: FontWeight.w500),
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
                          'P.D.O.H',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          caseDetails.pdoh!.date.toString(),
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
                          'N.D.O.H',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          caseDetails.ndoh!.date.toString(),
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
                  'N.D.O.H Remarks',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  caseDetails.ndoh!.remarks.toString(),
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14,
                      color: AppColors.textColorBlack,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 25,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CardTag(
                          tagName: 'Auto', tagColor: AppColors.textColorBlack),
                      SizedBox(
                        width: 10,
                      ),
                      CardTag(
                          tagName: 'Tracked',
                          tagColor: AppColors.textColorBlack),
                      SizedBox(
                        width: 10,
                      ),
                      CardTag(
                          tagName: 'Resp.', tagColor: AppColors.textColorBlack),
                      SizedBox(
                        width: 10,
                      ),
                      CardTag(
                          tagName: 'North', tagColor: AppColors.textColorBlack),
                      SizedBox(
                        width: 10,
                      ),
                      CardTag(
                          tagName: 'Upcoming hearing',
                          tagColor: AppColors.textColorBlack),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
