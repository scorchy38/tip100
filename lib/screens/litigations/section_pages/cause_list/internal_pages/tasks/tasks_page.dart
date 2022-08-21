import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_illustrations.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/tasks/components/tasks_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/tasks_card.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage>
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
                TasksHeader(),
                Expanded(
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.9,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) => index == 4
                            ? const Padding(
                                padding: EdgeInsets.only(bottom: 30),
                                child: TasksCard(
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
                            : const TasksCard(
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
