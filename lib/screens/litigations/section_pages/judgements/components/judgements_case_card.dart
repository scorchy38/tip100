import 'package:tip100/core/components/card_tags.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../cause_list/components/cause_list_card_button.dart';

class CaseCard extends StatelessWidget {
  final String caseNumber,
      dateOfOrder,
      title,
      court,
      judgeName,
      pdfLink,
      docLink;

  const CaseCard(
      {Key? key,
      required this.caseNumber,
      required this.dateOfOrder,
      required this.court,
      required this.title,
      required this.judgeName,
      required this.pdfLink,
      required this.docLink})
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
            // height: getProportionateScreenHeight(270),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () async {
                        String url = pdfLink;
                        if (await canLaunch(url))
                          await launch(url);
                        else
                          // can't launch url, there is some error
                          throw "Could not launch $url";
                      },
                      child: CaseCardButton(
                          buttonColor: AppColors.purpleTag,
                          buttonName: '.PDF',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: SvgPicture.asset(
                              AppIcons.download,
                              color: AppColors.purpleTag,
                              height: 13,
                            ),
                          )),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        String url = docLink;
                        if (await canLaunch(url))
                          await launch(url);
                        else
                          throw "Could not launch $url";
                      },
                      child: CaseCardButton(
                          buttonColor: AppColors.purpleTag,
                          buttonName: '.DOC',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: SvgPicture.asset(
                              AppIcons.download,
                              color: AppColors.purpleTag,
                              height: 13,
                            ),
                          )),
                    ),
                    // Spacer(),
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
                          'Case No.',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 12,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        Text(
                          caseNumber,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 14,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date of Order',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 12,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        Text(
                          dateOfOrder != 'null'
                              ? '${DateTime.parse(dateOfOrder).day.toString().padLeft(2, '0')}-${DateTime.parse(dateOfOrder).month.toString().padLeft(2, '0')}-${DateTime.parse(dateOfOrder).year.toString()}'
                              : '',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 14,
                                  color: AppColors.textColorBlack,
                                  fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Spacer()
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14,
                      color: AppColors.textColorBlack,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Court',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  court,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14,
                      color: AppColors.textColorBlack,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Judge Name',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  judgeName,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14,
                      color: AppColors.textColorBlack,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
