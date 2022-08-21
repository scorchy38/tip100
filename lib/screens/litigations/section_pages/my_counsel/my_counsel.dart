import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/logic/bloc/my_counsel_bloc/my_counsel_bloc.dart';
import 'package:tip100/model/my_counsel_model.dart';
import 'package:tip100/screens/home/components/bar_chart.dart';
import 'package:tip100/screens/litigations/components/litigations_sections.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/components/all_cases_dropdown.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/components/case_explorer_dropdown.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/internal_pages/my_counsel_entrypoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/my_counsel_card.dart';
import 'components/my_counsel_dropdown.dart';
import 'components/my_counsel_header.dart';

class MyCounselPage extends StatefulWidget {
  const MyCounselPage({Key? key}) : super(key: key);

  @override
  State<MyCounselPage> createState() => _MyCounselPageState();
}

class _MyCounselPageState extends State<MyCounselPage> {
  @override
  void initState() {
    //added the pagination function with listener
    context.read<MyCounselBloc>().add(MyCounselRefreshing());
    context.read<MyCounselBloc>().add(MyCounselGetAllCounsels());

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
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyCounselHeader(),
                MyCounselDropdown(),
                Expanded(
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.9,
                    child: Builder(
                      builder: (context) {
                        List<MyCounselModel>? myCounsels = [];
                        myCounsels =
                            context.watch<MyCounselBloc>().state.all_counsels;
                        int totalCount =
                            context.watch<MyCounselBloc>().state.totalCounsels!;

                        // if (context.watch<AllCasesBloc>().state.noCasesFound ==
                        //     true) {
                        //   return Column(
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: [
                        //       Center(
                        //           child: Image.asset(AppImages.searchPageUI)),
                        //       Center(
                        //         child: Text(
                        //           'Unable to find requested case details',
                        //           style: Theme.of(context)
                        //               .textTheme
                        //               .bodyLarge
                        //               ?.copyWith(
                        //               fontSize: 17,
                        //               // fontWeight: FontWeight.bold,
                        //               color: AppColors.appGrey),
                        //         ),
                        //       ),
                        //     ],
                        //   );
                        // } else
                        if (context
                                .watch<MyCounselBloc>()
                                .state
                                .noCounselsFound ==
                            true) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                  child: Image.asset(AppImages.searchPageUI)),
                              Center(
                                child: Text(
                                  'Unable to find requested counsels',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: 17,
                                          // fontWeight: FontWeight.bold,
                                          color: AppColors.appGrey),
                                ),
                              ),
                            ],
                          );
                        } else if (context
                                .watch<MyCounselBloc>()
                                .state
                                .totalCounsels ==
                            0) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: myCounsels?.length,
                              itemBuilder: (context, index) =>
                                  CaseCard(counselData: myCounsels![index]));
                        }
                      },
                    ),
                  ),
                )
                // Expanded(
                //   child: SizedBox(
                //     // width: MediaQuery.of(context).size.width * 0.9,
                //     child: ListView.builder(
                //         shrinkWrap: true,
                //         itemCount: 5,
                //         itemBuilder: (context, index) => index == 4
                //             ? Padding(
                //                 padding: EdgeInsets.only(bottom: 30),
                //                 child: InkWell(
                //                   onTap: () {
                //                     Navigator.push(
                //                         context,
                //                         MaterialPageRoute(
                //                             builder: (context) =>
                //                                 const MyCounselEntryPointUI()));
                //                   },
                //                   child: CaseCard(
                //                     lawyerName: 'Tanya Mahajan',
                //                     location: 'Noida, UP',
                //                     phoneNumber: '83015653356',
                //                     email: 'tanyamahajan10@gmail.com',
                //                   ),
                //                 ),
                //               )
                //             : InkWell(
                //                 onTap: () {
                //                   Navigator.push(
                //                       context,
                //                       MaterialPageRoute(
                //                           builder: (context) =>
                //                               const MyCounselEntryPointUI()));
                //                 },
                //                 child: const CaseCard(
                //                   lawyerName: 'Tanya Mahajan',
                //                   location: 'Noida, UP',
                //                   phoneNumber: '83015653356',
                //                   email: 'tanyamahajan10@gmail.com',
                //                 ),
                //               )),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
