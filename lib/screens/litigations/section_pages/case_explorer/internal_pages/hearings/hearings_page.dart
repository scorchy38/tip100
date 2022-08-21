import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/logic/bloc/case_explorer_details_bloc/case_explorer_details_bloc.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/components/hearings_card_manual.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/components/hearings_header.dart';

import 'package:tip100/screens/litigations/section_pages/case_explorer/internal_pages/orders/components/orders_card.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/internal_pages/orders/components/orders_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/hearings_card.dart';

class HearingsPage extends StatefulWidget {
  const HearingsPage({Key? key}) : super(key: key);

  @override
  State<HearingsPage> createState() => _HearingsPageState();
}

class _HearingsPageState extends State<HearingsPage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController? _controller;
  int? _selectedIndex = 0;
  VoidCallback? _showPersistantBottomSheetCallBack;
  @override
  void initState() {
    _controller = new TabController(length: 2, vsync: this);

    _controller?.addListener(() {
      setState(() {
        _selectedIndex = _controller?.index;
      });
      // Do whatever you want based on the tab index
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.tertiary,
      body: SafeArea(
        child: context.watch<CaseExplorerDetailsBloc>().state.loading == true
            ? Container(
                color: AppColors.offWhite,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            : context
                        .watch<CaseExplorerDetailsBloc>()
                        .state
                        .caseDetails!
                        .hearings!
                        .length ==
                    0
                ? Container(
                    color: AppColors.offWhite,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        HearingsHeader(),
                        Expanded(
                          child: Center(
                            child: Text('No Hearings Listed'),
                          ),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Container(
                      color: AppColors.offWhite,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HearingsHeader(),
                          Expanded(
                            child: SizedBox(
                              // width: MediaQuery.of(context).size.width * 0.9,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: context
                                      .watch<CaseExplorerDetailsBloc>()
                                      .state
                                      .caseDetails!
                                      .hearings!
                                      .length,
                                  itemBuilder: (context, index) => index ==
                                          context
                                                  .watch<
                                                      CaseExplorerDetailsBloc>()
                                                  .state
                                                  .caseDetails!
                                                  .hearings!
                                                  .length -
                                              1
                                      ? Padding(
                                          padding: EdgeInsets.only(bottom: 30),
                                          child: HearingsCard(
                                            hearingDetails: context
                                                .watch<
                                                    CaseExplorerDetailsBloc>()
                                                .state
                                                .caseDetails!
                                                .hearings![index],
                                          ),
                                        )
                                      : HearingsCard(
                                          hearingDetails: context
                                              .watch<CaseExplorerDetailsBloc>()
                                              .state
                                              .caseDetails!
                                              .hearings![index],
                                        )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
      ),
    );
  }
}
