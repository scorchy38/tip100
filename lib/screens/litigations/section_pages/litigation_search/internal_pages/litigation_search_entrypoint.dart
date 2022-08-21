import 'package:animations/animations.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/internal_pages/orders/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'details/details_page.dart';
import 'hearings/hearings_page.dart';

class LitigationSearchEntryPointUI extends StatefulWidget {
  const LitigationSearchEntryPointUI({Key? key}) : super(key: key);

  @override
  State<LitigationSearchEntryPointUI> createState() =>
      LitigationSearchEntryPointUIState();
}

class LitigationSearchEntryPointUIState
    extends State<LitigationSearchEntryPointUI> {
  int _currentPage = 0;

  _onMenuChanged(int v) {
    _currentPage = v;
    setState(() {});
  }

  final List<Widget> _screens = [
    const DetailsPage(),
    const HearingsPage(),
    const OrdersPage(),
  ];

  @override
  Widget build(BuildContext context) {
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
                  ? AppIcons.hearingsActive
                  : AppIcons.hearings),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                  _currentPage == 2 ? AppIcons.ordersActive : AppIcons.orders),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
