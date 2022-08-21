import 'package:tip100/core/components/icon_button_with_text.dart';
import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/components/small_button_transparent.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/screens/home/home_page.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/doc_storage/components/add_link_bottom_sheet.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/doc_storage/components/all_cases_doc_storage_filters.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/doc_storage/components/upload_doc_bottom_sheet.dart';
import 'package:flutter/material.dart';

class DocStorageHeader extends StatefulWidget {
  const DocStorageHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<DocStorageHeader> createState() => DocStorageHeaderState();
}

class DocStorageHeaderState extends State<DocStorageHeader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: Card(
        elevation: 4,
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                                const AllCasesDocStorageFilters()));
                  },
                  buttonColor: AppColors.purpleTag,
                  buttonIcon: AppIcons.filter),
              SizedBox(
                width: 10,
              ),
              SmallButton(
                  onTap: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        context: context,
                        builder: (context) => AddLinkSheet());
                  },
                  buttonColor: AppColors.primary,
                  buttonIcon: AppIcons.link),
              SizedBox(
                width: 10,
              ),
              IconButtonWithText(
                onTap: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      context: context,
                      builder: (context) => AddDocSheet());
                },
                buttonColor: AppColors.greenTag,
                buttonIcon: AppIcons.upload,
                buttonText: 'Upload Doc',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
