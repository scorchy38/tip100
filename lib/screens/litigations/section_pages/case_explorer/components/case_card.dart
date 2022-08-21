import 'package:tip100/core/components/card_tags.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/logic/bloc/case_explorer_details_bloc/case_explorer_details_bloc.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/components/case_card_button.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/internal_pages/case_explorer_entrypoint.dart';
import 'package:tip100/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaseCard extends StatelessWidget {
  final String caseNumber, complaint, respondent, court, dof;
  final int caseId;

  const CaseCard(
      {Key? key,
      required this.caseNumber,
      required this.complaint,
      required this.court,
      required this.respondent,
      required this.caseId,
      required this.dof})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: InkWell(
        onTap: () {
          context.read<CaseExplorerDetailsBloc>().add(RefreshingCaseDetails());
          context
              .read<CaseExplorerDetailsBloc>()
              .add(GetCaseExplorerDetails(caseId));
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CaseExplorerEntryPointUI()));
        },
        child: Card(
          elevation: 4,
          color: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              // height: getProportionateScreenHeight(334),
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
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    CaseExplorerEntryPointUI())),
                        child: Text(
                          caseNumber,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 14,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CardTag(
                        tagName: 'Compl.',
                        tagColor: AppColors.textColorBlack,
                      ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      // CardTag(
                      //   tagName: 'Compl.',
                      //   tagColor: AppColors.orangeTag,
                      // )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Complainant',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 12,
                        color: AppColors.appGrey,
                        fontWeight: FontWeight.w500),
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
                    'Respondent',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 12,
                        color: AppColors.appGrey,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    respondent,
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
                    'D.O.F',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 12,
                        color: AppColors.appGrey,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    dof,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 14,
                        color: AppColors.textColorBlack,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CaseCardButton(
                          buttonColor: AppColors.greenTag,
                          buttonName: 'Allot To Legistify',
                          prefixIcon: Icon(
                            Icons.add,
                            color: AppColors.white,
                          )),
                      CaseCardButton(
                          buttonColor: AppColors.primary,
                          buttonName: 'Add to Tracker',
                          prefixIcon: Icon(
                            Icons.add,
                            color: AppColors.white,
                          ))
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
