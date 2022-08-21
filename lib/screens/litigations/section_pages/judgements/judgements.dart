import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/logic/bloc/daily_orders_bloc/daily_orders_bloc.dart';
import 'package:tip100/logic/bloc/judgements_bloc/judgements_bloc.dart';
import 'package:tip100/model/daily_orders_model.dart';
import 'package:tip100/screens/litigations/section_pages/judgements/internal_pages/judgements_entrypoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_defaults.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../model/judgements_model.dart';
import '../../../../size_config.dart';
import 'components/judgements_case_card.dart';
import 'components/judgements_dropdown.dart';
import 'components/judgements_header.dart';

class JudgementsPage extends StatefulWidget {
  const JudgementsPage({Key? key}) : super(key: key);

  @override
  State<JudgementsPage> createState() => _JudgementsPageState();
}

class _JudgementsPageState extends State<JudgementsPage> {
  String dropdownValue = "Judgements";
  int totalCount = 0;
  @override
  void initState() {
    context.read<JudgementsBloc>().add(JudgementsRefreshing());
    context.read<JudgementsBloc>().add(JudgementsGetInitialList());
    context.read<DailyOrdersBloc>().add(DailyOrdersRefreshing());
    context.read<DailyOrdersBloc>().add(DailyOrdersGetInitialList());
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
                JudgementsHeader(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding,
                      vertical: AppDefaults.padding / 4),
                  child: Row(
                    children: [
                      Text(
                        'Judgements',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: getProportionateScreenHeight(23),
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColorBlack),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        child: Text(
                          dropdownValue == 'Judgements'
                              ? ' (${context.watch<JudgementsBloc>().state.totalJudgements}+)'
                              : ' (${context.watch<DailyOrdersBloc>().state.totalDailyOrders}+)',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontSize: getProportionateScreenHeight(23),
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.appGrey),
                        ),
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
                                'Judgements',
                                'Daily Orders'
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
                    child: dropdownValue == 'Judgements'
                        ? Builder(builder: (context) {
                            List<Judgements>? judgements = [];
                            judgements = context
                                .watch<JudgementsBloc>()
                                .state
                                .judgements;
                            totalCount = context
                                .watch<JudgementsBloc>()
                                .state
                                .totalJudgements!;
                            if (context
                                    .watch<JudgementsBloc>()
                                    .state
                                    .noJudgementsFound ==
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
                                    .watch<JudgementsBloc>()
                                    .state
                                    .totalJudgements ==
                                0) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: judgements?.length,
                                  itemBuilder: (context, index) => CaseCard(
                                        caseNumber:
                                            '${judgements![index].caseNo}',
                                        dateOfOrder:
                                            '${judgements[index].dateOfOrder}',
                                        title:
                                            '${judgements[index].complainant} VS ${judgements[index].respondent}',
                                        court: '${judgements[index].courtName}',
                                        judgeName:
                                            "${judgements[index].judgeName}",
                                        pdfLink:
                                            "${judgements[index].orderPdfS3Url}",
                                        docLink:
                                            "${judgements[index].courtOrderLink}",
                                      ));
                            }
                          })
                        : Builder(builder: (context) {
                            List<DailyOrders>? dailyOrders = [];
                            dailyOrders = context
                                .watch<DailyOrdersBloc>()
                                .state
                                .dailyOrders;
                            totalCount = context
                                .watch<DailyOrdersBloc>()
                                .state
                                .totalDailyOrders!;
                            if (context
                                    .watch<DailyOrdersBloc>()
                                    .state
                                    .noDailyOrdersFound ==
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
                                    .watch<DailyOrdersBloc>()
                                    .state
                                    .totalDailyOrders ==
                                0) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: dailyOrders?.length,
                                  itemBuilder: (context, index) {
                                    // print('${causes?[index].caseNo!}');
                                    // return Container(
                                    //   height: 20,
                                    //   width: 20,
                                    //   color: Colors.red,
                                    // );
                                    return CaseCard(
                                      caseNumber:
                                          '${dailyOrders![index].caseNo}',
                                      dateOfOrder:
                                          '${dailyOrders[index].dateOfOrder}',
                                      title:
                                          '${dailyOrders[index].complainant} VS ${dailyOrders[index].respondent}',
                                      court: '${dailyOrders[index].courtName}',
                                      judgeName: "- -",
                                      pdfLink:
                                          "${dailyOrders[index].orderPdfS3Url}",
                                      docLink:
                                          "${dailyOrders[index].courtOrderLink}",
                                    );
                                  });
                            }
                          }),
                  ),
                ),
                // Expanded(
                //   child: SizedBox(
                //     // width: MediaQuery.of(context).size.width * 0.9,
                //     child: ListView.builder(
                //       shrinkWrap: true,
                //       itemCount: 5,
                //       itemBuilder: (context, index) => index == 4
                //           ? Padding(
                //               padding: EdgeInsets.only(bottom: 30),
                //               child: CaseCard(
                //                 caseNumber: 'MP04010165942022',
                //                 dateOfOrder: '01 Mar, 2022',
                //                 title:
                //                     'The State of Maharashtra vs Shaikh Juber Shaikh Shahid',
                //                 court:
                //                     'District & sessions Court, Bhopal Arera Hills ,Bhopal',
                //                 judgeName:
                //                     "Hon'ble Mr. Justice Hemant Gupta, Hon'ble Mr. Justice ..",
                //               ),
                //             )
                //           : const CaseCard(
                //             caseNumber: 'MP04010165942022',
                //             dateOfOrder: '01 Mar, 2022',
                //             title:
                //                 'The State of Maharashtra vs Shaikh Juber Shaikh Shahid',
                //             court:
                //                 'District & sessions Court, Bhopal Arera Hills ,Bhopal',
                //             judgeName:
                //                 "Hon'ble Mr. Justice Hemant Gupta, Hon'ble Mr. Justice ..",
                //           ),
                //     ),
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
