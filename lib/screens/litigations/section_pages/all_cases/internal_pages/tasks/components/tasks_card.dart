import 'package:tip100/core/components/card_tags.dart';
import 'package:tip100/core/components/small_button_transparent.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/model/task_model.dart';
import 'package:tip100/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../details/components/cta_button.dart';
import '../../doc_storage/components/rename_bottom_sheet.dart';
import 'package:http/http.dart' as http;

class TasksCard extends StatefulWidget {
  final Task taskDetails;

  const TasksCard({Key? key, required this.taskDetails}) : super(key: key);

  @override
  State<TasksCard> createState() => _TasksCardState();
}

class _TasksCardState extends State<TasksCard> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = "Due";
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: Card(
        elevation: 4,
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            // height: getProportionateScreenHeight(278),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            context: context,
                            builder: (context) => RenameSheet());
                      },
                      child: SmallButtonTransparent(
                          buttonColor: AppColors.primary,
                          buttonIcon: AppIcons.edit),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        final SharedPreferences _prefs =
                            await SharedPreferences.getInstance();
                        var headers = {
                          'Accept': 'application/json, text/plain, */*',
                          'Authorization': 'JWT ${_prefs.getString('token')}',
                          'Connection': 'keep-alive',
                          'Content-Type':
                              'multipart/form-data; boundary=----WebKitFormBoundaryJoA4oEvVKLasDgIl',
                          'Accept-Encoding': 'gzip',
                        };

                        var data =
                            '------WebKitFormBoundaryJoA4oEvVKLasDgIlContent-Disposition: form-data; name="is_deleted"true------WebKitFormBoundaryJoA4oEvVKLasDgIl--';

                        var url = Uri.parse(
                            'https://corporate.legistify.com/api/case/2601879/activities/${widget.taskDetails.id}/');
                        var res =
                            await http.put(url, headers: headers, body: data);
                        if (res.statusCode != 200)
                          throw Exception(
                              'http.put error: statusCode= ${res.statusCode}');
                        print(res.body);
                      },
                      child: SmallButtonTransparent(
                          buttonColor: AppColors.red,
                          buttonIcon: AppIcons.delete),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        if (await canLaunchUrl(
                            Uri.parse(widget.taskDetails.documentFile!)))
                          await launchUrl(
                              Uri.parse(widget.taskDetails.documentFile!),
                              webViewConfiguration:
                                  WebViewConfiguration(enableJavaScript: true));
                        else
                          // can't launch url, there is some error
                          throw "Could not launch ${widget.taskDetails.documentFile!}";
                      },
                      child: SmallButtonTransparent(
                          buttonColor: AppColors.purpleTag,
                          buttonIcon: AppIcons.download),
                    ),
                    // Spacer()
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Task Title',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.taskDetails.title!,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14,
                      color: AppColors.textColorBlack,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Task Description',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  widget.taskDetails.summary!,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14,
                      color: AppColors.textColorBlack,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Type',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          widget.taskDetails.activityType!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 15,
                                  color: AppColors.textColorBlack,
                                  fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Deadline',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${DateTime.parse(widget.taskDetails.deadline!).day.toString().padLeft(2, '0')}-${DateTime.parse(widget.taskDetails.deadline!).month.toString().padLeft(2, '0')}-${DateTime.parse(widget.taskDetails.deadline!).year.toString()}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 15,
                                  color: AppColors.textColorBlack,
                                  fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Assigned To',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          widget.taskDetails.assignedToName!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 15,
                                  color: AppColors.textColorBlack,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 35,
                            width: MediaQuery.of(context).size.width / 2.5,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: AppColors.appGrey.withOpacity(0.05),
                                border: Border.all(
                                    color: AppColors.appGrey,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(8)),
                            child: DropdownButton<String>(
                                value: dropdownValue,
                                icon: const Padding(
                                  padding: EdgeInsets.only(left: 30.0),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: AppColors.appGrey,
                                  ),
                                ),
                                items: <String>[
                                  'Due',
                                  'Half Yearly',
                                  'Monthly'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
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
                                )))),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
