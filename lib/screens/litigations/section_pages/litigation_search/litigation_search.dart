import 'package:tip100/core/components/icon_button_with_text.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/core/constants/app_images.dart';

import 'package:tip100/screens/litigations/section_pages/litigation_search/internal_pages/litigation_search_entrypoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/litigation_search_card.dart';
import 'components/litigation_search_dropdown.dart';
import 'components/litigation_search_header.dart';

class LitigationSearchPage extends StatefulWidget {
  const LitigationSearchPage({Key? key}) : super(key: key);

  @override
  State<LitigationSearchPage> createState() => _LitigationSearchPageState();
}

class _LitigationSearchPageState extends State<LitigationSearchPage> {
  bool displaySwitch = true;
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
                LitigationSearchHeader(),
                LitigationSearchDropdown(),
                displaySwitch
                    ? InkWell(
                        onTap: () {
                          displaySwitch = false;
                          setState(() {});
                        },
                        child: Center(
                          child: SizedBox(
                              // width: MediaQuery.of(context).size.width * 0.9,
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AppImages.searchPageUI),
                              Text(
                                'Search any Litigation across all courts',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        fontSize: 17,
                                        // fontWeight: FontWeight.bold,
                                        color: AppColors.appGrey),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                width: 140,
                                child: IconButtonWithText(
                                  onTap: () {},
                                  buttonColor: AppColors.greenTag,
                                  buttonIcon: AppIcons.filter,
                                  buttonText: 'Search & Filter',
                                ),
                              ),
                            ],
                          )),
                        ),
                      )
                    : Expanded(
                        child: SizedBox(
                          // width: MediaQuery.of(context).size.width * 0.9,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) => index == 4
                                  ? const Padding(
                                      padding: EdgeInsets.only(bottom: 30),
                                      child: CaseCard(
                                        lawyerName: 'Tanya Mahajan',
                                        location: 'Noida, UP',
                                        phoneNumber: '83015653356',
                                        email: 'tanyamahajan10@gmail.com',
                                      ),
                                    )
                                  : InkWell(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LitigationSearchEntryPointUI())),
                                      child: const CaseCard(
                                        lawyerName: 'Tanya Mahajan',
                                        location: 'Noida, UP',
                                        phoneNumber: '83015653356',
                                        email: 'tanyamahajan10@gmail.com',
                                      ),
                                    )),
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
