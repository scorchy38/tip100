import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/screens/home/components/bar_chart.dart';
import 'package:tip100/screens/litigations/components/litigations_sections.dart';
import 'package:tip100/screens/more/components/options_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/app_images.dart';

import '../../core/components/search_box.dart';
import 'components/options_sections.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.tertiary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.white,
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     const SizedBox(
            //       height: 40,
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(left: AppDefaults.padding),
            //       child: SvgPicture.asset(AppImages.logo),
            //     ),
            //     const SizedBox(
            //       height: 40,
            //     ),
            //     OptionsCard(
            //       cardtitle: 'Tickets',
            //       newTag: true,
            //       cardColor: AppColors.lightPurple,
            //       icon: AppIcons.tickets,
            //     ),
            //     OptionsCard(
            //       cardtitle: 'Notifications',
            //       newTag: true,
            //       cardColor: AppColors.lightPurple,
            //       icon: AppIcons.notifications,
            //     ),
            //     const SizedBox(
            //       height: 10,
            //     ),
            //     Divider(
            //       thickness: 2,
            //     ),
            //     const SizedBox(
            //       height: 10,
            //     ),
            //     OptionsCard(
            //       cardtitle: 'Stored Precedents',
            //       newTag: false,
            //       cardColor: AppColors.tertiary,
            //       icon: AppIcons.storedPrecedents,
            //     ),
            //     OptionsCard(
            //       cardtitle: 'Calendar',
            //       newTag: false,
            //       cardColor: AppColors.tertiary,
            //       icon: AppIcons.calendar,
            //     ),
            //     OptionsCard(
            //       cardtitle: 'MIS',
            //       newTag: false,
            //       cardColor: AppColors.tertiary,
            //       icon: AppIcons.mis,
            //     ),
            //     const SizedBox(
            //       height: 10,
            //     ),
            //     Divider(
            //       thickness: 2,
            //     ),
            //     const SizedBox(
            //       height: 10,
            //     ),
            //     OptionsCard(
            //       cardtitle: 'Dark Mode',
            //       newTag: false,
            //       cardColor: Colors.grey.shade200,
            //       icon: AppIcons.darkMode,
            //     ),
            //     OptionsCard(
            //       cardtitle: 'Settings',
            //       newTag: false,
            //       cardColor: Colors.grey.shade200,
            //       icon: AppIcons.settings,
            //     ),
            //     OptionsCard(
            //       cardtitle: 'Logout',
            //       newTag: false,
            //       cardColor: AppColors.lightOrange,
            //       icon: AppIcons.logOut,
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
