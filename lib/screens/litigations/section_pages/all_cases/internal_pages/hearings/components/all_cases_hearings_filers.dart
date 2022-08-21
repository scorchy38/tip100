import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:tip100/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../core/components/text_field.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_icons.dart';

class AllCasesHearingFilters extends StatefulWidget {
  const AllCasesHearingFilters({Key? key}) : super(key: key);

  @override
  _AllCasesHearingFiltersState createState() => _AllCasesHearingFiltersState();
}

class _AllCasesHearingFiltersState extends State<AllCasesHearingFilters> {
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

  @override
  void initState() {
    // selectedStartDate = context.watch<BasicGraphsBloc>().state.startDate!;
    // selectedEndDate = context.watch<BasicGraphsBloc>().state.endDate!;
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
      body: Column(
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
                        context
                            .read<BasicGraphsBloc>()
                            .add(ChangeGraphsEndDate(endDate: selectedEndDate));
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
          // const SizedBox(
          //   height: 10,
          // ),
          Padding(
            padding: const EdgeInsets.only(
                top: 20.0, left: 20, bottom: 15, right: 20),
            child: Container(
                height: 45,
                child: AppTextField(
                    false, titleController, 'By Hearing Status', 1)),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3.5,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 10),
                children: [
                  selections('Added Automatically', 1, context),
                  selections('Added Manually', 2, context),
                ],
              ),
            ),
          ),
          Container(
            height: getProportionateScreenHeight(96),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(0.4))
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15),
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
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
                        context
                            .read<BasicGraphsBloc>()
                            .add(ChangeGraphsEndDate(endDate: selectedEndDate));
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
