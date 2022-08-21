import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_illustrations.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/doc_storage/components/doc_storage_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/doc_storage_card.dart';

class DocStoragePage extends StatefulWidget {
  const DocStoragePage({Key? key}) : super(key: key);

  @override
  State<DocStoragePage> createState() => _DocStoragePageState();
}

class _DocStoragePageState extends State<DocStoragePage>
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
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DocStorageHeader(),
                Expanded(
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.9,
                    child: ListView(
                      shrinkWrap: true,
                      children: const [
                        DocStorageCardFolder(
                          caseNumber: '195461836',
                          complaint:
                              'State Bank of India (SBI) Through Branch Manager',
                          court: 'Dashrath Singh Meena',
                          caseStage: 'Ongoing/ CS CCC - CIVIL SUIT (CCC)',
                          pdoh: '01 Mar, 2022',
                          ndoh: '21 Mar, 2022',
                          ndohRemark: 'Evidence of opposite party',
                        ),
                        DocStorageCardPDF(
                          caseNumber: '195461836',
                          complaint:
                              'State Bank of India (SBI) Through Branch Manager',
                          court: 'Dashrath Singh Meena',
                          caseStage: 'Ongoing/ CS CCC - CIVIL SUIT (CCC)',
                          pdoh: '01 Mar, 2022',
                          ndoh: '21 Mar, 2022',
                          ndohRemark: 'Evidence of opposite party',
                        ),
                        DocStorageCardFolder(
                          caseNumber: '195461836',
                          complaint:
                              'State Bank of India (SBI) Through Branch Manager',
                          court: 'Dashrath Singh Meena',
                          caseStage: 'Ongoing/ CS CCC - CIVIL SUIT (CCC)',
                          pdoh: '01 Mar, 2022',
                          ndoh: '21 Mar, 2022',
                          ndohRemark: 'Evidence of opposite party',
                        ),
                        DocStorageCardFolder(
                          caseNumber: '195461836',
                          complaint:
                              'State Bank of India (SBI) Through Branch Manager',
                          court: 'Dashrath Singh Meena',
                          caseStage: 'Ongoing/ CS CCC - CIVIL SUIT (CCC)',
                          pdoh: '01 Mar, 2022',
                          ndoh: '21 Mar, 2022',
                          ndohRemark: 'Evidence of opposite party',
                        ),
                        DocStorageCardFolder(
                          caseNumber: '195461836',
                          complaint:
                              'State Bank of India (SBI) Through Branch Manager',
                          court: 'Dashrath Singh Meena',
                          caseStage: 'Ongoing/ CS CCC - CIVIL SUIT (CCC)',
                          pdoh: '01 Mar, 2022',
                          ndoh: '21 Mar, 2022',
                          ndohRemark: 'Evidence of opposite party',
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
