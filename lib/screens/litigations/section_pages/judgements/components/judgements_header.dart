import 'package:tip100/core/components/components.dart';
import 'package:tip100/core/components/icon_button_with_text.dart';
import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/screens/litigations/components/litigations_search_box.dart';
import 'package:tip100/screens/litigations/section_pages/judgements/components/judgements_filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JudgementsHeader extends StatefulWidget {
  const JudgementsHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<JudgementsHeader> createState() => _JudgementsHeaderState();
}

class _JudgementsHeaderState extends State<JudgementsHeader> {
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
        elevation: 4,
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.textColorBlack,
                ),
              ),
              Spacer(),
              IconButtonWithText(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JudgementsFilters()));
                },
                buttonColor: AppColors.greenTag,
                buttonIcon: AppIcons.filter,
                buttonText: 'Search & Filter',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
