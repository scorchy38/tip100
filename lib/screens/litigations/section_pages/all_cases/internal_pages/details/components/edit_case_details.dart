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
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../core/constants/app_icons.dart';
import '../../../../../../../size_config.dart';
import 'package:http/http.dart' as http;

class EditCaseDetails extends StatefulWidget {
  String? caseNumber,
      title,
      type,
      court,
      city,
      priority,
      status,
      caseStage,
      action,
      summary;
  EditCaseDetails(
      {this.caseNumber,
      this.title,
      this.type,
      this.court,
      this.city,
      this.priority,
      this.status,
      this.caseStage,
      this.action,
      this.summary,
      Key? key})
      : super(key: key);

  @override
  _EditCaseDetailsState createState() => _EditCaseDetailsState();
}

class _EditCaseDetailsState extends State<EditCaseDetails> {
  TextEditingController titleController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController caseTypeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController caseStageController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController lawyerUpdateController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  TextEditingController caseNoController = TextEditingController();
  TextEditingController courtController = TextEditingController();
  TextEditingController filingDateController = TextEditingController();
  TextEditingController allocationDateController = TextEditingController();
  TextEditingController actionController = TextEditingController();
  int type = MAXINT, court = MAXINT, city = MAXINT;
  String priority = 'NULL';
  List typeMaps = [],
      courtMaps = [],
      actionMaps = [],
      statusMaps = [],
      stageMaps = [],
      cityMaps = [],
      priorityMaps = [];
  bool submitting = false;

