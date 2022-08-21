import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:tip100/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/components/dropdown_large.dart';
import '../../../../../../../core/components/text_field.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_defaults.dart';
import '../../../../../../../core/constants/app_icons.dart';
import '../../../../../../../logic/bloc/add_case_bloc/add_case_bloc.dart';
import '../../../../../../../logic/bloc/all_cases_filters_bloc/all_cases_filters_bloc.dart';
import '../../../../../../../logic/bloc/form_submission.dart';

class AllCasesTaskFilters extends StatefulWidget {
  const AllCasesTaskFilters({Key? key}) : super(key: key);

  @override
  _AllCasesTaskFiltersState createState() => _AllCasesTaskFiltersState();
}

class _AllCasesTaskFiltersState extends State<AllCasesTaskFilters> {
  bool active = false;
  bool activeStart = false;
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

  TextEditingController titleController = TextEditingController();
  TextEditingController caseTypeController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  @override
  void initState() {
    // selectedStartDate = context.watch<BasicGraphsBloc>().state.startDate!;
    // selectedEndDate = context.watch<BasicGraphsBloc>().state.endDate!;
    super.initState();
  }

  List typeMaps = [];
  List statusMaps = [];

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
      body: BlocListener<AddCaseBloc, AddCaseState>(
        listener: (context, state) {
          var current = state.formSubmissionStatus;
          if (current is SubmissionSuccess) {
            context.read<AddCaseBloc>().add(EventComplete());
            Navigator.pop(context);
          } else if (current is SubmissionFailed) {}
        },
        child: Builder(
          builder: (context) {
            // typeMaps = context.watch<AllCasesFiltersBloc>().state.case_type!;
            // statusMaps = context.watch<AllCasesFiltersBloc>().state.case_type!;

            typeMaps = [
              {'id': 'CL', 'name': 'Call'},
              {'id': 'MT', 'name': 'Meeting'},
              {'id': 'EM', 'name': 'Email'},
              {'id': 'PD', 'name': 'Pendency'},
              {'id': 'IN', 'name': 'Invoice'},
              {'id': 'CO', 'name': 'Conference'},
              {'id': 'OF', 'name': 'Office Visit'},
              {'id': 'OT', 'name': 'Other'},
              {'id': 'DO', 'name': 'Document'},
            ];
            List<String>? type = ['By Type'];
            caseTypeController.text = 'By Type';
            typeMaps.forEach((element) {
              type.add(element['name']);
            });
            statusMaps = [
              {'id': 'CO', 'name': 'Completed'},
              {'id': 'PE', 'name': 'Due'},
              {'id': 'CN', 'name': 'Cancelled'},
            ];
            List<String>? status = ['By Status'];
            statusController.text = 'By Status';
            statusMaps.forEach((element) {
              status.add(element['name']);
            });

            return Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              await _selectStartDate(context);
                              setState(() {
                                activeStart = true;
                              });
                              context.read<BasicGraphsBloc>().add(
                                  ChangeGraphsStartDate(
                                      startDate: selectedStartDate));
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
                                            ? 'Start Date'
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
                        Text('~',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: AppColors.appGrey)),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _selectEndDate(context);
                              setState(() {
                                active = true;
                              });
                              context.read<BasicGraphsBloc>().add(
                                  ChangeGraphsEndDate(
                                      endDate: selectedEndDate));
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
                                            ? 'End Date'
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
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDefaults.padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeDropdown(
                            dropdownValue: 'By Type',
                            values: type,
                            controller: caseTypeController,
                            label: 'By Type'),
                        AppLargeDropdown(
                            dropdownValue: 'By Status',
                            values: status,
                            controller: statusController,
                            label: 'By Status'),
                      ],
                    ),
                  ),
                ),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35.0, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                            });
                          },
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
                        InkWell(
                          onTap: () {
                            context
                                .read<BasicGraphsBloc>()
                                .add(RefreshingAllGraphs());
                            if (selectedIndex == 1)
                              context.read<BasicGraphsBloc>().add(
                                  ChangeGraphsDuration(
                                      durationSelected:
                                          BasicGraphsState().PAST30DAYSKEY));
                            else if (selectedIndex == 2)
                              context.read<BasicGraphsBloc>().add(
                                  ChangeGraphsDuration(
                                      durationSelected:
                                          BasicGraphsState().PAST6MONTHSKEY));
                            else if (selectedIndex == 3)
                              context.read<BasicGraphsBloc>().add(
                                  ChangeGraphsDuration(
                                      durationSelected:
                                          BasicGraphsState().PAST1YEARKEY));
                            else if (selectedIndex == 4)
                              context.read<BasicGraphsBloc>().add(
                                  ChangeGraphsDuration(
                                      durationSelected:
                                          BasicGraphsState().THISFYKEY));
                            else if (selectedIndex == 5)
                              context.read<BasicGraphsBloc>().add(
                                  ChangeGraphsDuration(
                                      durationSelected:
                                          BasicGraphsState().ALLTIMEKEY));
                            if (selectedStartDate != null)
                              context.read<BasicGraphsBloc>().add(
                                  ChangeGraphsStartDate(
                                      startDate: selectedStartDate));
                            if (selectedEndDate != null)
                              context.read<BasicGraphsBloc>().add(
                                  ChangeGraphsEndDate(
                                      endDate: selectedEndDate));
                            context
                                .read<BasicGraphsBloc>()
                                .add(BasicGraphsInitiate());
                            context
                                .read<BasicGraphsBloc>()
                                .add(PopulateRegionWiseGraph());
                            context
                                .read<BasicGraphsBloc>()
                                .add(PopulateCaseByAgainstGraph());
                            context
                                .read<BasicGraphsBloc>()
                                .add(PopulateProductWiseComplaintsGraph());
                            Navigator.pop(context);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 4,
                            color: selectedIndex != 0
                                ? AppColors.appBlue
                                : AppColors.appGrey,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Row(
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
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  int selectedIndex = 0;

  Widget selections(String title, int index, BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex == index ? selectedIndex = 0 : selectedIndex = index;
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
          color: !(selectedIndex == index) ? Colors.white : AppColors.primary,
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: AppColors.cardBorder, width: 2),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: !(selectedIndex == index)
                            ? Colors.black
                            : Colors.white,
                      ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: !(selectedIndex == index)
                      ? AppColors.primary
                      : Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
