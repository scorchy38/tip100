import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_illustrations.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/logic/bloc/my_counsel_details_bloc/my_counsel_details_bloc.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/components/hearings_card_automatic.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/components/hearings_card_manual.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/components/hearings_header.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/internal_pages/cases/components/cases_card.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/internal_pages/cases/components/cases_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CasesPage extends StatefulWidget {
  const CasesPage({Key? key}) : super(key: key);

  @override
  State<CasesPage> createState() => CasesPageState();
}

class CasesPageState extends State<CasesPage>
    with SingleTickerProviderStateMixin {
  String dropdownValue = 'Added Automatic';
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
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.offWhite,
            height: MediaQuery.of(context).size.height,
            child:
                context.watch<MyCounselDetailsBloc>().state.casesLoading == true
                    ? Container(
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CasesHeader(),
                          Expanded(
                            child: SizedBox(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: context
                                      .watch<MyCounselDetailsBloc>()
                                      .state
                                      .caseItems
                                      ?.length,
                                  itemBuilder: (context, index) => index ==
                                          context
                                                  .watch<MyCounselDetailsBloc>()
                                                  .state
                                                  .caseItems!
                                                  .length -
                                              1
                                      ? Padding(
                                          padding: EdgeInsets.only(bottom: 150),
                                          child: CasesCard(
                                              caseDetails: context
                                                  .watch<MyCounselDetailsBloc>()
                                                  .state
                                                  .caseItems![index]),
                                        )
                                      : CasesCard(
                                          caseDetails: context
                                              .watch<MyCounselDetailsBloc>()
                                              .state
                                              .caseItems![index])),
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
