import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_illustrations.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/components/hearings_card_automatic.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/components/hearings_card_manual.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/components/hearings_header.dart';
import 'package:tip100/screens/litigations/section_pages/cause_list/internal_pages/couriers/components/couriers_card.dart';
import 'package:tip100/screens/litigations/section_pages/cause_list/internal_pages/couriers/components/couriers_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CouriersPage extends StatefulWidget {
  const CouriersPage({Key? key}) : super(key: key);

  @override
  State<CouriersPage> createState() => CouriersPageState();
}

class CouriersPageState extends State<CouriersPage>
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CouriersHeader(),
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) => index == 4
                            ? const Padding(
                                padding: EdgeInsets.only(bottom: 30),
                                child: CouriersCard(
                                  caseNumber: '195461836',
                                  complaint:
                                      'State Bank of India (SBI) Through Branch Manager',
                                  court: 'Dashrath Singh Meena',
                                  caseStage:
                                      'Ongoing/ CS CCC - CIVIL SUIT (CCC)',
                                  pdoh: '01 Mar, 2022',
                                  ndoh: '21 Mar, 2022',
                                  ndohRemark: 'Evidence of opposite party',
                                ),
                              )
                            : const CouriersCard(
                                caseNumber: '195461836',
                                complaint:
                                    'State Bank of India (SBI) Through Branch Manager',
                                court: 'Dashrath Singh Meena',
                                caseStage: 'Ongoing/ CS CCC - CIVIL SUIT (CCC)',
                                pdoh: '01 Mar, 2022',
                                ndoh: '21 Mar, 2022',
                                ndohRemark: 'Evidence of opposite party',
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
