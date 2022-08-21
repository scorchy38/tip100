import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/core/constants/app_illustrations.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/logic/bloc/my_counsel_details_bloc/my_counsel_details_bloc.dart';
import 'package:tip100/model/my_counsel_model.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/details/components/case_manager_details_card.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/details/components/corporate_details_card.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/details/components/details_header.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/details/components/followers_card.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/details/components/linked_cases_card.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/details/components/linked_notices_card.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/internal_pages/details/components/address_details_card.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/internal_pages/details/components/court_details_card.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/internal_pages/details/components/legal_areas_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'components/bank_details_card.dart';
import 'components/cta_button.dart';
import 'components/lawyer_details_card.dart';

class DetailsPage extends StatefulWidget {
  int? counselID;
  MyCounselModel? myCounselData;
  DetailsPage({this.counselID, this.myCounselData, Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  VoidCallback? _showPersistantBottomSheetCallBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.tertiary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.offWhite,
            child: context.watch<MyCounselDetailsBloc>().state.loading == true
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DetailsHeader(),
                      LawyerDetailsCard(
                          context
                              .watch<MyCounselDetailsBloc>()
                              .state
                              .counselDetails!,
                          widget.myCounselData!),
                      AddressDetailsCard(
                          context
                              .watch<MyCounselDetailsBloc>()
                              .state
                              .counselDetails!,
                          widget.myCounselData!),
                      BankDetailsCard(
                          context
                              .watch<MyCounselDetailsBloc>()
                              .state
                              .counselDetails!,
                          widget.myCounselData!),
                      CourtDetailsCard(
                          context
                              .watch<MyCounselDetailsBloc>()
                              .state
                              .counselDetails!,
                          widget.myCounselData!),
                      LegalAreasCard(
                          context
                              .watch<MyCounselDetailsBloc>()
                              .state
                              .counselDetails!,
                          widget.myCounselData!),
                      // // CaseManagerDetailsCard(),
                      // LinkedCasesCard(123),
                      // LinkedNoticesCard(123),
                      // CorporateDetailsCard(),
                      // FollowersCard(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
