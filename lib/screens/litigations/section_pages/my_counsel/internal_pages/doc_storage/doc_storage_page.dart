import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_illustrations.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/logic/bloc/all_cases_details_bloc/all_cases_details_repository.dart';
import 'package:tip100/logic/bloc/my_counsel_details_bloc/my_counsel_details_bloc.dart';
import 'package:tip100/model/my_counsel_model.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/doc_storage/components/doc_storage_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';
import '../../../case_explorer/internal_pages/details/components/details_header.dart';
import 'components/doc_storage_card.dart';

class DocStoragePage extends StatefulWidget {
  MyCounselModel? myCounselData;
  DocStoragePage({this.myCounselData, Key? key}) : super(key: key);

  @override
  State<DocStoragePage> createState() => _DocStoragePageState();
}

class _DocStoragePageState extends State<DocStoragePage>
    with SingleTickerProviderStateMixin {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  VoidCallback? _showPersistantBottomSheetCallBack;
  ScrollController _scrollViewController = ScrollController();
  bool _showAppbar = true;

  @override
  void initState() {
    super.initState();

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
        child: context.watch<MyCounselDetailsBloc>().state.docStorageLoading !=
                true
            ? Column(
                children: [
                  DocStorageHeader(),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: context
                          .watch<MyCounselDetailsBloc>()
                          .state
                          .docStorageItems!
                          .length,
                      controller: _scrollViewController,
                      itemBuilder: (context, index) {
                        return DocStorageCardPDF(
                            docStorageItem: context
                                .watch<MyCounselDetailsBloc>()
                                .state
                                .docStorageItems![index],
                            myCounselData: widget.myCounselData!);
                      },
                      // children: const [
                      //
                      //   DocStorageCardPDF(
                      //     caseNumber: '195461836',
                      //     complaint:
                      //         'State Bank of India (SBI) Through Branch Manager',
                      //     court: 'Dashrath Singh Meena',
                      //     caseStage: 'Ongoing/ CS CCC - CIVIL SUIT (CCC)',
                      //     pdoh: '01 Mar, 2022',
                      //     ndoh: '21 Mar, 2022',
                      //     ndohRemark: 'Evidence of opposite party',
                      //   ),
                      //   DocStorageCardFolder(
                      //     caseNumber: '195461836',
                      //     complaint:
                      //         'State Bank of India (SBI) Through Branch Manager',
                      //     court: 'Dashrath Singh Meena',
                      //     caseStage: 'Ongoing/ CS CCC - CIVIL SUIT (CCC)',
                      //     pdoh: '01 Mar, 2022',
                      //     ndoh: '21 Mar, 2022',
                      //     ndohRemark: 'Evidence of opposite party',
                      //   ),
                      //   DocStorageCardFolder(
                      //     caseNumber: '195461836',
                      //     complaint:
                      //         'State Bank of India (SBI) Through Branch Manager',
                      //     court: 'Dashrath Singh Meena',
                      //     caseStage: 'Ongoing/ CS CCC - CIVIL SUIT (CCC)',
                      //     pdoh: '01 Mar, 2022',
                      //     ndoh: '21 Mar, 2022',
                      //     ndohRemark: 'Evidence of opposite party',
                      //   ),
                      //   Padding(
                      //     padding: EdgeInsets.only(bottom: 130),
                      //     child: DocStorageCardFolder(
                      //       caseNumber: '195461836',
                      //       complaint:
                      //           'State Bank of India (SBI) Through Branch Manager',
                      //       court: 'Dashrath Singh Meena',
                      //       caseStage: 'Ongoing/ CS CCC - CIVIL SUIT (CCC)',
                      //       pdoh: '01 Mar, 2022',
                      //       ndoh: '21 Mar, 2022',
                      //       ndohRemark: 'Evidence of opposite party',
                      //     ),
                      //   )
                      // ],
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
      ),
    );
  }
}
