import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/details/components/edit_lawyer_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';
import 'cta_button.dart';

class LawyerDetailsCard extends StatefulWidget {
  const LawyerDetailsCard({
    Key? key,
  }) : super(key: key);

  @override
  State<LawyerDetailsCard> createState() => _LawyerDetailsCardState();
}

class _LawyerDetailsCardState extends State<LawyerDetailsCard> {
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
                    'Lawyer Details',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColorBlack),
                  ),
                  Spacer(),
                  CTAButton(
                      buttonColor: AppColors.primary,
                      buttonName: 'Link Profile',
                      prefixIcon: SvgPicture.asset(
                        AppIcons.link,
                        height: 12,
                        width: 12,
                        color: AppColors.primary,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditLawyerDetails()));
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
                'Name',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 13,
                    color: AppColors.appGrey,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.lawyer!.name}',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 15,
                    color: AppColors.textColorBlack,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Email',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 13,
                    color: AppColors.appGrey,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.lawyer!.email}',
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
                        'Phone Number',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.lawyer!.number}',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
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
                        'Ongoing Cases',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.lawyer!.ongoingCase}',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
