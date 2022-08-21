import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/core/constants/app_illustrations.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/logic/bloc/case_explorer_details_bloc/case_explorer_details_bloc.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/details/components/details_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  ScrollController _scrollViewController = ScrollController();
  bool _showAppbar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.tertiary,
      body: SafeArea(
        child: context.watch<CaseExplorerDetailsBloc>().state.loading != true
            ? Container(
                color: AppColors.offWhite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                        height: _showAppbar ? 100.0 : 0.0,
                        duration: Duration(milliseconds: 200),
                        child: DetailsHeader()),
                    Padding(
                      padding: const EdgeInsets.all(AppDefaults.padding / 2),
                      child: Card(
                        elevation: 4,
                        color: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text(
                                  context
                                      .watch<CaseExplorerDetailsBloc>()
                                      .state
                                      .caseDetails!
                                      .caseNo!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textColorBlack),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '${context.watch<CaseExplorerDetailsBloc>().state.caseDetails!.respondent!} V/S ${context.watch<CaseExplorerDetailsBloc>().state.caseDetails!.complainant!}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          fontSize: 15,
                                          color: AppColors.appGrey,
                                          fontWeight: FontWeight.w500),
                                )

                                // SmallButton(
                                //     buttonColor: AppColors.primary,
                                //     buttonIcon: AppIcons.addButton),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _scrollViewController,
                        child: Column(
                          // shrinkWrap: true,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CaseDetailsSection(),
                            // LawyerDetailsCard(),
                            // CaseManagerDetailsCard(),
                            // LinkedCasesCard(),
                            // LinkedNoticesCard(),
                            // CorporateDetailsCard(),
                            // FollowersCard(),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                color: AppColors.offWhite,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
      ),
    );
  }
}
