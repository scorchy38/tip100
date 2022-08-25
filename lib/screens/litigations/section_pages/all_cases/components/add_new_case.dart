import 'package:tip100/core/components/dropdown.dart';
import 'package:tip100/core/components/dropdown_large.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_filters_bloc/all_cases_filters_bloc.dart';
import 'package:tip100/logic/bloc/form_submission.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../size_config.dart';

class AddNewCase extends StatefulWidget {
  const AddNewCase({Key? key}) : super(key: key);

  @override
  _AddNewCaseState createState() => _AddNewCaseState();
}

class _AddNewCaseState extends State<AddNewCase> {
  TextEditingController titleController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController caseTypeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController courtController = TextEditingController();
  int type = MAXINT, court = MAXINT, city = MAXINT;
  String priority = 'NULL';
  List typeMaps = [], courtMaps = [], cityMaps = [], priorityMaps = [];
  bool submitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text(
          'Add New Case',
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
            padding: const EdgeInsets.all(20.0),
            child: SvgPicture.asset(
              AppIcons.close,
              color: Colors.black,
              height: 15,
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
        child: Builder(builder: (context) {
          courtMaps = context.watch<AllCasesFiltersBloc>().state.court!;
          typeMaps = context.watch<AllCasesFiltersBloc>().state.case_type!;
          cityMaps = [
            {'id': 5856, 'name': 'Delhi'}
          ];
          priorityMaps = [
            {'id': 'H', 'name': 'High'},
            {'id': 'M', 'name': 'Medium'},
            {'id': 'L', 'name': 'Low'}
          ];
          List<String>? caseType = ['Case Type'];
          caseTypeController.text = 'Case Type';
          typeMaps.forEach((element) {
            caseType.add(element['name']);
          });

          List<String>? courts = ['Court'];
          courtController.text = 'Court';
          courtMaps.forEach((element) {
            courts.add(element['name']);
          });

          List<String>? cities = ['City'];
          cityController.text = 'City';
          cityMaps.forEach((element) {
            cities.add(element['name']);
          });

          List<String>? priorities = ['Priority'];
          priorityController.text = 'Priority';
          priorityMaps.forEach((element) {
            priorities.add(element['name']);
          });
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: AppDefaults.padding,
                        top: AppDefaults.padding,
                        right: AppDefaults.padding),
                    child: AppTextField(
                      false,
                      titleController,
                      'Case Title',
                      1.2,
                      onChanged: (value) {
                        context
                            .read<AddCaseBloc>()
                            .add(EventAddTitle(title: value!));
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDefaults.padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeDropdown(
                            dropdownValue: 'Case Type',
                            values: caseType,
                            controller: caseTypeController,
                            label: 'Case Type'),
                        AppLargeDropdown(
                            dropdownValue: 'Court',
                            values: courts,
                            controller: courtController,
                            label: 'Court'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDefaults.padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //City //Priority
                        AppLargeDropdown(
                            dropdownValue: 'City',
                            values: cities,
                            controller: cityController,
                            label: 'City'),
                        AppLargeDropdown(
                            dropdownValue: 'Priority',
                            values: priorities,
                            controller: priorityController,
                            label: 'Priority'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDefaults.padding),
                    child: AppTextField(
                      false,
                      summaryController,
                      'Summary',
                      5,
                      onChanged: (value) {
                        context
                            .read<AddCaseBloc>()
                            .add(EventAddDescription(description: value!));
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
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
                          // context.read<AddCaseBloc>().add(EventSubmitted());
                          setState(() {});
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
                        onTap: () async {
                          if (context.read<AddCaseBloc>().state.title.length >
                                  2 &&
                              context
                                      .read<AddCaseBloc>()
                                      .state
                                      .description
                                      .length >
                                  2)
                            setState(() {
                              submitting = !submitting;
                            });
                          setState(() {
                            cityMaps.forEach((element) {
                              if (element['name'] == cityController.text)
                                city = element['id'];
                            });
                            typeMaps.forEach((element) {
                              if (element['name'] == caseTypeController.text)
                                type = element['id'];
                            });
                            courtMaps.forEach((element) {
                              if (element['name'] == courtController.text)
                                court = element['id'];
                            });
                            if (priority != 'Priority')
                              priorityMaps.forEach((element) {
                                if (element['name'] == priorityController.text)
                                  priority = element['id'];
                              });
                            else
                              priority = 'NULL';
                          });
                          context
                              .read<AddCaseBloc>()
                              .add(EventAddCaseType(case_type: type));
                          context
                              .read<AddCaseBloc>()
                              .add(EventAddCourt(court: court));
                          context
                              .read<AddCaseBloc>()
                              .add(EventAddCity(city: city));
                          context
                              .read<AddCaseBloc>()
                              .add(EventAddPriority(priority: priority));
                          // context.read<AddCaseBloc>().add(EventSubmitted());
                          setState(() {});
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 4,
                          color:
                              (context.read<AddCaseBloc>().state.title.length >
                                          2 &&
                                      context
                                              .read<AddCaseBloc>()
                                              .state
                                              .description
                                              .length >
                                          2)
                                  ? AppColors.appBlue
                                  : AppColors.appGrey,
                          child: submitting == true
                              ? Container(
                                  width: 95,
                                  height: 45,
                                  child: Center(
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: Colors.transparent,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Text(
                                    'Add Case',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
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
        }),
      ),
    );
  }
}
