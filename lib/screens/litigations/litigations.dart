import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/all_cases_filters_bloc/all_cases_filters_bloc.dart';
import 'package:tip100/logic/bloc/cause_list_filters_bloc/cause_list_filters_bloc.dart';
import 'package:tip100/screens/home/components/bar_chart.dart';
import 'package:tip100/screens/litigations/components/litigations_sections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/litigations_header.dart';

import '../../core/components/search_box.dart';

class LitigationsPage extends StatefulWidget {
  const LitigationsPage({Key? key}) : super(key: key);

  @override
  State<LitigationsPage> createState() => _LitigationsPageState();
}

class _LitigationsPageState extends State<LitigationsPage> {
  @override
  void initState() {
    context.read<AllCasesFiltersBloc>().add(AllCasesFilters());
    context.read<CauseListFiltersBloc>().add(CauseListFilters());

    // TODO: implement initState
    super.initState();
  }

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
              children: [LitigationsHeader(), LitigationsSections()],
            ),
          ),
        ),
      ),
    );
  }
}
