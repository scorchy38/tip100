import 'package:tip100/core/components/components.dart';
import 'package:tip100/core/components/icon_button_with_text.dart';
import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/screens/litigations/components/litigations_search_box.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/components/add_new_lawyer.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/components/my_counsel_filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCounselHeader extends StatefulWidget {
  const MyCounselHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<MyCounselHeader> createState() => _MyCounselHeaderState();
}

class _MyCounselHeaderState extends State<MyCounselHeader> {
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
                child: const Icon(
                  Icons.arrow_back,
                  color: AppColors.textColorBlack,
                ),
              ),
              const Spacer(),
              SmallButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyCounselFilters()));
                  },
                  buttonColor: AppColors.purpleTag,
                  buttonIcon: AppIcons.filter),
              const SizedBox(
                width: 15,
              ),
              IconButtonWithText(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddNewLawyer()));
                },
                buttonColor: AppColors.greenTag,
                buttonIcon: AppIcons.addButton,
                buttonText: 'Add Lawyer',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
