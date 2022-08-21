import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/details/components/removable_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../../logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';
import 'cta_button.dart';

class LinkedNoticesCard extends StatefulWidget {
  int caseId;
  LinkedNoticesCard(
    this.caseId, {
    Key? key,
  }) : super(key: key);

  @override
  State<LinkedNoticesCard> createState() => LinkedNoticesCardState();
}

class LinkedNoticesCardState extends State<LinkedNoticesCard> {
  List<Widget> linkedNotices = [];
  List<int> linkedNoticesIds = [];
  @override
  void initState() {
    context
        .read<AllCasesDetailsBloc>()
        .state
        .caseDetails!
        .allLinkedNotices!
        .forEach((element) {
      linkedNoticesIds.add(element.id!);
      log(element.id.toString());
      linkedNotices.add(SizedBox(
        height: 10,
      ));
      linkedNotices.add(InkWell(
        onTap: () async {
          final SharedPreferences _prefs =
              await SharedPreferences.getInstance();
          await linkedNoticesIds.remove(element.id!);
          var headers = {
            'Accept': 'application/json, text/plain, */*',
            'Authorization': 'JWT ${_prefs.getString('token')}',
            'Content-Type': 'application/json',
            'Accept-Encoding': 'gzip',
          };
          print('{"linked_notices":${linkedNoticesIds.toString()}}');
          var data = '{"linked_notices":${linkedNoticesIds.toString()}}';

          var url = Uri.parse(
              'https://corporate.legistify.com/api/case/${widget.caseId}/');
          var res = await http.put(url, headers: headers, body: data);
          // if (res.statusCode != 200)
          //   throw Exception('http.put error: statusCode= ${res.statusCode}');

          context.read<AllCasesDetailsBloc>().add(RefreshingCaseDetails());
          context
              .read<AllCasesDetailsBloc>()
              .add(GetAllCasesDetails(widget.caseId));
          context
              .read<AllCasesDetailsBloc>()
              .add(GetCaseActivityLog(widget.caseId));
          context
              .read<AllCasesDetailsBloc>()
              .add(GetDocStorageItems(widget.caseId));
          context
              .read<AllCasesDetailsBloc>()
              .add(GetManualHearings(widget.caseId));
          context
              .read<AllCasesDetailsBloc>()
              .add(GetAutomaticHearings(widget.caseId));
          context.read<AllCasesDetailsBloc>().add(GetTasks(widget.caseId));
          print(res.body);
        },
        child: RemovableTag(
          tagName: element.name!,
          // overflow: true,
        ),
      ));
    });
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
                    'Linked Notices Details',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColorBlack),
                  ),
                  Spacer(),
                  CTAButton(
                      buttonColor: AppColors.primary,
                      buttonName: 'Edit',
                      prefixIcon: SvgPicture.asset(
                        AppIcons.edit,
                        height: 12,
                        width: 12,
                      ))
                ],
              ),
              ...linkedNotices,
              // SizedBox(
              //   height: 10,
              // ),
              // RemovableTag(tagName: 'Notice 11212121212'),
              // const SizedBox(
              //   height: 10,
              // ),
              // RemovableTag(tagName: 'Notice 112121212121212121212'),
            ],
          ),
        ),
      ),
    );
  }
}
