import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import '../../../../../../../logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';

class ActivityLogCard extends StatefulWidget {
  const ActivityLogCard({
    Key? key,
  }) : super(key: key);

  @override
  State<ActivityLogCard> createState() => ActivityLogCardState();
}

class ActivityLogCardState extends State<ActivityLogCard> {
  List<Widget> followers = [];
  List<TimelineModel> items = [];
  @override
  void initState() {
    print(context.read<AllCasesDetailsBloc>().state.activityLog!.length);
    for (int i = 0;
        i < context.read<AllCasesDetailsBloc>().state.activityLog!.length;
        i++) {
      items.add(TimelineModel(Text(''),
          position: TimelineItemPosition.right,
          iconBackground: Colors.redAccent,
          icon: Icon(Icons.blur_circular)));
    }
    setState(() {});
    // setState(() {});
    // context
    //     .read<AllCasesDetailsBloc>()
    //     .state
    //     .caseDetails!
    //     .followersDetail!
    //     .forEach((element) {
    //   linkedNotices.add(SizedBox(
    //     height: 10,
    //   ));
    //   linkedNotices.add(RemovableTag(
    //     tagName: element.name!,
    //     // overflow: true,
    //   ));
    // });
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
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Activity Log',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColorBlack),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Container(
                  // color: Colors.red,
                  child: Timeline(
                    children: List.generate(
                        context
                            .watch<AllCasesDetailsBloc>()
                            .state
                            .activityLog!
                            .length,
                        (index) => TimelineModel(
                            context
                                        .watch<AllCasesDetailsBloc>()
                                        .state
                                        .activityLog![index]
                                        .actionType ==
                                    'update'
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 30),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${context.watch<AllCasesDetailsBloc>().state.activityLog![index].activityType!} updated',
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          DateTime.parse(context
                                                          .watch<
                                                              AllCasesDetailsBloc>()
                                                          .state
                                                          .activityLog![index]
                                                          .created!)
                                                      .hour >=
                                                  12
                                              ? '${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).day}-${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).month}-${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).year} @ ${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).hour}:${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).minute} pm by ${context.watch<AllCasesDetailsBloc>().state.activityLog![index].memberName!}'
                                              : '${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).day}-${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).month}-${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).year} @ ${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).hour}:${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).minute} am by ${context.watch<AllCasesDetailsBloc>().state.activityLog![index].memberName!}',
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: AppColors.appGrey),
                                        ),
                                      ],
                                    ),
                                  )
                                : context
                                            .watch<AllCasesDetailsBloc>()
                                            .state
                                            .activityLog![index]
                                            .actionType ==
                                        'add'
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'New ${context.watch<AllCasesDetailsBloc>().state.activityLog![index].activityType!} added'),
                                            Text(
                                              DateTime.parse(context
                                                              .watch<
                                                                  AllCasesDetailsBloc>()
                                                              .state
                                                              .activityLog![
                                                                  index]
                                                              .created!)
                                                          .hour >=
                                                      12
                                                  ? '${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).day}-${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).month}-${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).year} @ ${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).hour}:${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).minute} pm by ${context.watch<AllCasesDetailsBloc>().state.activityLog![index].memberName!}'
                                                  : '${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).day}-${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).month}-${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).year} @ ${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).hour}:${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).minute} am by ${context.watch<AllCasesDetailsBloc>().state.activityLog![index].memberName!}',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppColors.appGrey),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 30),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${context.watch<AllCasesDetailsBloc>().state.activityLog![index].activityType!} deleted'),
                                            Text(
                                              DateTime.parse(context
                                                              .watch<
                                                                  AllCasesDetailsBloc>()
                                                              .state
                                                              .activityLog![
                                                                  index]
                                                              .created!)
                                                          .hour >=
                                                      12
                                                  ? '${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).day}-${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).month}-${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).year} @ ${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).hour}:${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).minute} pm by ${context.watch<AllCasesDetailsBloc>().state.activityLog![index].memberName!}'
                                                  : '${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).day}-${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).month}-${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).year} @ ${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).hour}:${DateTime.parse(context.watch<AllCasesDetailsBloc>().state.activityLog![index].created!).minute} am by ${context.watch<AllCasesDetailsBloc>().state.activityLog![index].memberName!}',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: AppColors.appGrey),
                                            ),
                                          ],
                                        ),
                                      ),
                            position: TimelineItemPosition.right,
                            iconBackground: Colors.green.withOpacity(0.3),
                            icon: Icon(
                              Icons.circle,
                              color: context
                                          .watch<AllCasesDetailsBloc>()
                                          .state
                                          .activityLog![index]
                                          .activityType ==
                                      'Case'
                                  ? Colors.red
                                  : context
                                              .watch<AllCasesDetailsBloc>()
                                              .state
                                              .activityLog![index]
                                              .activityType ==
                                          'Hearing'
                                      ? Colors.orange
                                      : context
                                                  .watch<AllCasesDetailsBloc>()
                                                  .state
                                                  .activityLog![index]
                                                  .activityType ==
                                              'Task'
                                          ? Colors.blue
                                          : Colors.green,
                              size: 2,
                            ))),
                    lineColor: Colors.grey,
                    lineWidth: 1,
                    iconSize: 5,
                    position: TimelinePosition.Left,
                    // primary: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
