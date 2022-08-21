import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/details/components/removable_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'cta_button.dart';

class LinkedNoticesCard extends StatefulWidget {
  const LinkedNoticesCard({
    Key? key,
  }) : super(key: key);

  @override
  State<LinkedNoticesCard> createState() => LinkedNoticesCardState();
}

class LinkedNoticesCardState extends State<LinkedNoticesCard> {
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
                    'Linked Notices Details',
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
              RemovableTag(tagName: 'Notice 11212121212'),
              const SizedBox(
                height: 10,
              ),
              RemovableTag(tagName: 'Notice 112121212121212121212'),
            ],
          ),
        ),
      ),
    );
  }
}
