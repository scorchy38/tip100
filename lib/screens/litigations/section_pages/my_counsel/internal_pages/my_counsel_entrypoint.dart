import 'package:animations/animations.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/model/my_counsel_model.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/ancillary_details/ancillary_details_page.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/internal_pages/doc_storage/doc_storage_page.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/hearings_page.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/tasks/tasks_page.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/internal_pages/cases/cases_page.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/internal_pages/insights/insights_page.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/internal_pages/notices/notices_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../my_counsel/internal_pages/details/details_page.dart';

class MyCounselEntryPointUI extends StatefulWidget {
  int? counselID;
  MyCounselModel? myCounselData;
  MyCounselEntryPointUI({this.counselID, this.myCounselData, Key? key})
      : super(key: key);

  @override
  State<MyCounselEntryPointUI> createState() => MyCounselEntryPointUIState();
}

class MyCounselEntryPointUIState extends State<MyCounselEntryPointUI> {
  int _currentPage = 0;

  _onMenuChanged(int v) {
    _currentPage = v;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      DetailsPage(
        counselID: widget.counselID,
        myCounselData: widget.myCounselData,
      ),
      const InsightsPage(),
      DocStoragePage(myCounselData: widget.myCounselData),
      const CasesPage(),
      const NoticesPage(),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageTransitionSwitcher(
        transitionBuilder: ((child, primaryAnimation, secondaryAnimation) =>
            SharedAxisTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            )),
        child: _screens[_currentPage],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _onMenuChanged,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(_currentPage == 0
                  ? AppIcons.detailsActive
                  : AppIcons.details),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(_currentPage == 1
                  ? AppIcons.insightsActive
                  : AppIcons.insights),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(_currentPage == 2
                  ? AppIcons.docStorageActive
                  : AppIcons.docStorage),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                  _currentPage == 3 ? AppIcons.casesActive : AppIcons.cases),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                  _currentPage == 4 ? AppIcons.noticeActive : AppIcons.notice),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
