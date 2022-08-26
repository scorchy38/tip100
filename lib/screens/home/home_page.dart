import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:tip100/core/components/icon_button_with_text.dart';
import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:tip100/screens/home/components/add_audio_tip.dart';
import 'package:tip100/screens/home/components/add_tip.dart';
import 'package:tip100/screens/home/components/bar_chart.dart';
import 'package:tip100/screens/home/components/bar_chart_expanded_card.dart';
import 'package:tip100/screens/home/components/bottom_sheet.dart';
import 'package:tip100/screens/home/components/case_by_against_chart.dart';
import 'package:tip100/screens/home/components/cases_chart.dart';
import 'package:tip100/screens/home/components/product_wise_chart.dart';
import 'package:tip100/screens/home/components/region_wise_chart.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tip100/screens/home/components/submitted_tips.dart';
import '../../core/components/search_box.dart';
import '../../core/constants/app_buttons.dart';
import '../../core/constants/app_defaults.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_illustrations.dart';
import '../../languages/languages.dart';
import '../../logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import '../../size_config.dart';
import '../entrypoint/entrypoint_ui.dart';
import '../litigations/section_pages/all_cases/internal_pages/doc_storage/components/rename_bottom_sheet.dart';
import 'components/filters.dart';
import 'components/line_chart.dart';

class HomePage extends StatefulWidget {
  StreamingSharedPreferences? streamPref;
   HomePage({this.streamPref,Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  VoidCallback? _showPersistantBottomSheetCallBack;

  void _showBottomSheet() {
    setState(() {
      _showPersistantBottomSheetCallBack = null;
    });

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const BottomNavSheet();
      },
    ).whenComplete(() {
      if (mounted) {
        setState(() {
          _showPersistantBottomSheetCallBack = _showBottomSheet;
        });
      }
    });
  }

  StreamingSharedPreferences? pref;
  initialize() async {
    final SharedPreferences _prefs =
    await SharedPreferences.getInstance();
    Dio dio = new Dio();

    Response response2 =
    await dio.get('https://tip100.herokuapp.com/getAllTippers');
    if (response2.statusCode == 200) {
      List resData2 = response2.data;

      resData2.forEach((element) {
        print(element);
        if (element['uid'] == "${_prefs.getString('token')}") {
          _prefs.setDouble("score", element['score']*1.0);
          setState(() {

          });
          pref?.setDouble('score', element['score']*1.0);
        }
      });

      // _prefs.setString("user_obj", jsonEncode(appuser.toJson()));
    } else {
    }
    setState(() {

    });
    pref = await StreamingSharedPreferences.instance;
    setState(() {

    });

  }

