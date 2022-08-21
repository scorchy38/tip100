import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/core/constants/app_illustrations.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/ancillary_details/components/ancillary_card.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/ancillary_details/components/ancillary_header.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/ancillary_details/components/cta_button_solid.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/internal_pages/insights/components/insights_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../details/components/cta_button.dart';

class InsightsPage extends StatefulWidget {
  const InsightsPage({Key? key}) : super(key: key);

  @override
  State<InsightsPage> createState() => InsightsPageState();
}

class InsightsPageState extends State<InsightsPage>
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
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InsightsHeader(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
