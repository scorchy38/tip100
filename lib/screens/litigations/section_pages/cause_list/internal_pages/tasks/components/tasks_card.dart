import 'package:tip100/core/components/card_tags.dart';
import 'package:tip100/core/components/small_button_transparent.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../details/components/cta_button.dart';

class TasksCard extends StatefulWidget {
  final String caseNumber, complaint, caseStage, court, pdoh, ndoh, ndohRemark;

  const TasksCard(
      {Key? key,
      required this.caseNumber,
      required this.complaint,
      required this.court,
      required this.caseStage,
      required this.pdoh,
      required this.ndoh,
      required this.ndohRemark})
      : super(key: key);

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
            height: 234,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Spacer(),
                    SmallButtonTransparent(
                        buttonColor: AppColors.primary,
                        buttonIcon: AppIcons.edit),
                    SizedBox(
                      width: 10,
                    ),
                    SmallButtonTransparent(
                        buttonColor: AppColors.red,
                        buttonIcon: AppIcons.delete),
                    SizedBox(
                      width: 10,
                    ),
                    SmallButtonTransparent(
                        buttonColor: AppColors.purpleTag,
                        buttonIcon: AppIcons.download),
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
                  'Signage Contracts (E) Aug 22',
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
                  'All Signage contracts in East India in the FY 22-23',
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
                          'All',
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
                          '01 Mar, 2022',
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
                          'Pratik Mohapatra',
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
