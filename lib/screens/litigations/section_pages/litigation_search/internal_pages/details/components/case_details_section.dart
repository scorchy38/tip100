import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                  CTAButton(
                      buttonColor: AppColors.primary,
                      buttonName: 'Edit',
                      prefixIcon: SvgPicture.asset(AppIcons.edit))
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
                'CC/86/2021',
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
                'Bhupendra Nath Rai V/S Kanha Home Care',
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
                'Varanasi , Uttar Pradesh',
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
                'District Consumer Forum Varanasi Uttar Pradesh',
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
                        '14 Jun 2021',
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
                        'Ongoing',
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
                        'Case Against',
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
                        'Respondent',
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
                        '01 Jul 2021',
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
                      Text(
                        'Consumer Case(CC)',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
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
                        'Litigation',
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
                        'Ongoing',
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
                        'No action',
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
                'Repeat History details - VAR05102004995 AC Gas Charging Done Flair nut leakage Issue was resolved VAR19032187913 AC Preventive Maintanence Done VAR30032154006 AC Gas Charging Done VAR04062181387 AC Repaired leakage from Indoor Cooling Coil unit has been repaired On last complain since he has not taken back the unit so he has refused to sign the Job sheet.',
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
