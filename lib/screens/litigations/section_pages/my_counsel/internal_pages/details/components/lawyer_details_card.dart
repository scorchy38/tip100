import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/logic/bloc/my_counsel_details_bloc/my_counsel_details_bloc.dart';
import 'package:tip100/model/counsel_details_model.dart';
import 'package:tip100/model/my_counsel_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'cta_button.dart';

class LawyerDetailsCard extends StatefulWidget {
  CounselDetail counselDetail;
  MyCounselModel myCounselData;
  LawyerDetailsCard(
    this.counselDetail,
    this.myCounselData, {
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
                      buttonName: 'Edit',
                      prefixIcon: SvgPicture.asset(AppIcons.edit))
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
                widget.counselDetail.name!.toString(),
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
                        widget.counselDetail.email!.toString(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                        widget.counselDetail.number!.toString(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                        widget.myCounselData.organization!.ongoing_case
                            .toString(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Experience',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.counselDetail.expYear!.toString(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.counselDetail.genderName!.toString(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Bar ID',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.counselDetail.barId!.toString(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Ongoing Notices',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.myCounselData.organization!.ongoing_notice
                            .toString(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Status',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 13,
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.counselDetail.expYear!.toString(),
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontSize: 15,
                            color: AppColors.textColorBlack,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Spacer(),
                ],
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