  @override
  void initState() {
    initialize();
    // context.read<BasicGraphsBloc>().add(BasicGraphsInitiate());
    // context.read<BasicGraphsBloc>().add(PopulateRegionWiseGraph());
    // context.read<BasicGraphsBloc>().add(PopulateCaseByAgainstGraph());
    // context.read<BasicGraphsBloc>().add(PopulateProductWiseComplaintsGraph());

    setState(() {});
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.offWhite,
            child: Column(
              children: [
                Container(
                  height: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      opacity: 0.7,
                      image: AssetImage('assets/images/bg2.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppDefaults.padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppImages.logo),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      //   child: InkWell(
                      //     onTap: null,
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //           boxShadow: [
                      //             BoxShadow(
                      //                 color: Color(0xFF2236470D).withOpacity(0.05),
                      //                 spreadRadius: 0,
                      //                 blurRadius: 10)
                      //           ],
                      //           borderRadius: BorderRadius.all(Radius.circular(10)),
                      //           color: AppColors.greenTag.withOpacity(0.6)),
                      //       child: Padding(
                      //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      //         child: Center(
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Icon(EvaIcons.checkmarkCircle2Outline, color: Colors.white,),
                      //               const SizedBox(
                      //                 width: 10,
                      //               ),
                      //               Text(
                      //                 'Mental Awareness Quiz Submitted',
                      //                 style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      //                     fontSize: 15,
                      //                     color: AppColors.white,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                pref == null
                    ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                CircleAvatar(
                                  backgroundColor:
                                  AppColors.primary,
                                  radius: 43,
                                  child: CircleAvatar(
                                    backgroundColor:
                                    Colors.white,
                                    backgroundImage: NetworkImage(
                                        "https://icons.veryicon.com/png/o/miscellaneous/xdh-font-graphics-library/anonymous-user.png"),
                                    radius: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 31.0),
                            child: Container(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Icon(EvaIcons.lockOutline),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            Languages.of(context).trustScore +  ':',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                fontSize: 19,
                                color: AppColors.primary,
                                fontWeight:
                                FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.0),
                            child: LinearPercentIndicator(
                              width: MediaQuery.of(context)
                                  .size
                                  .width -
                                  160,
                              animation: true,
                              lineHeight: 40.0,
                              animationDuration: 1000,
                              curve: Curves.linearToEaseOut,
                              percent: 0,
                              center: Text(
                                '0/100',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                    fontSize: 19,
                                    color:
                                    AppColors.primary,
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                              barRadius: Radius.circular(10),
                              progressColor: AppColors.appRed
                                  .withOpacity(0.9),
                              backgroundColor: Colors.black12,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            Languages.of(context).sessionAnonymous,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                fontSize: 17,
                                color: AppColors.primary,
                                fontWeight:
                                FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
                    : PreferenceBuilder<double>(
                        preference:
                            pref!.getDouble('score', defaultValue: 0.0),
                        builder: (BuildContext context, double score) {
                          return score == 0
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                CircleAvatar(
                                                  backgroundColor:
                                                      AppColors.primary,
                                                  radius: 43,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: NetworkImage(
                                                        "https://icons.veryicon.com/png/o/miscellaneous/xdh-font-graphics-library/anonymous-user.png"),
                                                    radius: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 31.0),
                                            child: Container(
                                                color: Colors.white,
                                                child: Column(
                                                  children: [
                                                    Icon(EvaIcons.lockOutline),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            Languages.of(context).trustScore +  ':',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.copyWith(
                                                    fontSize: 19,
                                                    color: AppColors.primary,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: LinearPercentIndicator(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  160,
                                              animation: true,
                                              lineHeight: 40.0,
                                              animationDuration: 1000,
                                              curve: Curves.linearToEaseOut,
                                              percent: 0,
                                              center: Text(
                                                '0/100',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                        fontSize: 19,
                                                        color:
                                                            AppColors.primary,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              barRadius: Radius.circular(10),
                                              progressColor: AppColors.appRed
                                                  .withOpacity(0.9),
                                              backgroundColor: Colors.black12,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            Languages.of(context).sessionAnonymous,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.copyWith(
                                                    fontSize: 17,
                                                    color: AppColors.primary,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                CircleAvatar(
                                                  backgroundColor:
                                                      AppColors.primary,
                                                  radius: 43,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.white,
                                                    backgroundImage: NetworkImage(
                                                        "https://icons.veryicon.com/png/o/miscellaneous/xdh-font-graphics-library/anonymous-user.png"),
                                                    radius: 40,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 31.0),
                                            child: Container(
                                                color: Colors.white,
                                                child: Column(
                                                  children: [
                                                    Icon(EvaIcons.lockOutline),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                          Languages.of(context).trustScore +  ':',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.copyWith(
                                                    fontSize: 19,
                                                    color: AppColors.primary,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: LinearPercentIndicator(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  160,
                                              animation: true,
                                              lineHeight: 40.0,
                                              animationDuration: 1000,
                                              curve: Curves.linearToEaseOut,
                                              percent: score/ 100,
                                              // percent: 0.27,
                                              center: Text(
                                                '$score/100',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.copyWith(
                                                        fontSize: 19,
                                                        color:
                                                            AppColors.primary,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                              barRadius: Radius.circular(10),
                                              progressColor:score>=35? AppColors.greenTag
                                                  .withOpacity(0.9):AppColors.appRed
                                                  .withOpacity(0.9),
                                              backgroundColor: Colors.black12,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                          Languages.of(context).sessionAnonymous,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.copyWith(
                                                    fontSize: 17,
                                                    color: AppColors.primary,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                        }),

//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Text(
//                     'Submit a completely anonymous tip to the local police on minor crimes, such as bike, car theft, or brutality across the states.',
//                     style: Theme.of(context).textTheme.bodyText1?.copyWith(
//                         fontSize: 20,
//                         color: AppColors.primary,
//                         fontWeight: FontWeight.bold),),
//                 ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: AppColors.primary.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          Languages.of(context).witnessCrime,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(

                                    fontSize: 17,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.normal),
                          ),
                          Text(
                              Languages.of(context).anonymousAndSafe,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                    fontSize: 17,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AddTip()));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color(0xFF2236470D).withOpacity(0.05),
                                        spreadRadius: 0,
                                        blurRadius: 10)
                                  ],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: AppColors.primary),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        EvaIcons.editOutline,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        Languages.of(context).reportIt,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                                fontSize: 15,
                                                color: AppColors.white,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    //   child: InkWell(
                    //     onTap: () {
                    //       // Navigator.push(
                    //       //     context,
                    //       //     MaterialPageRoute(
                    //       //         builder: (context) => RecorderExample()));
                    //     },
                    //     child: Container(
                    //       width: 160,
                    //       height: 120,
                    //       decoration: BoxDecoration(
                    //           boxShadow: [
                    //             BoxShadow(
                    //                 color:
                    //                     Color(0xFF2236470D).withOpacity(0.05),
                    //                 spreadRadius: 0,
                    //                 blurRadius: 10)
                    //           ],
                    //           borderRadius:
                    //               BorderRadius.all(Radius.circular(10)),
                    //           color: AppColors.appRed.withOpacity(0.9)),
                    //       child: Padding(
                    //         padding: const EdgeInsets.symmetric(
                    //             horizontal: 8, vertical: 16),
                    //         child: Center(
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Icon(
                    //                 EvaIcons.alertTriangleOutline,
                    //                 color: Colors.white,
                    //               ),
                    //               const SizedBox(
                    //                 height: 10,
                    //               ),
                    //               Text(
                    //                 'Emergency Tip',
                    //                 style: Theme.of(context)
                    //                     .textTheme
                    //                     .bodyText1
                    //                     ?.copyWith(
                    //                         fontSize: 15,
                    //                         color: AppColors.white,
                    //                         fontWeight: FontWeight.bold),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: InkWell(
                        onTap: () {
                          context
                              .read<AllCasesBloc>()
                              .add(AllCasesGetInitialCases());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SubmittedTips()));
                        },
                        child: Container(
                          // width: 160,
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 120,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color:
                                        Color(0xFF2236470D).withOpacity(0.05),
                                    spreadRadius: 0,
                                    blurRadius: 10)
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: AppColors.primary),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    EvaIcons.messageSquareOutline,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    Languages.of(context).messages,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            fontSize: 15,
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          context: context,
                          builder: (context) => RenameSheet());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Color(0xFF2236470D).withOpacity(0.05),
                                spreadRadius: 0,
                                blurRadius: 10)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: AppColors.primary),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                EvaIcons.globe,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                Languages.of(context).labelSelectLanguage,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        fontSize: 15,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
