import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/model/all_cases_model.dart';
import 'package:tip100/screens/home/components/bar_chart.dart';
import 'package:tip100/screens/home/components/submitted_tips_card.dart';
import 'package:tip100/screens/home/components/submitted_tips_dropdown.dart';
import 'package:tip100/screens/litigations/components/litigations_sections.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/components/all_cases_dropdown.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/components/all_cases_header.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/components/case_explorer_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../litigations/section_pages/all_cases/components/all_cases_card.dart';

class SubmittedTips extends StatefulWidget {
  const SubmittedTips({Key? key}) : super(key: key);

  @override
  State<SubmittedTips> createState() => _SubmittedTipsState();
}

class _SubmittedTipsState extends State<SubmittedTips> {
  final ScrollController controller = new ScrollController();
  int totalCount = 0;
  @override
  void initState() {
    //added the pagination function with listener

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tertiary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.offWhite,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AllCasesHeader(),
                SizedBox(
                  height: 20,
                ),
                // AllCasesHeader(),
                SubmittedTipsDropdown(),
                Expanded(
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.9,
                    child: Builder(
                      builder: (context) {
                        List<AllCasesModel>? cases = [];
                        cases = context.watch<AllCasesBloc>().state.all_cases;
                        // cases = [
                        //   AllCasesModel(
                        //       case_id: 2143513,
                        //       case_no: "Robbery",
                        //       title: "Mumbai",
                        //       ndoh: DOH(
                        //           status: 1,
                        //           date: "Evening",
                        //           remarks: "Ongoing"),
                        //       region: "N",
                        //       loan_no: null,
                        //       pdoh: DOH(
                        //           status: 2,
                        //           date: "2022-06-02",
                        //           remarks: "Ongoing"),
                        //       stage: "Written Statement/ CC - CRIMINAL CASE",
                        //       client: null,
                        //       court: "District Consumer Forum Alwar Rajasthan",
                        //       city: "Delhi",
                        //       type: "CC - CRIMINAL CASE",
                        //       court_name:
                        //           "Three masked men barged into a businessman's office in broad daylight in Prayagraj and looted ₹ 6 lakh. The businessman was held at gunpoint in his office in Colonelganj area on Wednesday as the robbers started filling their bags with the cash.",
                        //       case_active: true,
                        //       activity_status: 2,
                        //       tracking: true,
                        //       action: "NA",
                        //       ticket_active: false,
                        //       court_data: 0,
                        //       client_side: null),
                        //   AllCasesModel(
                        //       case_id: 2143513,
                        //       case_no: "Robbery",
                        //       title: "Mumbai",
                        //       ndoh: DOH(
                        //           status: 1,
                        //           date: "Evening",
                        //           remarks: "Ongoing"),
                        //       region: "N",
                        //       loan_no: null,
                        //       pdoh: DOH(
                        //           status: 2,
                        //           date: "2022-06-02",
                        //           remarks: "Ongoing"),
                        //       stage: "Written Statement/ CC - CRIMINAL CASE",
                        //       client: null,
                        //       court: "District Consumer Forum Alwar Rajasthan",
                        //       city: "Delhi",
                        //       type: "CC - CRIMINAL CASE",
                        //       court_name:
                        //           "Three masked men barged into a businessman's office in broad daylight in Prayagraj and looted ₹ 6 lakh. The businessman was held at gunpoint in his office in Colonelganj area on Wednesday as the robbers started filling their bags with the cash.",
                        //       case_active: true,
                        //       activity_status: 2,
                        //       tracking: true,
                        //       action: "NA",
                        //       ticket_active: false,
                        //       court_data: 0,
                        //       client_side: null),
                        // ];
                        totalCount = cases!.length;

                        // print(cases![1].case_id);
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: cases.length,
                            controller: controller,
                            itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.only(
                                      bottom:
                                          index == cases!.length - 1 ? 60 : 0),
                                  child: SubmittedTipsCard(
                                    caseNumber: '${cases[index].case_no!}',
                                    complaint: cases[index].title!,
                                    court: cases[index].court_name!,
                                    caseStage: cases[index].stage!,
                                    pdoh: cases[index].pdoh!.date!,
                                    ndoh: cases[index].ndoh!.date!,
                                    ndohRemark: cases[index].ndoh!.remarks!,
                                    caseId: cases[index].case_id!,
                                    mediaURL: cases[index].mediaURL!,
                                    dateOfIncident:
                                        cases[index].dateOfIncident!,
                                    view: cases[index].view!,
                                  ),
                                ));
                      },
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
