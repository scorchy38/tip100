import 'dart:developer';

import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/case_explorer_bloc/case_explorer_bloc.dart';
import 'package:tip100/model/all_cases_model.dart';
import 'package:tip100/screens/home/components/bar_chart.dart';
import 'package:tip100/screens/litigations/components/litigations_sections.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/components/all_cases_dropdown.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/components/case_explorer_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../../../home/components/submitted_tips_card.dart';
import 'components/all_cases_card.dart';
import 'components/all_cases_header.dart';

class AllCasesPage extends StatefulWidget {
  const AllCasesPage({Key? key}) : super(key: key);

  @override
  State<AllCasesPage> createState() => _AllCasesPageState();
}

class _AllCasesPageState extends State<AllCasesPage> {
  final ScrollController controller = new ScrollController();
  int totalCount = 0;
  @override
  void initState() {
    //added the pagination function with listener
    context.read<CaseExplorerBloc>().add(CaseExplorerGetInitialCases());
    super.initState();
  }

  String dropdownValue = "Puducherry";

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
                SizedBox(
                  height: 20,
                ),
                // AllCasesHeader(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding,
                      vertical: AppDefaults.padding / 4),
                  child: Row(
                    children: [
                      Text(
                        'Happening Near You',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColorBlack),
                      ),
                      Spacer(),
                      Container(
                          height: 35,
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.primary,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(8)),
                          child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: AppColors.primary,
                              ),
                              items: <String>[
                                'Puducherry',
                                'Chennai',
                                'Noida',
                                'Mumbai'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          color: AppColors.textColorBlack,
                                          fontWeight: FontWeight.w500),
                                    ));
                              }).toList(),
                              onChanged: (String? newValue) {
                                // do something here

                                setState(() {
                                  dropdownValue = newValue ?? dropdownValue;
                                });
                              },
                              underline: DropdownButtonHideUnderline(
                                  child: Container(
                                width: 50,
                              ))))

                      // Spacer(),
                      // Container(
                      //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      //     decoration: BoxDecoration(
                      //         border: Border.all(
                      //             color: AppColors.purpleTag,
                      //             width: 1,
                      //             style: BorderStyle.solid),
                      //         borderRadius: BorderRadius.circular(8)),
                      //     child: DropdownButton<String>(
                      //         value: dropdownValue,
                      //         icon: Icon(
                      //           Icons.keyboard_arrow_down_outlined,
                      //           color: AppColors.purpleTag,
                      //         ),
                      //         items: <String>['Primary Cases', 'Pending Cases']
                      //             .map<DropdownMenuItem<String>>((String value) {
                      //           return DropdownMenuItem<String>(
                      //               value: value, child: Text(value));
                      //         }).toList(),
                      //         onChanged: (String? newValue) {
                      //           // do something here
                      //           setState(() {
                      //             dropdownValue = newValue ?? dropdownValue;
                      //           });
                      //         },
                      //         underline: DropdownButtonHideUnderline(
                      //             child: Container(
                      //           width: 50,
                      //         ))))
                    ],
                  ),
                ),
                // Expanded(
                //   child: SizedBox(
                //     // width: MediaQuery.of(context).size.width * 0.9,
                //     child: Builder(
                //       builder: (context) {
                //         List<AllCasesModel>? cases = [];
                //         cases = [
                //           AllCasesModel(
                //               case_id: 2143513,
                //               case_no: "Robbery",
                //               title: "Mumbai",
                //               ndoh: DOH(
                //                   status: 1,
                //                   date: "Evening",
                //                   remarks: "Ongoing"),
                //               region: "N",
                //               loan_no: null,
                //               pdoh: DOH(
                //                   status: 2,
                //                   date: "2022-06-02",
                //                   remarks: "Ongoing"),
                //               stage: "Written Statement/ CC - CRIMINAL CASE",
                //               client: null,
                //               court: "District Consumer Forum Alwar Rajasthan",
                //               city: "Delhi",
                //               type: "CC - CRIMINAL CASE",
                //               court_name:
                //                   "Three masked men barged into a businessman's office in broad daylight in Prayagraj and looted ₹ 6 lakh. The businessman was held at gunpoint in his office in Colonelganj area on Wednesday as the robbers started filling their bags with the cash.",
                //               case_active: true,
                //               activity_status: 2,
                //               tracking: true,
                //               action: "NA",
                //               ticket_active: false,
                //               court_data: 0,
                //               client_side: null),
                //           AllCasesModel(
                //               case_id: 2143513,
                //               case_no: "Robbery",
                //               title: "Mumbai",
                //               ndoh: DOH(
                //                   status: 1,
                //                   date: "Evening",
                //                   remarks: "Ongoing"),
                //               region: "N",
                //               loan_no: null,
                //               pdoh: DOH(
                //                   status: 2,
                //                   date: "2022-06-02",
                //                   remarks: "Ongoing"),
                //               stage: "Written Statement/ CC - CRIMINAL CASE",
                //               client: null,
                //               court: "District Consumer Forum Alwar Rajasthan",
                //               city: "Delhi",
                //               type: "CC - CRIMINAL CASE",
                //               court_name:
                //                   "Three masked men barged into a businessman's office in broad daylight in Prayagraj and looted ₹ 6 lakh. The businessman was held at gunpoint in his office in Colonelganj area on Wednesday as the robbers started filling their bags with the cash.",
                //               case_active: true,
                //               activity_status: 2,
                //               tracking: true,
                //               action: "NA",
                //               ticket_active: false,
                //               court_data: 0,
                //               client_side: null),
                //         ];
                //         totalCount = cases.length;
                //
                //         // print(cases![1].case_id);
                //         return ListView.builder(
                //             shrinkWrap: true,
                //             itemCount: cases.length,
                //             controller: controller,
                //             itemBuilder: (context, index) => Padding(
                //                   padding: EdgeInsets.only(
                //                       bottom:
                //                           index == cases!.length - 1 ? 60 : 0),
                //                   child: CaseCard(
                //                     caseNumber:
                //                         '${cases[index].case_no!}  $index',
                //                     complaint: cases[index].title!,
                //                     court: cases[index].court_name!,
                //                     caseStage: cases[index].stage!,
                //                     pdoh: cases[index].pdoh!.date!,
                //                     ndoh: cases[index].ndoh!.date!,
                //                     ndohRemark: cases[index].ndoh!.remarks!,
                //                     caseId: cases[index].case_id!,
                //                   ),
                //                 ));
                //       },
                //     ),
                //   ),
                // ),
                Expanded(
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.9,
                    child: Builder(
                      builder: (context) {
                        List<AllCasesModel>? cases = [];
                        cases =
                            context.watch<CaseExplorerBloc>().state.all_cases;
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
                        cases.forEach((element) {
                          print("isAlert");
                          print(element.city);
                        });
                        // print(cases![1].case_id);
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: cases
                                .where((element) => element.city == 1)
                                .length,
                            controller: controller,
                            itemBuilder: (context, index) {
                              log(cases![index].city.toString());
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: index == cases.length - 1 ? 60 : 0),
                                child: CaseCard(
                                  caseNumber: '${cases[index].case_no!}',
                                  complaint: cases[index].title!,
                                  court: cases[index].court_name!,
                                  caseStage: cases[index].stage!,
                                  pdoh: cases[index].pdoh!.date!,
                                  ndoh: cases[index].ndoh!.date!,
                                  ndohRemark: cases[index].ndoh!.remarks!,
                                  caseId: cases[index].case_id!,
                                  mediaURL: cases[index].mediaURL!,
                                  dateOfIncident: cases[index].dateOfIncident!,
                                ),
                              );
                            });
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
