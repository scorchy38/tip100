import 'package:animations/animations.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:tip100/logic/bloc/singin_repository.dart';
import 'package:tip100/screens/ipr/ipr.dart';
import 'package:tip100/screens/litigations/litigations.dart';
import 'package:tip100/screens/more/components/options_card.dart';
import 'package:tip100/screens/more/more.dart';
import 'package:tip100/screens/notice/notice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/app_icons.dart';
import '../../size_config.dart';
import '../home/home_page.dart';
import '../litigations/section_pages/all_cases/all_cases.dart';

class EntryPointUI extends StatefulWidget {
  const EntryPointUI({Key? key}) : super(key: key);

  @override
  State<EntryPointUI> createState() => _EntryPointUIState();
}

class _EntryPointUIState extends State<EntryPointUI> {
  int _currentPage = 0;

  _onMenuChanged(int v) {
    _currentPage = v;

    setState(() {});
  }

  printToken() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    // if (_prefs.containsKey('token'))
    //   print(_prefs.getString('token'));
    // else
    SigninRepository().login('Tarun@legistify.com', 'F@mily12345');
  }

  @override
  void initState() {
    printToken();
    context.read<BasicGraphsBloc>().add(ChangeGraphsDuration(
        durationSelected: BasicGraphsState().PAST1YEARKEY));
    // TODO: implement initState
    super.initState();
  }

  final List<Widget> _screens = [
    const HomePage(),
    const AllCasesPage(),
    const MorePage(),
  ];
  final GlobalKey<ScaffoldState> key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context1) {
    SizeConfig().init(context);

    return Scaffold(
      key: key,
      resizeToAvoidBottomInset: false,
      endDrawer: Drawer(
        // width: 320,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: AppDefaults.padding),
                  //   child: SvgPicture.asset(AppImages.logo),
                  // ),
                  const SizedBox(
                    height: 40,
                  ),
                  OptionsCard(
                    toggle: false,
                    cardtitle: 'Tickets',
                    newTag: true,
                    cardColor: Colors.grey.shade200,
                    icon: AppIcons.tickets,
                  ),
                  OptionsCard(
                    toggle: false,
                    cardtitle: 'Notifications',
                    newTag: true,
                    cardColor: Colors.grey.shade200,
                    icon: AppIcons.notifications,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OptionsCard(
                    toggle: false,
                    cardtitle: 'Stored Precedents',
                    newTag: false,
                    cardColor: Colors.grey.shade200,
                    icon: AppIcons.storedPrecedents,
                  ),
                  OptionsCard(
                    toggle: false,
                    cardtitle: 'Calendar',
                    newTag: false,
                    cardColor: Colors.grey.shade200,
                    icon: AppIcons.calendar,
                  ),
                  OptionsCard(
                    toggle: false,
                    cardtitle: 'MIS',
                    newTag: false,
                    cardColor: Colors.grey.shade200,
                    icon: AppIcons.mis,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OptionsCard(
                    toggle: false,
                    cardtitle: 'Profile',
                    newTag: false,
                    cardColor: Colors.grey.shade200,
                    icon: AppIcons.user,
                  ),
                  OptionsCard(
                    toggle: true,
                    cardtitle: 'Dark Mode',
                    newTag: false,
                    cardColor: Colors.grey.shade200,
                    icon: AppIcons.darkMode,
                  ),
                  OptionsCard(
                    toggle: false,
                    cardtitle: 'Settings',
                    newTag: false,
                    cardColor: Colors.grey.shade200,
                    icon: AppIcons.settings,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Builder(
        builder: (ctx) => PageTransitionSwitcher(
          transitionBuilder: ((child, primaryAnimation, secondaryAnimation) =>
              SharedAxisTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              )),
          child: _screens[_currentPage],
        ),
      ),
      bottomNavigationBar: Builder(builder: (context) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onMenuChanged,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                    _currentPage == 0 ? AppIcons.homeActive : AppIcons.home),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(_currentPage == 1
                    ? AppIcons.alert
                    : AppIcons.alertActive),
              ),
              label: '',
            ),


            BottomNavigationBarItem(
              icon: InkWell(
                onTap: () =>
                    Scaffold.of(context).openEndDrawer(), // <-- Opens drawer.

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                      _currentPage == 2 ? AppIcons.moreActive : AppIcons.more),
                ),
              ),
              label: '',
            ),
          ],
        );
      }),
    );
  }
}