  DateTime? selectedFilingDate;
  DateTime? selectedAllocationDate;
  Future<void> _selectDate(BuildContext context,
      TextEditingController controller, DateTime? date, String type) async {
    DatePicker.showDateTimePicker(context,
        showTitleActions: true,
        minTime: DateTime(2018, 3, 5),
        maxTime: DateTime(2019, 6, 7), onChanged: (date) {
      // setState(() {
      //   selectedDeadline = date;
      //   deadlineController.text = date == null
      //       ? 'Deadline'
      //       : '${date!.day}/${date!.month}/${date!.year}';
      // });
    }, onConfirm: (date) {
      // setState(() {
      date = date;
      controller.text =
          date == null ? type : '${date.day}/${date.month}/${date.year}';
      // });
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  @override
  void initState() {
    print(widget.type);
    titleController.text = widget.title ?? "";
    caseNoController.text = widget.caseNumber ?? "";
    caseTypeController.text = widget.type ?? "";
    courtController.text = widget.court ?? "";
    cityController.text = widget.city ?? "";
    priorityController.text = widget.priority ?? "";
    statusController.text = widget.status ?? "";
    caseStageController.text = widget.caseStage ?? "";
    actionController.text = widget.action ?? "";

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
        title: Text(
          'Edit Case Details',
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
          stageMaps = context.watch<AllCasesFiltersBloc>().state.case_stage!;

          cityMaps = [
            {'id': 5856, 'name': 'Delhi'}
          ];
          actionMaps = [
            {'id': 'NA', 'name': 'No Action'}
          ];
          statusMaps = [
            {'id': 'ON', 'name': 'Ongoing'},
            {'id': 'DI', 'name': 'Disposed'},
          ];

          priorityMaps = [
            {'id': 'H', 'name': 'High'},
            {'id': 'M', 'name': 'Medium'},
            {'id': 'L', 'name': 'Low'}
          ];
          List<String>? caseType = [widget.type ?? 'Case Type'];
          caseTypeController.text = widget.type ?? 'Case Type';
          typeMaps.forEach((element) {
            caseType.add(element['name']);
          });

          List<String>? courts = [widget.court ?? 'Court'];
          courtController.text = widget.court ?? 'Court';
          courtMaps.forEach((element) {
            courts.add(element['name']);
          });
          List<String>? actions = [widget.action ?? 'Key Action'];
          actionController.text = widget.action ?? 'Key Action';
          actionMaps.forEach((element) {
            actions.add(element['name']);
          });
          List<String>? lawyerUpdates = ['Lawyer Notification', 'Yes', 'No'];
          List<String>? cities = [widget.city ?? 'City'];

          cityController.text = widget.city ?? 'City';
          cityMaps.forEach((element) {
            cities.add(element['name']);
          });
          List<String>? caseStage = [widget.caseStage ?? 'Case Stage'];
          caseStageController.text = widget.caseStage ?? 'Case Stage';
          context
              .watch<AllCasesFiltersBloc>()
              .state
              .case_stage
              ?.forEach((element) {
            caseStage.add(element['name']);
          });
          List<String>? status = [widget.status ?? 'Status'];

          statusController.text = widget.status ?? 'Status';
          statusMaps.forEach((element) {
            status.add(element['name']);
          });

          List<String>? priorities = [widget.priority ?? 'Priority'];
          priorityController.text = widget.priority ?? 'Priority';
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
                      caseNoController,
                      'Case No.',
                      1.2,
                      onChanged: (value) {
                        context
                            .read<AddCaseBloc>()
                            .add(EventAddTitle(title: value!));
                        setState(() {});
                      },
                    ),
                  ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
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
                            dropdownValue: widget.type ?? 'Case Type',
                            values: caseType,
                            controller: caseTypeController,
                            label: widget.type ?? 'Case Type'),
                        AppLargeDropdown(
                            dropdownValue: widget.court ?? 'Court',
                            values: courts,
                            controller: courtController,
                            label: widget.court ?? 'Court'),
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
                            dropdownValue: widget.city ?? 'City',
                            values: cities,
                            controller: cityController,
                            label: widget.city ?? 'City'),
                        AppLargeDropdown(
                            dropdownValue: widget.priority ?? 'Priority',
                            values: priorities,
                            controller: priorityController,
                            label: widget.priority ?? 'Priority'),
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
                            dropdownValue: widget.status ?? 'Status',
                            values: status,
                            controller: statusController,
                            label: widget.status ?? 'Status'),
                        AppLargeDropdown(
                            dropdownValue: 'Lawyer Notification',
                            values: lawyerUpdates,
                            controller: lawyerUpdateController,
                            label: 'Lawyer Notification'),
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
                            dropdownValue: widget.caseStage ?? 'Case Stage',
                            values: caseStage,
                            controller: caseStageController,
                            label: widget.caseStage ?? 'Case Stage'),
                        AppLargeDropdown(
                            dropdownValue: widget.action ?? 'Key Action',
                            values: actions,
                            controller: actionController,
                            label: widget.action ?? 'Key Action'),
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
                        SizedBox(
                          height: double.parse((35 * 1.2).toString()),
                          width: (MediaQuery.of(context).size.width / 2) - 24,
                          child: InkWell(
                            onTap: () async {
                              await _selectDate(context, filingDateController,
                                  selectedFilingDate, 'Date of Filing');
                              // setState(() {
                              //   deadlineController.text = selectedDeadline ==
                              //           null
                              //       ? 'Deadline'
                              //       : '${selectedDeadline!.day}/${selectedDeadline!.month}/${selectedDeadline!.year}';
                              // });
                            },
                            child: Card(
                              shadowColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 4,
                              child: TextFormField(
                                // controller: widget.controller,
                                controller: filingDateController,
                                enabled: false,
                                minLines: 1.2.toInt(),
                                maxLines: (1.2 + 1).toInt(),
                                onEditingComplete: () {
                                  setState(() {});
                                },
                                onChanged: (value) {
                                  setState(() {});
                                },

                                decoration: InputDecoration(
                                  labelText: '',
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 12),
                                    child: SvgPicture.asset(
                                      AppIcons.calendar,
                                      height: 25,
                                      width: 25,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 9.0, horizontal: 10),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Date of Filing',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: AppColors.primary),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIconConstraints:
                                      const BoxConstraints(maxWidth: 48),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: double.parse((35 * 1.2).toString()),
                          width: (MediaQuery.of(context).size.width / 2) - 24,
                          child: InkWell(
                            onTap: () async {
                              await _selectDate(
                                  context,
                                  allocationDateController,
                                  selectedAllocationDate,
                                  'Date of Allocation');
                              // setState(() {
                              //   deadlineController.text = selectedDeadline ==
                              //           null
                              //       ? 'Deadline'
                              //       : '${selectedDeadline!.day}/${selectedDeadline!.month}/${selectedDeadline!.year}';
                              // });
                            },
                            child: Card(
                              shadowColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              elevation: 4,
                              child: TextFormField(
                                // controller: widget.controller,
                                controller: allocationDateController,
                                enabled: false,
                                minLines: 1.2.toInt(),
                                maxLines: (1.2 + 1).toInt(),
                                onEditingComplete: () {
                                  setState(() {});
                                },
                                onChanged: (value) {
                                  setState(() {});
                                },

                                decoration: InputDecoration(
                                  labelText: '',
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 12),
                                    child: SvgPicture.asset(
                                      AppIcons.calendar,
                                      height: 25,
                                      width: 25,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 9.0, horizontal: 10),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Deadline',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: AppColors.primary),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  prefixIconConstraints:
                                      const BoxConstraints(maxWidth: 48),
                                ),
                              ),
                            ),
                          ),
                        ),
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
                        child: InkWell(
                          onTap: () async {
                            final SharedPreferences _prefs =
                                await SharedPreferences.getInstance();

                            var headers = {
                              'Accept': 'application/json, text/plain, */*',
                              'Authorization':
                                  'JWT ${_prefs.getString('token')}',
                              'Content-Type': 'application/json',
                              'Accept-Encoding': 'gzip',
                            };

                            var data =
                                '{"case_no":"${caseNoController.text}","title":"${titleController.text}","city":$city,"court":$court,"date_of_allotment":"2021-11-11","date_of_filing":"2018-11-02","status":"ON","case_type":2706,"case_stage":10986,"priority":"H","is_litigation":true,"send_lawyer_update":true,"case_by":"","client_side":"C","action":"NA","complainant_address":null,"complainant_phone_number":null,"description":null}';

                            var url = Uri.parse(
                                'https://corporate.legistify.com/api/case/2601879');
                            var res = await http.put(url,
                                headers: headers, body: data);
                            if (res.statusCode != 200)
                              throw Exception(
                                  'http.put error: statusCode= ${res.statusCode}');
                            print(res.body);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 4,
                            color:
                                // (context
                                //                 .read<AddCaseBloc>()
                                //                 .state
                                //                 .title
                                //                 .length >
                                //             2 &&
                                //         context
                                //                 .read<AddCaseBloc>()
                                //                 .state
                                //                 .description
                                //                 .length >
                                //             2) ?
                                AppColors.appBlue
                            // : AppColors.appGrey
                            ,
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
                                      'Update Case Details',
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
