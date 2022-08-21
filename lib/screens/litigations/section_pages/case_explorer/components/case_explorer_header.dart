import 'package:tip100/core/components/components.dart';
import 'package:tip100/core/components/icon_button_with_text.dart';
import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/screens/litigations/components/litigations_search_box.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/components/manage_keywords.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CaseExplorerHeader extends StatefulWidget {
  const CaseExplorerHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<CaseExplorerHeader> createState() => _CaseExplorerHeaderState();
}

class _CaseExplorerHeaderState extends State<CaseExplorerHeader> {
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          // side: BorderSide(
          //   width: 2.0,
          //   color: AppColors.purpleTag,
          // ),
        ),
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
              SmallButton(
                  onTap: () {},
                  buttonColor: AppColors.purpleTag,
                  buttonIcon: AppIcons.filter),
              SizedBox(
                width: 15,
              ),
              SmallButton(
                  onTap: () {},
                  buttonColor: AppColors.primary,
                  buttonIcon: AppIcons.download),
              SizedBox(
                width: 15,
              ),
              IconButtonWithText(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ManageKeywords()));
                },
                buttonColor: AppColors.greenTag,
                buttonIcon: AppIcons.keywords,
                buttonText: 'Keywords',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
