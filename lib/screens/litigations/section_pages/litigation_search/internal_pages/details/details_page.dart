import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/core/constants/app_illustrations.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/details/components/details_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/case_details_section.dart';
import 'components/case_manager_details_card.dart';
import 'components/corporate_details_card.dart';
import 'components/cta_button.dart';
import 'components/followers_card.dart';
import 'components/lawyer_details_card.dart';
import 'components/linked_cases_card.dart';
import 'components/linked_notices_card.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  VoidCallback? _showPersistantBottomSheetCallBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.tertiary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.offWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailsHeader(),
                CaseDetailsSection(),
                LawyerDetailsCard(),
                CaseManagerDetailsCard(),
                LinkedCasesCard(),
                LinkedNoticesCard(),
                CorporateDetailsCard(),
                FollowersCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
