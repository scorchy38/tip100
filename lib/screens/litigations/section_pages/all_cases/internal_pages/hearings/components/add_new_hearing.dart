import 'dart:convert';

import 'package:tip100/core/components/dropdown.dart';
import 'package:tip100/core/components/dropdown_large.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/logic/bloc/add_hearing_bloc/add_hearing_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_filters_bloc/all_cases_filters_bloc.dart';
import 'package:tip100/logic/bloc/form_submission.dart';
import 'package:tip100/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AddNewHearing extends StatefulWidget {
  int caseId;
  AddNewHearing(this.caseId, {Key? key}) : super(key: key);

  @override
  _AddNewHearingState createState() => _AddNewHearingState();
}

class _AddNewHearingState extends State<AddNewHearing> {
  bool active = false;
  bool activeStart = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController date_of_hearingController = TextEditingController();
  TextEditingController hearing_statusController = TextEditingController();
  TextEditingController hearing_stageController = TextEditingController();
  TextEditingController hearing_descriptionController = TextEditingController();
  TextEditingController courtController = TextEditingController();
  DateTime? selectedEndDate;

  int type = MAXINT, court = MAXINT, hearing_stage = MAXINT;
  String hearing_description = 'NULL';
  String hearing_status = 'NULL';
  List typeMaps = [],
      courtMaps = [],
      hearing_stageMaps = [],
      hearing_statusMaps = [];
  bool submitting = false;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text(
          'Add New Hearing',
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
      body: BlocListener<AddHearingBloc, AddHearingState>(
        listener: (context, state) {
          var current = state.formSubmissionStatus;
          if (current is SubmissionSuccess) {
            context.read<AddHearingBloc>().add(EventComplete());
            Navigator.pop(context);
          } else if (current is SubmissionFailed) {
            print('Failed');
          }
        },
        child: Builder(builder: (context) {
          courtMaps = context.watch<AllCasesFiltersBloc>().state.court!;
          typeMaps = context.watch<AllCasesFiltersBloc>().state.case_type!;
          hearing_stageMaps = [
            {"id": 16187, "name": "comply Order, OA"},
            {"id": 10921, "name": "FRESH MATTERS, OA"},
            {"id": 10922, "name": "HEARING, OA"},
            {"id": 10923, "name": "Pleading Stage, OA"},
            {"id": 10950, "name": "DIRECTIONS REGULAR MATTERS, OA"},
            {"id": 10948, "name": "OA CASES, OA"},
            {"id": 10955, "name": "Disposed, OA"},
            {"id": 10966, "name": "For the same purpose, OA"},
            {"id": 11131, "name": "Adjourned for same purpose., OA"},
            {"id": 11219, "name": "MISCELLANEOUS, OA"}
          ];
          hearing_statusMaps = [
            {'id': 'DU', 'name': 'Due'},
            {'id': 'CO', 'name': 'Complete'},
            {'id': 'FC', 'name': 'Failure due to court'},
            {'id': 'FO', 'name': 'Failure due to organisation'},
            {'id': 'FI', 'name': 'Failure due to internal reasons'}
          ];

          List<String>? stages = ['Hearing Stage'];
          hearing_stageController.text = 'Hearing Stage';
          hearing_stageMaps.forEach((element) {
            stages.add(element['name']);
          });

          List<String>? statuses = ['Hearing Status'];
          hearing_statusController.text = 'Hearing Status';
          hearing_statusMaps.forEach((element) {
            statuses.add(element['name']);
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
                            .read<AddHearingBloc>()
                            .add(EventAddTitle(title: value!));
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                              dropdownValue: 'Hearing Status',
                              values: statuses,
                              controller: hearing_statusController,
                              label: 'Hearing Status'),
                          AppLargeDropdown(
                              dropdownValue: 'Hearing Stage',
                              values: stages,
                              controller: hearing_stageController,
                              label: 'Hearing Stage'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDefaults.padding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //City //Priority
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _selectEndDate(context);
                                setState(() {
                                  active = true;
                                });
                                context.read<AddHearingBloc>().add(
                                    EventAddDateOfHearing(
                                        date_of_hearing:
                                            selectedEndDate.toString()));
                              },
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      color:
                                          AppColors.primary.withOpacity(0.05),
                                      spreadRadius: 1,
                                      blurRadius: 5)
                                ]),
                                child: Card(
                                  // elevation: 3,
                                  shadowColor: Colors.transparent,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
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
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDefaults.padding),
                    child: AppTextField(
                      false,
                      hearing_descriptionController,
                      'Summary',
                      5,
                      onChanged: (value) {
                        context.read<AddHearingBloc>().add(
                            EventAddHearingDescription(
                                hearing_description: value!));
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
                          // context.read<AddHearingBloc>().add(EventSubmitted());
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
                          if (context
                                      .read<AddHearingBloc>()
                                      .state
                                      .title
                                      .length >
                                  2 &&
                              context
                                      .read<AddHearingBloc>()
                                      .state
                                      .hearing_description
                                      .length >
                                  2)
                            setState(() {
                              submitting = !submitting;
                            });
                          setState(() {
                            hearing_stageMaps.forEach((element) {
                              if (element['name'] ==
                                  hearing_stageController.text)
                                hearing_stage = element['id'];
                            });
                            hearing_statusMaps.forEach((element) {
                              if (element['name'] ==
                                  hearing_statusController.text)
                                hearing_status = element['id'];
                            });
                          });
                          print(selectedEndDate.toString().substring(0, 19));
                          print(hearing_status);
                          print(hearing_stage);
                          print(hearing_descriptionController.text);
                          print(titleController.text);
                          context.read<AddHearingBloc>().add(
                              EventAddDateOfHearing(
                                  date_of_hearing:
                                      date_of_hearingController.text));
                          context
                              .read<AddHearingBloc>()
                              .add(EventAddTitle(title: titleController.text));
                          context.read<AddHearingBloc>().add(
                              EventAddHearingStatus(
                                  hearing_status: hearing_status));
                          context.read<AddHearingBloc>().add(
                              EventAddHearingStage(
                                  hearing_stage: hearing_stage));
                          context.read<AddHearingBloc>().add(
                              EventAddHearingDescription(
                                  hearing_description:
                                      hearing_descriptionController.text));
                          context.read<AddHearingBloc>().add(
                              EventAddDateOfHearing(
                                  date_of_hearing: selectedEndDate
                                      .toString()
                                      .substring(0, 19)));
                          //TODO: Adding Rough Code
                          final SharedPreferences _prefs =
                              await SharedPreferences.getInstance();

                          var headers = {
                            'Accept': 'application/json, text/plain, */*',
                            'Authorization': 'JWT ${_prefs.getString('token')}',
                            'Connection': 'keep-alive',
                            'Content-Type': 'application/json',
                            'Accept-Encoding': 'gzip',
                          };
                          Map jsonData = {
                            "title": "${titleController.text}",
                            "date_of_hearing":
                                "${selectedEndDate.toString().substring(0, 19)}",
                            "hearing_status": "${hearing_status}",
                            "hearing_stage": hearing_stage,
                            "hearing_description":
                                "${hearing_descriptionController.text}"
                          };
                          var data =
                              '{"title":"${titleController.text}","date_of_hearing":"${selectedEndDate.toString().substring(0, 19)}","hearing_status":"${hearing_status}","hearing_stage":${hearing_stage},"hearing_description":"${hearing_descriptionController.text}"}';

                          await data.replaceAll('\\', '');
                          print(jsonData);

                          var url = Uri.parse(
                              'https://corporate.legistify.com/api/case/${widget.caseId}/hearings/');
                          var res = await http.post(url,
                              headers: headers, body: data);
                          print(res.body);
                          if (res.statusCode != 201)
                            throw Exception(
                                'http.post error: statusCode= ${res.statusCode}');

                          print('Adding Hearing');
                          print(res.body);
                          if (res.statusCode == 201) {
                            context
                                .read<AllCasesDetailsBloc>()
                                .add(RefreshingCaseDetails());
                            context
                                .read<AllCasesDetailsBloc>()
                                .add(GetAllCasesDetails(widget.caseId));
                            context
                                .read<AllCasesDetailsBloc>()
                                .add(GetCaseActivityLog(widget.caseId));
                            context
                                .read<AllCasesDetailsBloc>()
                                .add(GetDocStorageItems(widget.caseId));
                            context
                                .read<AllCasesDetailsBloc>()
                                .add(GetManualHearings(widget.caseId));
                            context
                                .read<AllCasesDetailsBloc>()
                                .add(GetAutomaticHearings(widget.caseId));
                            context
                                .read<AllCasesDetailsBloc>()
                                .add(GetTasks(widget.caseId));
                            Navigator.pop(context);
                          }

                          // yield state.copyWith(formSubmissionStatus: SubmissionSuccess());
                          // context.read<AddHearingBloc>().add(EventSubmitted());
                          // Navigator.pop(context);
                          setState(() {});
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 4,
                          color: (context
                                          .read<AddHearingBloc>()
                                          .state
                                          .title
                                          .length >
                                      2 &&
                                  context
                                          .read<AddHearingBloc>()
                                          .state
                                          .hearing_description
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
                                    'Add Hearing',
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
