import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_illustrations.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/tasks/components/tasks_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';
import 'components/tasks_card.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ScrollController _scrollViewController = ScrollController();
  bool _showAppbar = true;

  @override
  void initState() {
    super.initState();

    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  bool isScrollingDown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: context.watch<AllCasesDetailsBloc>().state.tasksLoading != true
            ? Column(
                children: [
                  AnimatedContainer(
                      height: _showAppbar ? 100.0 : 0.0,
                      duration: Duration(milliseconds: 200),
                      child: TasksHeader()),
                  Padding(
                    padding: const EdgeInsets.all(AppDefaults.padding / 2),
                    child: Card(
                      elevation: 4,
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.caseExplorerDetail!.caseNo!}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textColorBlack),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(
                                '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.title!}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        fontSize: 15,
                                        color: AppColors.appGrey,
                                        fontWeight: FontWeight.w500),
                              )

                              // SmallButton(
                              //     buttonColor: AppColors.primary,
                              //     buttonIcon: AppIcons.addButton),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: context
                          .watch<AllCasesDetailsBloc>()
                          .state
                          .tasks!
                          .length,
                      controller: _scrollViewController,
                      itemBuilder: (context, index) {
                        return TasksCard(
                          taskDetails: context
                              .watch<AllCasesDetailsBloc>()
                              .state
                              .tasks![index],
                        );
                      },
                    ),
                  ),
                ],
              )
            : Container(
                color: AppColors.offWhite,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
      ),
    );
  }
}
