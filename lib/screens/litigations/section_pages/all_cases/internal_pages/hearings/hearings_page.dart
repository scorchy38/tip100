import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_illustrations.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/logic/bloc/add_hearing_bloc/add_hearing_bloc.dart';
import 'package:tip100/logic/bloc/form_submission.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/components/add_new_hearing.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/components/all_cases_hearings_filers.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/components/hearings_card_automatic.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/components/hearings_card_manual.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/hearings/components/hearings_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/components/icon_button_with_text.dart';
import '../../../../../../core/components/small_button.dart';
import '../../../../../../core/constants/app_icons.dart';
import '../../../../../../logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';

class HearingsPage extends StatefulWidget {
  int caseId;
  HearingsPage(this.caseId, {Key? key}) : super(key: key);

  @override
  State<HearingsPage> createState() => _HearingsPageState();
}

class _HearingsPageState extends State<HearingsPage>
    with SingleTickerProviderStateMixin {
  String dropdownValue = 'Added Automatic';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  // TabController? _controller;
  int? _selectedIndex = 0;
  VoidCallback? _showPersistantBottomSheetCallBack;
  // @override
  // void initState() {
  //   _controller = new TabController(length: 2, vsync: this);
  //
  //   _controller?.addListener(() {
  //     setState(() {
  //       _selectedIndex = _controller?.index;
  //     });
  //     // Do whatever you want based on the tab index
  //   });
  //   super.initState();
  // }
  ScrollController _scrollViewController = ScrollController();
  bool _showAppbar = true;
  @override
  void initState() {
    super.initState();
    // _allCasesDetailsBloc = AllCasesDetailsBloc(
    //     allCasesDetailsRepository: AllCasesDetailsRepository());

    _scrollViewController = new ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppbar = false;
          setState(() {});
        }
      }

      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppbar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
  }

  bool isScrollingDown = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: context
                    .watch<AllCasesDetailsBloc>()
                    .state
                    .manualHearingsLoading !=
                true
            ? Column(
                children: [
                  AnimatedContainer(
                      height: _showAppbar ? 100.0 : 0.0,
                      duration: Duration(milliseconds: 200),
                      child: Padding(
                        padding: const EdgeInsets.all(AppDefaults.padding / 2),
                        child: Card(
                          elevation: 4,
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                InkWell(
                                  onTap: () => Navigator.pop(context),
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: AppColors.textColorBlack,
                                  ),
                                ),
                                Spacer(),
                                SmallButton(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AllCasesHearingFilters()));
                                    },
                                    buttonColor: AppColors.purpleTag,
                                    buttonIcon: AppIcons.filter),
                                SizedBox(
                                  width: 10,
                                ),
                                dropdownValue == 'Added Manual'
                                    ? IconButtonWithText(
                                        onTap: () async {
                                          context.read<AddHearingBloc>().add(
                                              AddHearingInitial(
                                                  caseId: widget.caseId,
                                                  date_of_hearing: '',
                                                  title: '',
                                                  hearing_description: '',
                                                  hearing_status: '',
                                                  hearing_stage: MAXINT,
                                                  formSubmissionStatus:
                                                      InitialFormStatus()));
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AddNewHearing(
                                                          widget.caseId)));
                                          // final SharedPreferences _prefs =
                                          // await SharedPreferences.getInstance();
                                          // var headers = {
                                          //   'Accept': '*/*',
                                          //   'Accept-Language': 'en-US,en;q=0.9',
                                          //   'Authorization': 'JWT ${_prefs.getString('token')}',
                                          //   'Connection': 'keep-alive',
                                          //   'Accept-Encoding': 'gzip',
                                          // };
                                          //
                                          // var url = Uri.parse(
                                          //     'https://corporate.legistify.com/api/organization-member/2601879/list_assigned_user/');
                                          // var res = await http.get(url, headers: headers);
                                          // if (res.statusCode != 200)
                                          //   throw Exception(
                                          //       'http.get error: statusCode= ${res.statusCode}');
                                          // print(res.body);
                                          // List usersMaps = await json.decode(res.body);
                                          // List<TaskAssignedUser> users = await List.generate(
                                          //     usersMaps.length,
                                          //         (index) => TaskAssignedUser.fromJson(usersMaps[index]));
                                          //
                                          // Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //         builder: (context) => CreateNewTask(
                                          //           usersToAssign: users,
                                          //         )));
                                          //
                                        },
                                        buttonColor: AppColors.greenTag,
                                        buttonIcon: AppIcons.addButton,
                                        buttonText: 'New Hearing',
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(AppDefaults.padding / 2),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            Container(
                                height: 35,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: AppColors.purpleTag,
                                        width: 1,
                                        style: BorderStyle.solid),
                                    borderRadius: BorderRadius.circular(8)),
                                child: DropdownButton<String>(
                                    value: dropdownValue,
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: AppColors.purpleTag,
                                    ),
                                    items: <String>[
                                      'Added Automatic',
                                      'Added Manual'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: AppColors.textColorBlack,
                                                fontWeight: FontWeight.w500),
                                          ));
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      // do something here

                                      setState(() {
                                        dropdownValue =
                                            newValue ?? dropdownValue;
                                      });
                                    },
                                    underline: DropdownButtonHideUnderline(
                                        child: Container(
                                      width: 50,
                                    )))),
                            SizedBox(
                              width: AppDefaults.padding,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          elevation: 4,
                          color: AppColors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                // mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text(
                                    '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.caseExplorerDetail!.caseNo!}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textColorBlack),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    '${context.watch<AllCasesDetailsBloc>().state.caseDetails!.title!}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.copyWith(
                                            fontSize: 15,
                                            color: AppColors.appGrey,
                                            fontWeight: FontWeight.w500),
                                  )

                                  // SmallButton(
                                  //     buttonColor: AppColors.primary,
                                  //     buttonIcon: AppIcons.addButton),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: ListView.builder(
                          controller: _scrollViewController,
                          shrinkWrap: true,
                          itemCount: dropdownValue == 'Added Manual'
                              ? context
                                  .watch<AllCasesDetailsBloc>()
                                  .state
                                  .manualHearings!
                                  .length
                              : context
                                  .watch<AllCasesDetailsBloc>()
                                  .state
                                  .automaticHearings!
                                  .length,
                          itemBuilder: (context, index) =>
                              dropdownValue == 'Added Automatic'
                                  ? HearingsCardAutomatic(
                                      automaticHearing: context
                                          .watch<AllCasesDetailsBloc>()
                                          .state
                                          .automaticHearings![index],
                                    )
                                  : HearingsCardManual(
                                      manualHearingDetails: context
                                          .watch<AllCasesDetailsBloc>()
                                          .state
                                          .manualHearings![index],
                                    )),
                    ),
                  ),
                ],
              )
            : Container(
                color: AppColors.offWhite,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
        // Container(
        //   color: AppColors.offWhite,
        //   height: MediaQuery.of(context).size.height,
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       HearingsHeader(),
        //
        //       // SizedBox(
        //       //   height: 100,
        //       // )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
