import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/logic/bloc/case_explorer_bloc/case_explorer_bloc.dart';
import 'package:tip100/model/case_explorer_model.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/components/case_card.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/components/case_explorer_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../model/all_cases_model.dart';
import 'components/case_explorer_header.dart';

class CaseExplorerPage extends StatefulWidget {
  const CaseExplorerPage({Key? key}) : super(key: key);

  @override
  State<CaseExplorerPage> createState() => _CaseExplorerPageState();
}

class _CaseExplorerPageState extends State<CaseExplorerPage> {
  // final ItemScrollController _scrollController = ItemScrollController();
  int totalCount = 0;
  @override
  void initState() {
    context.read<CaseExplorerBloc>().add(CaseExplorerRefreshing());
    context.read<CaseExplorerBloc>().add(CaseExplorerGetInitialCases());
    // TODO: implement initState
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
                const CaseExplorerHeader(),
                const CaseExplorerDropdown(),
                Expanded(
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.9,
                    child: Builder(
                      builder: (context) {
                        List<AllCasesModel>? cases = [];
                        cases =
                            context.watch<CaseExplorerBloc>().state.all_cases;
                        totalCount =
                            context.watch<CaseExplorerBloc>().state.totalCases!;

                        if (context
                                .watch<CaseExplorerBloc>()
                                .state
                                .noCasesFound ==
                            true) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                  child: Image.asset(AppImages.searchPageUI)),
                              Center(
                                child: Text(
                                  'Unable to find requested case details',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: 17,
                                          // fontWeight: FontWeight.bold,
                                          color: AppColors.appGrey),
                                ),
                              ),
                            ],
                          );
                        } else if (context
                                .watch<CaseExplorerBloc>()
                                .state
                                .totalCases ==
                            0) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Container();
                          // return ListView.builder(
                          //
                          //     // itemScrollController: _scrollController,
                          //
                          //     shrinkWrap: true,
                          //     itemCount: cases?.length,
                          //     itemBuilder: (context, index) => CaseCard(
                          //         caseNumber: cases![index].cino.toString(),
                          //         caseId: cases[index].id!,
                          //         complaint: cases[index].complainant!,
                          //         court: cases[index].courtData!.name!,
                          //         respondent: cases[index].respondent!,
                          //         dof: cases[index].dateOfFiling!));
                        }
                      },
                    ),
                  ),
                ),
                // Expanded(
                //   child: SizedBox(
                //     // width: MediaQuery.of(context).size.width * 0.9,
                //     child: ListView.builder(
                //
                //         // itemScrollController: _scrollController,
                //
                //         shrinkWrap: true,
                //         itemCount: 5,
                //         itemBuilder: (context, index) => index == 4
                //             ? const Padding(
                //                 padding: EdgeInsets.only(bottom: 30),
                //                 child: CaseCard(
                //                     caseNumber: 'MP04010165942022 ',
                //                     complaint:
                //                         'State Bank of India (SBI) Through Branch Manager',
                //                     court: 'Dashrath Singh Meena',
                //                     respondent:
                //                         'District & sessions Court, Bhopal Arera Hills ,Bhopal / Bh..',
                //                     dof: '01 Mar, 2022'),
                //               )
                //             : const CaseCard(
                //                 caseNumber: 'MP04010165942022 ',
                //                 complaint:
                //                     'State Bank of India (SBI) Through Branch Manager',
                //                 court: 'Dashrath Singh Meena',
                //                 respondent:
                //                     'District & sessions Court, Bhopal Arera Hills ,Bhopal / Bh..',
                //                 dof: '01 Mar, 2022')),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
