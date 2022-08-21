import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_illustrations.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/logic/bloc/my_counsel_details_bloc/my_counsel_details_bloc.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/tasks/components/tasks_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'components/notices_card.dart';
import 'components/notices_header.dart';

class NoticesPage extends StatefulWidget {
  const NoticesPage({Key? key}) : super(key: key);

  @override
  State<NoticesPage> createState() => NoticesPageState();
}

class NoticesPageState extends State<NoticesPage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  VoidCallback? _showPersistantBottomSheetCallBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.tertiary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.offWhite,
            height: MediaQuery.of(context).size.height,
            child: context.watch<MyCounselDetailsBloc>().state.noticesLoading ==
                    true
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NoticesHeader(),
                      Expanded(
                        child: SizedBox(
                          // width: MediaQuery.of(context).size.width * 0.9,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) => index == 4
                                ? Padding(
                                    padding: EdgeInsets.only(bottom: 30),
                                    child: NoticeCard(
                                      noticeItem: context
                                          .watch<MyCounselDetailsBloc>()
                                          .state
                                          .noticeItems![index],
                                    ),
                                  )
                                : NoticeCard(
                                    noticeItem: context
                                        .watch<MyCounselDetailsBloc>()
                                        .state
                                        .noticeItems![index],
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
