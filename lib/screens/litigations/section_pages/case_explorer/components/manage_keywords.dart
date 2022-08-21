import 'package:tip100/core/components/dropdown.dart';
import 'package:tip100/core/components/dropdown_large.dart';
import 'package:tip100/core/components/icon_button_with_text.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/details/components/removable_tag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_icons.dart';
import '../../../../../size_config.dart';

class ManageKeywords extends StatefulWidget {
  const ManageKeywords({Key? key}) : super(key: key);

  @override
  _ManageKeywordsState createState() => _ManageKeywordsState();
}

class _ManageKeywordsState extends State<ManageKeywords> {
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
          'Manage Keywords',
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppDefaults.padding,
                        top: AppDefaults.padding,
                        right: AppDefaults.padding),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      // height: 100,
                      child: AppTextField(
                          false, titleController, 'New Keyword', 1.2),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      // left: AppDefaults.padding,
                      top: AppDefaults.padding,
                      right: 5
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: AppColors.gridGrey, width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.addButton,
                                height: AppDefaults.padding,
                                width: AppDefaults.padding,
                                color: AppColors.gridGrey,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Add',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        fontSize: 13,
                                        color: AppColors.gridGrey,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Existing Keywords',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.appGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 35,
                width: MediaQuery.of(context).size.width * 0.7,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: RemovableTag(tagName: 'Keyword 1'),
                    ),
                    RemovableTag(tagName: 'Keyword 2')
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: getProportionateScreenHeight(96),
            decoration:  BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black.withOpacity(0.4))],
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
                    color: (titleController.value.text.length > 2 &&
                            summaryController.value.text.length > 2)
                        ? AppColors.appBlue
                        : AppColors.appGrey,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        children: [
                          SvgPicture.asset(AppIcons.save),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Save Changes',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15),
                          ),
                        ],
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
