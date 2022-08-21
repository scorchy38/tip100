import 'package:tip100/core/components/dropdown.dart';
import 'package:tip100/core/components/dropdown_large.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/model/task_assigned_user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';
import '../../../../../../../size_config.dart';
import 'package:http/http.dart' as http;

class CreateNewTask extends StatefulWidget {
  final List<TaskAssignedUser> usersToAssign;
  CreateNewTask({required this.usersToAssign, Key? key}) : super(key: key);

  @override
  _CreateNewTaskState createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  DateTime? selectedDeadline;
  Future<void> _selectDeadline(BuildContext context) async {
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
      selectedDeadline = date;
      deadlineController.text =
          date == null ? 'Deadline' : '${date.day}/${date.month}/${date.year}';
      // });
    }, currentTime: DateTime.now(), locale: LocaleType.en);
    // final DateTime? picked = await showDatePicker(
    //     context: context,
    //     initialDate: selectedDeadline ?? DateTime.now(),
    //     firstDate: DateTime(2015, 8),
    //     lastDate: DateTime(2101));
    // if (picked != null && picked != selectedDeadline) {
    //   setState(() {
    //     selectedDeadline = picked;
    //   });
    // }
  }

  TextEditingController taskTitleController = TextEditingController();
  TextEditingController startTypingController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController visibleController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  int selectedUser = 9999999;
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text(
          'Create New Task',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: AppDefaults.padding,
                      top: AppDefaults.padding,
                      right: AppDefaults.padding),
                  child: AppTextField(
                      false, taskTitleController, 'Task Title', 1.2),
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
                          dropdownValue: 'Task Status',
                          values: ['Task Status', "CO", "PE", "CN"],
                          controller: statusController,
                          label: 'Task Status'),
                      AppLargeDropdown(
                          dropdownValue: 'Task Type',
                          values: [
                            'Task Type',
                            'CL',
                            'MT',
                            'EM',
                            'PD',
                            'IN',
                            'CO',
                            'OF',
                            'OT',
                            'DO'
                          ],
                          controller: typeController,
                          label: 'Task Type'),
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
                      AppLargeDropdown(
                          dropdownValue: 'Visible',
                          values: ['Visible', 'True', 'False'],
                          controller: visibleController,
                          label: 'Visible'),
                      Padding(
                        padding: EdgeInsets.only(
                          left: getProportionateScreenWidth(8),
                        ),
                        child: SizedBox(
                          height: double.parse((35 * 1.2).toString()),
                          width: (MediaQuery.of(context).size.width / 2) - 24,
                          child: InkWell(
                            onTap: () async {
                              await _selectDeadline(context);
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
                                controller: deadlineController,
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
                  child: AppTextField(false, summaryController, 'Summary', 6),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Setup assignees for this task',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.appGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: AppDefaults.padding,
                      top: AppDefaults.padding,
                      right: AppDefaults.padding),
                  child: AppTextField(
                      false, startTypingController, 'Start Typing', 1.2),
                ),
                // startTypingController.text == ''
                //     ?
                ListView.builder(
                  itemCount: widget.usersToAssign.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        widget.usersToAssign[index].user!.fullName!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.appGrey, fontSize: 16),
                      ),
                      subtitle: Text(
                        widget.usersToAssign[index].userTypeName!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.appGrey, fontSize: 14),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            widget.usersToAssign[index].file!.toString()),
                      ),
                      trailing: selectedUser !=
                              widget.usersToAssign[index].user?.id
                          ? InkWell(
                              onTap: () {
                                selectedUser =
                                    widget.usersToAssign[index].user!.id!;
                                setState(() {});
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        color: AppColors.appGrey, width: 2)),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                selectedUser = 999999;
                                setState(() {});
                              },
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: AppColors.primary,
                                    border: Border.all(
                                        color: AppColors.appGrey, width: 2)),
                              ),
                            ),
                    );
                  },
                )
                // : ListView.builder(
                //     itemCount: widget.usersToAssign
                //         .where((element) => element.user?.fullName
                //             .contains(startTypingController.text))
                //         .length,
                //     shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     itemBuilder: (context, index) {
                //       return ListTile(
                //         title: Text(
                //           'Akshat Singhal',
                //           style: Theme.of(context)
                //               .textTheme
                //               .bodyLarge
                //               ?.copyWith(
                //                   color: AppColors.appGrey, fontSize: 16),
                //         ),
                //         subtitle: Text(
                //           'Non-Legal User',
                //           style: Theme.of(context)
                //               .textTheme
                //               .bodyLarge
                //               ?.copyWith(
                //                   color: AppColors.appGrey, fontSize: 14),
                //         ),
                //         leading: CircleAvatar(
                //           backgroundImage: AssetImage(AppImages.follower),
                //         ),
                //         trailing: Container(
                //           height: 25,
                //           width: 25,
                //           decoration: BoxDecoration(
                //               borderRadius:
                //                   BorderRadius.all(Radius.circular(5)),
                //               border: Border.all(
                //                   color: AppColors.appGrey, width: 2)),
                //         ),
                //       );
                //     },
                //   )
              ],
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
                      setState(() {});
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
                    onTap: () async {
                      final SharedPreferences _prefs =
                          await SharedPreferences.getInstance();
                      FormData formData = FormData.fromMap({
                        'title': taskTitleController.text,
                        'assigned_to': widget.usersToAssign
                            .where(
                                (element) => element.user!.id == selectedUser)
                            .first
                            .id,
                        'activity_type': typeController.text,
                        'document': '[object Object]',
                        'deadline':
                            '${selectedDeadline!.year.toString()}-${selectedDeadline!.month.toString().padLeft(2, '0')}-${selectedDeadline!.day.toString().padLeft(2, '0')} ${selectedDeadline!.hour.toString().padLeft(2, '0')}:${selectedDeadline!.minute.toString().padLeft(2, '0')}:${selectedDeadline!.second.toString().padLeft(2, '0')}',
                        'lawyer_email': widget.usersToAssign
                            .where(
                                (element) => element.user!.id == selectedUser)
                            .first
                            .user!
                            .email,
                        'visible': visibleController.text == 'True' ? 1 : 0,
                        'summary': summaryController.text,
                      });

                      Dio dio = new Dio();
                      dio.options.headers["Authorization"] =
                          "JWT ${_prefs.getString('token')}";
                      dio.options.headers["Content-Type"] =
                          "multipart/form-data; boundary=<calculated when request is sent>";
                      var url = Uri.parse(
                          'https://corporate.legistify.com/api/case/2601879/activities/');
                      var res = await dio.post(
                          'https://corporate.legistify.com/api/case/2601879/activities/',
                          data: formData);
                      if (res.statusCode != 201) {
                        Fluttertoast.showToast(
                          msg: "Error code ${res.statusCode}",
                          // toastLength: Toast.LENGTH_SHORT,
                          // gravity: ToastGravity.CENTER,
                          // timeInSecForIosWeb: 1,
                          // backgroundColor: Colors.red,
                          // textColor: Colors.white,
                          // fontSize: 16.0
                        );
                        throw Exception(
                            'http.post error: statusCode= ${res.statusCode}');
                      } else {
                        context.read<AllCasesDetailsBloc>().add(GetTasks(context
                            .read<AllCasesDetailsBloc>()
                            .state
                            .caseDetails!
                            .id!));
                        Fluttertoast.showToast(
                          msg: "New Task Added",
                          // toastLength: Toast.LENGTH_SHORT,
                          // gravity: ToastGravity.CENTER,
                          // timeInSecForIosWeb: 1,
                          // backgroundColor: Colors.red,
                          // textColor: Colors.white,
                          // fontSize: 16.0
                        );
                        Navigator.of(context).pop();
                      }

                      print(res.data);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 4,
                      color:
                          // (taskTitleController.value.text.length > 2 &&
                          //         summaryController.value.text.length > 2) ?
                          AppColors.appBlue
                      // : AppColors.appGrey
                      ,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          'Create Task',
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
      ),
    );
  }
}
