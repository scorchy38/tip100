import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                        color: AppColors.primary,
                      )),
                  SizedBox(
                    width: 10,
                  ),
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
                'Mujeeb Effendi',
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
                'mujeeb.mehndilaw.com',
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
                        '9839126921',
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
                        '99',
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
