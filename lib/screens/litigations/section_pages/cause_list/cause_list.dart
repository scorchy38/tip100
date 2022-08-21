import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/logic/bloc/cause_list_free_text_bloc/cause_list_free_text_bloc.dart';
import 'package:tip100/logic/bloc/cause_list_pdf_bloc/cause_list_pdf_bloc.dart';
import 'package:tip100/model/cause_list_free_text_model.dart';
import 'package:tip100/model/cause_list_pdf_model.dart';
import 'package:tip100/screens/home/components/bar_chart.dart';
import 'package:tip100/screens/litigations/components/litigations_sections.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/components/all_cases_dropdown.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/components/case_explorer_dropdown.dart';
import 'package:tip100/screens/litigations/section_pages/cause_list/components/cause_list_dropdown.dart';
import 'package:tip100/screens/litigations/section_pages/cause_list/internal_pages/cause_list_entrypoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/cause_list_free_text_card.dart';
import 'components/cause_list_pdf_card.dart';
import 'components/cause_list_header.dart';

class CauseListPage extends StatefulWidget {
  const CauseListPage({Key? key}) : super(key: key);

  @override
  State<CauseListPage> createState() => _CauseListPageState();
}

class _CauseListPageState extends State<CauseListPage> {
  String dropdownValue = "PDF";
  int totalCount = 0;
  @override
  void initState() {
    context.read<CauseListPDFBloc>().add(CauseListPDFRefreshing());
    context.read<CauseListPDFBloc>().add(CauseListPDFGetInitialCauses());
    context.read<CauseListFreeTextBloc>().add(CauseListFreeTextRefreshing());
    context
        .read<CauseListFreeTextBloc>()
        .add(CauseListFreeTextGetInitialCauses());
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
                CauseListHeader(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding,
                      vertical: AppDefaults.padding / 4),
                  child: Row(
                    children: [
                      Text(
                        'Cause List',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColorBlack),
                      ),
                      Text(
                        dropdownValue == 'PDF'
                            ? ' (${context.watch<CauseListPDFBloc>().state.totalCauses}+)'
                            : ' (${context.watch<CauseListFreeTextBloc>().state.totalCauses}+)',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: AppColors.appGrey),
                      ),
                      Spacer(),
                      Container(
                          height: 35,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: AppColors.purpleTag,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(8)),
                          child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: AppColors.purpleTag,
                              ),
                              items: <String>[
                                'PDF',
                                'Free Text'
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
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.9,
                    child: dropdownValue == 'PDF'
                        ? Builder(builder: (context) {
                            List<CauseListPDF>? causes = [];
                            causes = context
                                .watch<CauseListPDFBloc>()
                                .state
                                .causeList;
                            totalCount = context
                                .watch<CauseListPDFBloc>()
                                .state
                                .totalCauses!;
                            if (context
                                    .watch<CauseListPDFBloc>()
                                    .state
                                    .noCausesFound ==
                                true) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                      child:
                                          Image.asset(AppImages.searchPageUI)),
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
                                    .watch<CauseListPDFBloc>()
                                    .state
                                    .totalCauses ==
                                0) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              // return Container();
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: causes?.length,
                                  itemBuilder: (context, index) => CaseCardPDF(
                                        date: '${causes?[index].causeDate!}',
                                        court: '${causes?[index].courtName!}',
                                        bench: '${causes?[index].benchName!}',
                                        title: '${causes?[index].description!}',
                                        pdfLink: '${causes?[index].pdfLink!}',
                                      ));
                            }
                          })
                        : Builder(builder: (context) {
                            List<CauseListFreeText>? causes = [];
                            causes = context
                                .watch<CauseListFreeTextBloc>()
                                .state
                                .causeList;
                            totalCount = context
                                .watch<CauseListFreeTextBloc>()
                                .state
                                .totalCauses!;
                            if (context
                                    .watch<CauseListFreeTextBloc>()
                                    .state
                                    .noCausesFound ==
                                true) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Center(
                                      child:
                                          Image.asset(AppImages.searchPageUI)),
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
                                    .watch<CauseListFreeTextBloc>()
                                    .state
                                    .totalCauses ==
                                0) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: causes?.length,
                                  itemBuilder: (context, index) {
                                    // print('${causes?[index].caseNo!}');
                                    // return Container(
                                    //   height: 20,
                                    //   width: 20,
                                    //   color: Colors.red,
                                    // );
                                    return CaseCardFreeText(
                                      caseNumber:
                                          '${causes![index].caseNo ?? ''}',
                                      section: '${causes[index].section ?? ''}',
                                      title:
                                          '${causes[index].complainant ?? ''} VS ${causes[index].respondent ?? ''}',
                                      court: '${causes[index].courtName ?? ''}',
                                      bench:
                                          '${causes[index].benchName ?? '- -'}',
                                      purpose:
                                          '${causes[index].purpose ?? '- -'}',
                                      ongoing: causes[index].isActive ?? false,
                                    );
                                  });
                            }
                          }),
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
