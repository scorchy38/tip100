import 'package:animations/animations.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/languages/languages.dart';
import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:tip100/logic/bloc/singin_repository.dart';
import 'package:tip100/screens/home/components/chat_page.dart';
import 'package:tip100/screens/ipr/ipr.dart';
import 'package:tip100/screens/litigations/litigations.dart';
import 'package:tip100/screens/more/components/options_card.dart';
import 'package:tip100/screens/more/more.dart';
import 'package:tip100/screens/notice/notice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bip39/bip39.dart' as bip39;

import '../../core/constants/app_icons.dart';
import '../../languages/local_constants.dart';
import '../../size_config.dart';
import '../home/home_page.dart';
import '../litigations/section_pages/all_cases/all_cases.dart';

class EntryPointUI extends StatefulWidget {
  StreamingSharedPreferences? pref;
  EntryPointUI({this.pref, Key? key}) : super(key: key);

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
     HomePage(),
    const AllCasesPage(),
    // const ChatPage(
    //     peerNickname: 'POLICE',
    //     peerAvatar:
    //         'https://upload.wikimedia.org/wikipedia/en/8/86/Avatar_Aang.png',
    //     peerId: 'POLICE',
    //     userAvatar:
    //         'https://upload.wikimedia.org/wikipedia/en/8/86/Avatar_Aang.png'),
    const MorePage(),
  ];
  final GlobalKey<ScaffoldState> key = GlobalKey(); // Create a key
  TextEditingController phraseController = new TextEditingController();
  bool submitting = false;
  bool showSignUp = false;
  @override
  Widget build(BuildContext context1) {
    SizeConfig().init(context);

    return PreferenceBuilder<String>(
        preference: widget.pref!.getString('token', defaultValue: "null"),
        builder: (BuildContext context, String token) {
          return token.length > 5
              ? Scaffold(
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
                      transitionBuilder: ((child, primaryAnimation,
                              secondaryAnimation) =>
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
                            child: SvgPicture.asset(_currentPage == 0
                                ? AppIcons.homeActive
                                : AppIcons.home),
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
                            onTap: () => Scaffold.of(context)
                                .openEndDrawer(), // <-- Opens drawer.

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(_currentPage == 2
                                  ? AppIcons.moreActive
                                  : AppIcons.more),
                            ),
                          ),
                          label: '',
                        ),
                      ],
                    );
                  }),
                )
              : Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [AppColors.primary, AppColors.appRed])),
                  child: Scaffold(
                      // By defaut, Scaffold background is white
                      // Set its value to transparent
                      backgroundColor: Colors.transparent,
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              // color: Colors.white,
                              child:
                                  Image.asset('assets/images/TIP100Logo.jpeg'),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            showSignUp
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: AppDefaults.padding * 2),
                                    child: AppTextField(
                                      false,
                                      phraseController,
                                      'Login Phrase',
                                      1,
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      helper:
                                          'This login phrase will be used to authenticate your account.\n',
                                      showCopyIcon: true,
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: AppDefaults.padding * 2),
                                    child: AppTextField(
                                      false,
                                      phraseController,
                                      'Login Phrase',
                                      1,
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      helper: 'Enter your login phrase\n',
                                    ),
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            showSignUp
                                ? InkWell(
                                    onTap: () async {
                                      SigninRepository()
                                          .createUser(phraseController.text);

                                      setState(() {
                                        submitting = true;
                                      });
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      elevation: 4,
                                      color: AppColors.primary,
                                      child: submitting == true
                                          ? Container(
                                              width: 95,
                                              height: 45,
                                              child: Center(
                                                child: CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(14.0),
                                              child: Text(
                                                'Create Account',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                        color: AppColors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15),
                                              ),
                                            ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () async {
                                      SigninRepository()
                                          .login(phraseController.text);

                                      setState(() {
                                        submitting = true;
                                      });
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      elevation: 4,
                                      color: AppColors.primary,
                                      child: submitting == true
                                          ? Container(
                                              width: 95,
                                              height: 45,
                                              child: Center(
                                                child: CircleAvatar(
                                                  radius: 10,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Padding(
                                              padding:
                                                  const EdgeInsets.all(14.0),
                                              child: Text(
                                                'Login',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                        color: AppColors.white,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15),
                                              ),
                                            ),
                                    ),
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            showSignUp
                                ? InkWell(
                                    onTap: () async {
                                      // String randomMnemonic =
                                      //     await bip39.generateMnemonic();
                                      setState(() {
                                        phraseController.clear();
                                        showSignUp = false;
                                      });
                                    },
                                    child: Text(
                                      'Already have an account? Go to login page.',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () async {
                                      String randomMnemonic =
                                          await bip39.generateMnemonic();
                                      setState(() {
                                        phraseController.text = randomMnemonic;
                                        showSignUp = true;
                                      });
                                    },
                                    child: Text(
                                      'Dont have a login phrase? Signup instead.',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                          ],
                        ),
                      )),
                );
        });
  }
}
