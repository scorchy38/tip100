import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/all_cases.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/case_explorer.dart';
import 'package:tip100/screens/litigations/section_pages/cause_list/cause_list.dart';
import 'package:tip100/screens/litigations/section_pages/judgements/judgements.dart';
import 'package:tip100/screens/litigations/section_pages/litigation_search/litigation_search.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/my_counsel.dart';
import 'package:flutter/material.dart';

import 'litigations_section_card.dart';

class LitigationsSections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: ListView(
        children: [
          LitigationsSectionCard(
            cardtitle: 'Case Explorer',
            newTag: false,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CaseExplorerPage()));
            },
          ),
          LitigationsSectionCard(
            cardtitle: 'All Cases',
            newTag: true,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AllCasesPage()));
            },
          ),
          LitigationsSectionCard(
            cardtitle: 'My Counsels',
            newTag: false,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyCounselPage()));
            },
          ),
          LitigationsSectionCard(
            cardtitle: 'Litigation Search',
            newTag: false,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LitigationSearchPage()));
            },
          ),
          LitigationsSectionCard(
            cardtitle: 'Cause List',
            newTag: true,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CauseListPage()));
            },
          ),
          LitigationsSectionCard(
            cardtitle: 'Judgements',
            newTag: true,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const JudgementsPage()));
            },
          ),
        ],
      ),
    );
  }
}
