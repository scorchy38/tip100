import 'package:tip100/core/components/dropdown.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_filters_bloc/all_cases_filters_bloc.dart';
import 'package:tip100/logic/bloc/cause_list_free_text_bloc/cause_list_free_text_bloc.dart';
import 'package:tip100/logic/bloc/cause_list_pdf_bloc/cause_list_pdf_bloc.dart';
import 'package:tip100/logic/bloc/daily_orders_bloc/daily_orders_bloc.dart';
import 'package:tip100/logic/bloc/judgements_bloc/judgements_bloc.dart';
import 'package:tip100/logic/cubit/switch_cubit.dart';
import 'package:tip100/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_defaults.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../logic/bloc/cause_list_filters_bloc/cause_list_filters_bloc.dart';

class JudgementsFilters extends StatefulWidget {
  const JudgementsFilters({Key? key}) : super(key: key);

  @override
  _JudgementsFiltersState createState() => _JudgementsFiltersState();
}

class _JudgementsFiltersState extends State<JudgementsFilters> {
  bool active = false;
  bool activeStart = false;
  bool filterSelected = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController cnrController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController judgeController = TextEditingController();
  TextEditingController courtController = TextEditingController();
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedStartDate ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedStartDate) {
      setState(() {
        selectedStartDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedEndDate ?? DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedEndDate) {
      setState(() {
        selectedEndDate = picked;
      });
    }
  }

  int court = MAXINT;
  List courtMaps = [
    {'name': 'Consumer Court', 'id': 1},
    {'name': 'District Court', 'id': 2},
    {'name': 'High Court', 'id': 3},
    {'name': 'Delhi High Court', 'id': 5},
    {'name': 'Karnataka High Court', 'id': 8},
    {'name': 'Mumbai High Court', 'id': 6},
    {'name': 'Madhya Pradesh High Court', 'id': 13},
    {'name': 'NGT', 'id': 9},
    {'name': 'Supreme Court of India', 'id': 11},
    {'name': 'DRT', 'id': 12},
    {'name': 'CAT', 'id': 14},
    {'name': 'Income Tax', 'id': 16},
    {'name': 'NCLT', 'id': 18},
    {'name': 'APTEL', 'id': 20},
    {'name': 'NCLAT', 'id': 24},
  ];
  @override
  void initState() {
    // stateController.text.compareTo('By State') != 0||  courtController.text.compareTo('By Court') != 0||  titleController.text.length > 0||caseTypeController.text.compareTo('By Case Type') != 0||caseStageController.text.compareTo('By Case Stage') != 0||caseManagerController.text.compareTo('By Case Manager') != 0
    // titleController.addListener(() {
    //   setState(() {});
    //   if (titleController.text.length > 0)
    //     context.read<SwitchCubit>().increase('Title');
    //   else
    //     context.read<SwitchCubit>().decrease('Title');
    // });
    // caseTypeController.addListener(() {
    //   filterSelected = caseTypeController.text.compareTo('By Case Type') != 0;
    //
    //   setState(() {});
    // });
    // caseStageController.addListener(() {
    //   setState(() {});
    //
    //   filterSelected = caseStageController.text.compareTo('By Case Stage') != 0;
    // });
    // caseManagerController.addListener(() {
    //   setState(() {});
    //   filterSelected =
    //       caseManagerController.text.compareTo('By Case Manager') != 0;
    // });
    // courtController.addListener(() {
    //   setState(() {});
    //   filterSelected = courtController.text.compareTo('By Court') != 0;
    // });
    // stateController.addListener(() {
    //   setState(() {});
    //   filterSelected = stateController.text.compareTo('By State') != 0;
    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Search & Filters',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 20),
            child: SvgPicture.asset(
              AppIcons.close,
              color: Colors.black,
              height: 15,
              width: 15,
            ),
          ),
        ),
      ),
      body: Builder(
        builder: (context) {
          List<String>? judge = ['By Judge Name'];
          judgeController.text = 'By Judge Name';
          // context.watch<JudgementsFiltersBloc>().state.bench?.forEach((element) {
          //   judge.add(element);
          // });

          List<String>? courts = ['By Court Name'];
          courtController.text = 'By Court Name';
          courtMaps.forEach((element) {
            courts.add(element['name']);
          });

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                child: Container(
                    height: 45,
                    child: AppTextField(
                        false, titleController, 'Search By Case No/CNR', 1)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 20, bottom: 15, right: 20),
                child: Container(
                    height: 45,
                    child: AppTextField(
                        false, titleController, 'Search By Title', 1)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 5),
                child: GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4,
                      mainAxisSpacing: 15),
                  children: [
                    // SizedBox(
                    //   height: 50,
                    //   child: Expanded(
                    //     child: InkWell(
                    //       onTap: () async {
                    //         await _selectStartDate(context);
                    //         setState(() {
                    //           activeStart = true;
                    //         });
                    //       },
                    //       child: Container(
                    //         decoration: BoxDecoration(boxShadow: [
                    //           BoxShadow(
                    //               color: AppColors.primary.withOpacity(0.05),
                    //               spreadRadius: 1,
                    //               blurRadius: 5)
                    //         ]),
                    //         child: Card(
                    //           // elevation: 3,
                    //           shadowColor: Colors.transparent,
                    //           shape: const RoundedRectangleBorder(
                    //               borderRadius:
                    //                   BorderRadius.all(Radius.circular(10))),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(11),
                    //             child: Row(
                    //               children: [
                    //                 Text(
                    //                   selectedStartDate == null
                    //                       ? 'By Hearing Date(F)'
                    //                       : '${selectedStartDate!.day}/${selectedStartDate!.month}/${selectedStartDate!.year}',
                    //                   style: Theme.of(context)
                    //                       .textTheme
                    //                       .bodyLarge
                    //                       ?.copyWith(
                    //                         color: !activeStart
                    //                             ? AppColors.appGrey
                    //                             : Colors.black,
                    //                       ),
                    //                 ),
                    //                 Spacer(),
                    //                 SvgPicture.asset(AppIcons.calendar2,
                    //                     color: !activeStart
                    //                         ? AppColors.tertiary
                    //                         : AppColors.primary)
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 50,
                    //   child: Expanded(
                    //     child: InkWell(
                    //       onTap: () async {
                    //         await _selectEndDate(context);
                    //         setState(() {
                    //           active = true;
                    //         });
                    //       },
                    //       child: Container(
                    //         decoration: BoxDecoration(boxShadow: [
                    //           BoxShadow(
                    //               color: AppColors.primary.withOpacity(0.05),
                    //               spreadRadius: 1,
                    //               blurRadius: 5)
                    //         ]),
                    //         child: Card(
                    //           // elevation: 3,
                    //           shadowColor: Colors.transparent,
                    //           shape: const RoundedRectangleBorder(
                    //               borderRadius:
                    //                   BorderRadius.all(Radius.circular(10))),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(11),
                    //             child: Row(
                    //               children: [
                    //                 Text(
                    //                   selectedEndDate == null
                    //                       ? 'By Hearing Date(U)'
                    //                       : '${selectedEndDate!.day}/${selectedEndDate!.month}/${selectedEndDate!.year}',
                    //                   style: Theme.of(context)
                    //                       .textTheme
                    //                       .bodyLarge
                    //                       ?.copyWith(
                    //                         color: !active
                    //                             ? AppColors.appGrey
                    //                             : Colors.black,
                    //                       ),
                    //                 ),
                    //                 Spacer(),
                    //                 SvgPicture.asset(
                    //                   AppIcons.calendar2,
                    //                   color: !active
                    //                       ? AppColors.tertiary
                    //                       : AppColors.primary,
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    AppDropdown('By Court Name', courts, courtController,
                        'By Court Name'),
                    AppDropdown('By Judge Name', judge, judgeController,
                        'By Judge Name'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            await _selectStartDate(context);
                            setState(() {
                              activeStart = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: AppColors.primary.withOpacity(0.05),
                                  spreadRadius: 1,
                                  blurRadius: 5)
                            ]),
                            child: Card(
                              // elevation: 3,
                              shadowColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(11),
                                child: Row(
                                  children: [
                                    Text(
                                      selectedStartDate == null
                                          ? 'By Hearing Date(F)'
                                          : '${selectedStartDate!.day}/${selectedStartDate!.month}/${selectedStartDate!.year}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: !activeStart
                                                ? AppColors.appGrey
                                                : Colors.black,
                                          ),
                                    ),
                                    Spacer(),
                                    SvgPicture.asset(AppIcons.calendar2,
                                        color: !activeStart
                                            ? AppColors.tertiary
                                            : AppColors.primary)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(' ~ ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColors.appGrey)),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            await _selectEndDate(context);
                            setState(() {
                              active = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: AppColors.primary.withOpacity(0.05),
                                  spreadRadius: 1,
                                  blurRadius: 5)
                            ]),
                            child: Card(
                              // elevation: 3,
                              shadowColor: Colors.transparent,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(11),
                                child: Row(
                                  children: [
                                    Text(
                                      selectedEndDate == null
                                          ? 'By Hearing Date(U)'
                                          : '${selectedEndDate!.day}/${selectedEndDate!.month}/${selectedEndDate!.year}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: !active
                                                ? AppColors.appGrey
                                                : Colors.black,
                                          ),
                                    ),
                                    Spacer(),
                                    SvgPicture.asset(
                                      AppIcons.calendar2,
                                      color: !active
                                          ? AppColors.tertiary
                                          : AppColors.primary,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: 50,
              //   // width: getProportionateScreenWidth(320),
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(horizontal: 20),
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child: InkWell(
              //             onTap: () {
              //               setState(() {
              //                 activeStart = true;
              //                 active = false;
              //               });
              //             },
              //             child: Container(
              //               decoration: BoxDecoration(boxShadow: [
              //                 BoxShadow(
              //                     color: AppColors.primary.withOpacity(0.05),
              //                     spreadRadius: 1,
              //                     blurRadius: 5)
              //               ]),
              //               child: Card(
              //                 // elevation: 3,
              //                 // shadowColor: AppColors.primary,
              //                 shape: const RoundedRectangleBorder(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(10))),
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(11),
              //                   child: Row(
              //                     children: [
              //                       Container(
              //                         width: getProportionateScreenWidth(108),
              //                         child: Text(
              //                           'By Hearing Date(F)',
              //                           style: Theme.of(context)
              //                               .textTheme
              //                               .bodyLarge
              //                               ?.copyWith(
              //                                   color: !activeStart
              //                                       ? AppColors.appGrey
              //                                       : Colors.black,
              //                                   fontSize:
              //                                       getProportionateScreenWidth(
              //                                           13)),
              //                         ),
              //                       ),
              //                       SvgPicture.asset(AppIcons.calendar2,
              //                           color: !activeStart
              //                               ? AppColors.tertiary
              //                               : AppColors.primary)
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //         SizedBox(
              //           width: 15,
              //           child: Center(
              //             child: Text('~',
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .bodyLarge
              //                     ?.copyWith(color: AppColors.appGrey)),
              //           ),
              //         ),
              //         Expanded(
              //           child: InkWell(
              //             onTap: () {
              //               setState(() {
              //                 active = true;
              //                 activeStart = false;
              //               });
              //             },
              //             child: Container(
              //               decoration: BoxDecoration(boxShadow: [
              //                 BoxShadow(
              //                     color: AppColors.primary.withOpacity(0.05),
              //                     spreadRadius: 1,
              //                     blurRadius: 5)
              //               ]),
              //               child: Card(
              //                 // elevation: 3,
              //                 // shadowColor: AppColors.primary,
              //                 shape: const RoundedRectangleBorder(
              //                     borderRadius:
              //                         BorderRadius.all(Radius.circular(10))),
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(11),
              //                   child: Row(
              //                     children: [
              //                       Container(
              //                         width: getProportionateScreenWidth(108),
              //                         child: Text(
              //                           'By Hearing Date(U)',
              //                           style: Theme.of(context)
              //                               .textTheme
              //                               .bodyLarge
              //                               ?.copyWith(
              //                                   color: !active
              //                                       ? AppColors.appGrey
              //                                       : Colors.black,
              //                                   fontSize:
              //                                       getProportionateScreenWidth(
              //                                           12)),
              //                         ),
              //                       ),
              //                       SvgPicture.asset(
              //                         AppIcons.calendar2,
              //                         color: !active
              //                             ? AppColors.tertiary
              //                             : AppColors.primary,
              //                       )
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 20.0, right: 5),
              //     child: GridView(
              //       gridDelegate:
              //           const SliverGridDelegateWithFixedCrossAxisCount(
              //               crossAxisCount: 2,
              //               childAspectRatio: 4,
              //               mainAxisSpacing: 10),
              //       children: [
              //         AppDropdown(
              //             'All Filters',
              //             const <String>[
              //               'All Filters',
              //               'CaseType1',
              //               'CaseType2',
              //               'CaseType3'
              //             ],
              //             TextEditingController(),
              //             'All Filters'),
              //         AppDropdown(
              //             'By Entity',
              //             const <String>[
              //               'By Entity',
              //               'CaseType1',
              //               'CaseType2',
              //               'CaseType3'
              //             ],
              //             TextEditingController(),
              //             'By Entity'),
              //       ],
              //     ),
              //   ),
              // ),
              Spacer(),
              Container(
                height: getProportionateScreenHeight(96),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5, color: Colors.black.withOpacity(0.4))
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            active = false;
                            activeStart = false;
                          });

                          titleController.clear();
                          judgeController.clear();
                          courtController.clear();
                          startDateController.clear();
                          endDateController.clear();

                          context
                              .read<JudgementsBloc>()
                              .add(JudgementsGetInitialList());

                          context
                              .read<DailyOrdersBloc>()
                              .add(DailyOrdersGetInitialList());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Clear All',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: AppColors.appGrey,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                          ),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          // bool selectedFilters = context
                          //     .watch<JudgementsFiltersBloc>()
                          //     .state
                          //     .filter_activated!;
                          return InkWell(
                            onTap: () async {
                              context
                                  .read<JudgementsBloc>()
                                  .add(JudgementsRefreshing());
                              context
                                  .read<DailyOrdersBloc>()
                                  .add(DailyOrdersRefreshing());
                              setState(() {
                                courtMaps.forEach((element) {
                                  if (element['name'] == courtController.text)
                                    court = element['id'];
                                });
                              });

                              context
                                  .read<JudgementsBloc>()
                                  .add(JudgementsImplementingFilters());
                              context
                                  .read<DailyOrdersBloc>()
                                  .add(DailyOrdersImplementingFilters());

                              context.read<JudgementsBloc>().add(
                                  JudgementsGetFilteredResults(
                                      title: titleController.text,
                                      cnr: cnrController.text,
                                      startDate: selectedStartDate,
                                      court: court,
                                      endDate: selectedEndDate));
                              context.read<DailyOrdersBloc>().add(
                                  DailyOrdersGetFilteredResults(
                                      title: titleController.text,
                                      cnr: cnrController.text,
                                      startDate: selectedStartDate,
                                      court: court,
                                      endDate: selectedEndDate));
                              // context.read<CauseListFreeTextBloc>().add(
                              //     CauseListFreeTextGetFilteredResults(
                              //         startDate: selectedStartDate,
                              //         endDate: selectedEndDate));

                              // context.read<CauseListFreeTextBloc>().add(
                              //     CauseListFreeTextGetFilteredResults(
                              //         title: titleController.text,
                              //         type: type,
                              //         state: state,
                              //         court: court,
                              //         stage: stage,
                              //         manager: manager));
                              context
                                  .read<JudgementsBloc>()
                                  .add(JudgementsFiltersImplemented());
                              context
                                  .read<DailyOrdersBloc>()
                                  .add(DailyOrdersFiltersImplemented());
                              Navigator.pop(context);
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 4,
                              color: (activeStart ||
                                      active ||
                                      titleController.text.length > 0 ||
                                      context
                                              .watch<SwitchCubit>()
                                              .state
                                              .filtersSelected
                                              .length >
                                          0)
                                  ? AppColors.appBlue
                                  : AppColors.appGrey,
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: context.watch<AllCasesBloc>().state
                                        is AllCasesImplementingFilters
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : Row(
                                        children: [
                                          Text(
                                            'Apply Filters',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    color: AppColors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: AppColors.white,
                                            size: 20,
                                          )
                                        ],
                                      ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
