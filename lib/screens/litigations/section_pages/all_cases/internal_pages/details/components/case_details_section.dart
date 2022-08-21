import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/details/components/edit_case_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';
import 'cta_button.dart';

class CaseDetailsSection extends StatefulWidget {
  const CaseDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  State<CaseDetailsSection> createState() => _CaseDetailsSectionState();
}

class _CaseDetailsSectionState extends State<CaseDetailsSection> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: Card(
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Case Details',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColorBlack),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EditCaseDetails(
                                    caseNumber:
                                        '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.caseExplorerDetail!.caseNo!.toString()}',
                                    title: context
                                        .watch<AllCasesDetailsBloc>()
                                        .state
                                        .caseDetails!
                                        .title!
                                        .toString(),
                                    type: context
                                        .watch<AllCasesDetailsBloc>()
                                        .state
                                        .caseDetails!
                                        .caseTypeName!
                                        .toString(),
                                    court: context
                                        .watch<AllCasesDetailsBloc>()
                                        .state
                                        .caseDetails!
                                        .caseExplorerDetail!
                                        .courtName!
                                        .toString(),
                                    priority: context
                                        .watch<AllCasesDetailsBloc>()
                                        .state
                                        .caseDetails!
                                        .priority,
                                    status: context
                                        .watch<AllCasesDetailsBloc>()
                                        .state
                                        .caseDetails!
                                        .status,
                                    caseStage: context
                                        .watch<AllCasesDetailsBloc>()
                                        .state
                                        .caseDetails!
                                        .caseExplorerDetail!
                                        .stage!,
                                    action: context
                                        .watch<AllCasesDetailsBloc>()
                                        .state
                                        .caseDetails!
                                        .actionName!,
                                    summary: context
                                        .watch<AllCasesDetailsBloc>()
                                        .state
                                        .caseDetails!
                                        .description,
                                  )));
                    },
                    child: CTAButton(
                        buttonColor: AppColors.primary,
                        buttonName: 'Edit',
                        prefixIcon: SvgPicture.asset(
                          AppIcons.edit,
                          height: 12,
                          width: 12,
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Case No.',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 13,
                    color: AppColors.appGrey,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.caseExplorerDetail!.caseNo!.toString()}',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 15,
                    color: AppColors.textColorBlack,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Case Title',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 13,
                    color: AppColors.appGrey,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.title!.toString()}',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 15,
                    color: AppColors.textColorBlack,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Case State',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 13,
                    color: AppColors.appGrey,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.caseExplorerDetail!.city!.toString()} , ${context.watch<AllCasesDetailsBloc>().state.caseDetails!.caseExplorerDetail!.state!.toString()}',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 15,
                    color: AppColors.textColorBlack,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Court',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 13,
                    color: AppColors.appGrey,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.caseExplorerDetail!.courtName!.toString()}',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 15,
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
                        'Date of Filing',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.caseExplorerDetail!.dateOfFiling!.toString()}',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Case Stage',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.caseExplorerDetail!.stage!.toString()}',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Case By/Case Against',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.caseByName!.toString()}',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Client Side',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.clientSide.toString() == 'R' ? 'Respondent' : 'Complainant'}',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Lawyer Notification',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'On',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
                        'Date of allocation',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.dateOfAllotment!.toString()}',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Case Type',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: Text(
                          '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.caseTypeName!.toString()}',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 15,
                                  color: AppColors.textColorBlack,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Case Category',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.disputeCategoryName.toString()}',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Case Status',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.status!.toString()}',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Key Action',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.actionName!.toString()}',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
                'Case Summary:',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 13,
                    color: AppColors.appGrey,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.handeledCaseSummary!.toString()}',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 15,
                    color: AppColors.textColorBlack,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
