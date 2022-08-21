import 'package:animations/animations.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/ancillary_details/ancillary_details_page.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/details/details_page.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/doc_storage/doc_storage_page.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/hearings_page.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/tasks/tasks_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AllCasesEntryPointUI extends StatefulWidget {
  int caseId;
  AllCasesEntryPointUI(this.caseId, {Key? key}) : super(key: key);

  @override
  State<AllCasesEntryPointUI> createState() => AllCasesEntryPointUIState();
}

class AllCasesEntryPointUIState extends State<AllCasesEntryPointUI> {
  int _currentPage = 0;

  _onMenuChanged(int v) {
    _currentPage = v;
    setState(() {});
  }

//TODO: Made Crucial Change
  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      DetailsPage(widget.caseId),
      const AncillaryPage(),
      const DocStoragePage(),
      HearingsPage(widget.caseId),
      const TasksPage(),
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
                  ? AppIcons.ancillaryActive
                  : AppIcons.ancillary),
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
              child: SvgPicture.asset(_currentPage == 3
                  ? AppIcons.hearingsActive
                  : AppIcons.hearings),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                  _currentPage == 4 ? AppIcons.tasksActive : AppIcons.tasks),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
