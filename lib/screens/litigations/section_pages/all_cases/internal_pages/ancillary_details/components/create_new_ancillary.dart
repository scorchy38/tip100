import 'package:tip100/core/components/dropdown.dart';
import 'package:tip100/core/components/dropdown_large.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../size_config.dart';

class CreateNewAncillary extends StatefulWidget {
  const CreateNewAncillary({Key? key}) : super(key: key);

  @override
  _CreateNewAncillaryState createState() => _CreateNewAncillaryState();
}

class _CreateNewAncillaryState extends State<CreateNewAncillary> {
  TextEditingController sectionTitle = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: Text(
          'Create New Section',
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SvgPicture.asset(
              AppIcons.close,
              color: Colors.black,
              height: 15,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: AppDefaults.padding,
                    top: AppDefaults.padding,
                    right: AppDefaults.padding),
                child: AppTextField(false, sectionTitle, 'Section Title', 1.2),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeDropdown(
                        //   'Case Type', const <String>[
                        // 'Case Type',
                        // 'CaseType1',
                        // 'CaseType2',
                        // 'CaseType3']
                        ),
                    AppLargeDropdown(
                        //   'Court', const <String>[
                        // 'Court',
                        // 'CaseType1',
                        // 'CaseType2',
                        // 'CaseType3']
                        ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeDropdown(
                        //     'City', const <String>[
                        //   'City',
                        //   'CaseType1',
                        //   'CaseType2',
                        //   'CaseType3'
                        // ]
                        ),
                    AppLargeDropdown(
                        //     'Priority', const <String>[
                        //   'Priority',
                        //   'CaseType1',
                        //   'CaseType2',
                        //   'CaseType3'
                        // ]
                        ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
                child: AppTextField(false, summaryController, 'Summary', 5),
              ),
            ],
          ),
          Container(
            height: getProportionateScreenHeight(96),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(0.4))
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Text(
                      'Clear All',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppColors.appGrey,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 4,
                    color: (sectionTitle.value.text.length > 2 &&
                            summaryController.value.text.length > 2)
                        ? AppColors.appBlue
                        : AppColors.appGrey,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        'Add Case',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
