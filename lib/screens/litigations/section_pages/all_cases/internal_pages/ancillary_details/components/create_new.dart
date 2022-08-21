import 'package:tip100/core/components/cta_blue_buttons.dart';
import 'package:tip100/core/components/dropdown.dart';
import 'package:tip100/core/components/dropdown_large.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/constants/app_icons.dart';
import '../../../../../../../size_config.dart';

class AddNew extends StatefulWidget {
  const AddNew({Key? key}) : super(key: key);

  @override
  _AddNewState createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  TextEditingController titleController = TextEditingController();
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
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: SvgPicture.asset(
                AppIcons.close,
                color: Colors.black,
                height: 15,
              ),
            ),
          )
        ],
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
                child:
                    AppTextField(false, titleController, 'Section Title', 1.2),
              ),
              const SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: AppTextField(
                            false, summaryController, 'Field Title', 1.2)),
                    AppLargeDropdown(
                        // '-Input Type-', const <String>['-Input Type-', 'Text', 'Numeric', 'Date']
                        ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CTABlueButtons(
                buttonColor: AppColors.primary,
                buttonIcon: AppIcons.addButton,
                buttonText: 'Add',
                onTap: () {},
                width: 75,
              )
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
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
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
                  Padding(
                    padding: const EdgeInsets.only(left: 1.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 4,
                      color: (titleController.value.text.length > 2 &&
                              summaryController.value.text.length > 2)
                          ? AppColors.appBlue
                          : AppColors.appGrey,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Text(
                          'Create Ancillary Details Section',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                        ),
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
