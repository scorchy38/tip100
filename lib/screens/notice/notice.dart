import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/screens/home/components/bar_chart.dart';
import 'package:tip100/screens/ipr/components/ipr_sections.dart';
import 'package:tip100/screens/litigations/components/litigations_sections.dart';
import 'package:flutter/material.dart';

import 'components/notice_header.dart';

import '../../core/components/search_box.dart';
import 'components/notice_sections.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.tertiary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.offWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [NoticeHeader(), NoticeSections()],
            ),
          ),
        ),
      ),
    );
  }
}
