import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:tip100/core/components/card_tags.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/all_cases_entrypoint.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/components/case_card_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/components/icon_button_with_text.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'add_new_case.dart';

class CaseCard extends StatelessWidget {
  final String caseNumber, complaint, caseStage, court, pdoh, ndoh, ndohRemark;
  final int caseId;

  const CaseCard(
      {Key? key,
      required this.caseNumber,
      required this.complaint,
      required this.court,
      required this.caseStage,
      required this.pdoh,
      required this.ndoh,
      required this.ndohRemark,
      required this.caseId})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: InkWell(
        onTap: () {


          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AllCasesEntryPointUI(caseId)));
        },
        // onTap: () => Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => AllCasesEntryPointUI())),
        child: Card(
          // elevation: 4,
          // color: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Category',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 12,
                        color: AppColors.appGrey,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AllCasesEntryPointUI(caseId))),
                    child: Text(
                      caseNumber,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Location',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 12,
                        color: AppColors.appGrey,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    complaint,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 14,
                        color: AppColors.textColorBlack,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Details',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 12,
                        color: AppColors.appGrey,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
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

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date Of Incident',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    fontSize: 12,
                                    color: AppColors.appGrey,
                                    fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            pdoh,
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
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time of Incident',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    fontSize: 12,
                                    color: AppColors.appGrey,
                                    fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            ndoh,
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
                      Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Divider(),
                Row(
                  children: [
                    IconButtonWithText(
                      onTap: () {

                        launch('https://firebasestorage.googleapis.com/v0/b/tip100-f1628.appspot.com/o/videos%2FWhatsApp%20Video%202022-08-19%20at%2010.43.09%20PM.mp4?alt=media&token=ba9124a3-05ef-4bbd-b8c7-b906acef8667');
                      },
                      buttonColor: AppColors.primary,
                      buttonIcon: AppIcons.addButton,
                      icon: EvaIcons.image,
                      buttonText: 'Related Media',
                    ),
                    SizedBox(
                      width: 6.7,
                    ),
                    IconButtonWithText(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddNewCase()));
                      },
                      buttonColor: AppColors.primary,
                      buttonIcon: AppIcons.addButton,
                      icon: EvaIcons.infoOutline,
                      buttonText: 'Share Information',
                    ),
                  ],
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
