import 'dart:convert';

import 'package:tip100/core/components/icon_button_with_text.dart';
import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/components/small_button_transparent.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/model/task_assigned_user_model.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/ancillary_details/components/cta_button_solid.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/tasks/components/all_cases_tasks_filter.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/tasks/components/create_new_task.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TasksHeader extends StatefulWidget {
  const TasksHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<TasksHeader> createState() => TasksHeaderState();
}

class TasksHeaderState extends State<TasksHeader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: Card(
        elevation: 4,
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            // mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.textColorBlack,
                ),
              ),
              Spacer(),
              SmallButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AllCasesTaskFilters()));
                  },
                  buttonColor: AppColors.purpleTag,
                  buttonIcon: AppIcons.filter),
              SizedBox(
                width: 10,
              ),
              IconButtonWithText(
                onTap: () async {
                  final SharedPreferences _prefs =
                      await SharedPreferences.getInstance();
                  var headers = {
                    'Accept': '*/*',
                    'Accept-Language': 'en-US,en;q=0.9',
                    'Authorization': 'JWT ${_prefs.getString('token')}',
                    'Connection': 'keep-alive',
                    'Accept-Encoding': 'gzip',
                  };

                  var url = Uri.parse(
                      'https://corporate.legistify.com/api/organization-member/2601879/list_assigned_user/');
                  var res = await http.get(url, headers: headers);
                  if (res.statusCode != 200)
                    throw Exception(
                        'http.get error: statusCode= ${res.statusCode}');
                  print(res.body);
                  List usersMaps = await json.decode(res.body);
                  List<TaskAssignedUser> users = await List.generate(
                      usersMaps.length,
                      (index) => TaskAssignedUser.fromJson(usersMaps[index]));

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateNewTask(
                                usersToAssign: users,
                              )));
                  // showModalBottomSheet(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(10)),
                  //     context: context,
                  //     builder: (context) => AddDocSheet());
                },
                buttonColor: AppColors.greenTag,
                buttonIcon: AppIcons.addButton,
                buttonText: 'New Task',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
