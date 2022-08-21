import 'package:tip100/core/components/card_tags.dart';
import 'package:tip100/core/components/small_button_transparent.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/model/counsel_doc_storage_item.dart';
import 'package:tip100/model/doc_storage_item.dart';
import 'package:tip100/model/my_counsel_model.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/doc_storage/components/rename_bottom_sheet.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/doc_storage/components/send_mail_bottom_sheet.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/doc_storage/components/share_bottom_sheet.dart';
import 'package:tip100/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../details/components/cta_button.dart';
import 'package:http/http.dart' as http;

class DocStorageCardFolder extends StatelessWidget {
  final String caseNumber, complaint, caseStage, court, pdoh, ndoh, ndohRemark;

  const DocStorageCardFolder(
      {Key? key,
      required this.caseNumber,
      required this.complaint,
      required this.court,
      required this.caseStage,
      required this.pdoh,
      required this.ndoh,
      required this.ndohRemark})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: Card(
        elevation: 4,
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            // height: 176,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            context: context,
                            builder: (context) => RenameSheet());
                      },
                      child: SmallButtonTransparent(
                          buttonColor: AppColors.primary,
                          buttonIcon: AppIcons.edit),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SmallButtonTransparent(
                        buttonColor: AppColors.red,
                        buttonIcon: AppIcons.delete),
                    SizedBox(
                      width: 10,
                    ),
                    SmallButtonTransparent(
                        buttonColor: AppColors.purpleTag,
                        buttonIcon: AppIcons.download),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            context: context,
                            builder: (context) => SendMailSheet());
                      },
                      child: SmallButtonTransparent(
                          buttonColor: AppColors.greenTag,
                          buttonIcon: AppIcons.email),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            context: context,
                            builder: (context) => ShareSheet());
                      },
                      child: SmallButtonTransparent(
                          buttonColor: AppColors.orangeTag,
                          buttonIcon: AppIcons.share),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Folder Name',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Image.asset(
                      AppIcons.folder,
                      height: AppDefaults.padding,
                      width: AppDefaults.padding,
                    ),
                    Text(
                      '  Signage Contracts Docs',
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 14,
                          color: AppColors.textColorBlack,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Created By',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Pratik Mohapatra',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14,
                      color: AppColors.textColorBlack,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Created',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '01 Mar, 2022',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 15,
                                  color: AppColors.textColorBlack,
                                  fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Modified',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '07 Mar, 2022',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 15,
                                  color: AppColors.textColorBlack,
                                  fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DocStorageCardPDF extends StatelessWidget {
  final CounselDocStorageItem docStorageItem;
  final MyCounselModel myCounselData;

  const DocStorageCardPDF({
    Key? key,
    required this.docStorageItem,
    required this.myCounselData,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: Card(
        elevation: 4,
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            // height: getProportionateScreenHeight(270),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Spacer(),
                    // docStorageItem.uploadedByName == 'Legistify' ?
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            context: context,
                            builder: (context) => RenameSheet());
                      },
                      child: SmallButtonTransparent(
                          buttonColor: AppColors.primary,
                          buttonIcon: AppIcons.edit),
                    )
                    // : Container()
                    ,
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        final SharedPreferences _prefs =
                            await SharedPreferences.getInstance();

                        var headers = {
                          'Accept': '*/*',
                          'Authorization': 'JWT ${_prefs.getString('token')}',
                          'Connection': 'keep-alive',
                          'Content-Type':
                              'multipart/form-data; boundary=----WebKitFormBoundaryx5Oz8h9Nf7OnhXVJ',
                          'Accept-Encoding': 'gzip',
                        };

                        var data =
                            '------WebKitFormBoundaryx5Oz8h9Nf7OnhXVJContent-Disposition: form-data; name="is_deleted"true------WebKitFormBoundaryx5Oz8h9Nf7OnhXVJ--';

                        var url = Uri.parse(
                            'https://corporate.legistify.com/api/case/2601879/documents/${docStorageItem.id}/');
                        var res =
                            await http.put(url, headers: headers, body: data);
                        if (res.statusCode != 200)
                          throw Exception(
                              'http.put error: statusCode= ${res.statusCode}');
                        print(res.body);
                      },
                      child: SmallButtonTransparent(
                          buttonColor: AppColors.red,
                          buttonIcon: AppIcons.delete),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SmallButtonTransparent(
                        buttonColor: AppColors.purpleTag,
                        buttonIcon: AppIcons.download),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            context: context,
                            builder: (context) => SendMailSheet());
                      },
                      child: SmallButtonTransparent(
                          buttonColor: AppColors.greenTag,
                          buttonIcon: AppIcons.email),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SmallButtonTransparent(
                        buttonColor: AppColors.greenTag,
                        buttonIcon: AppIcons.whatsapp),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Document Title',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 12,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              AppIcons.pdf,
                              height: AppDefaults.padding,
                              width: AppDefaults.padding,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                '  ${docStorageItem.filename}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        fontSize: 14,
                                        color: AppColors.textColorBlack,
                                        fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '   Created By',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 12,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '   ${myCounselData.name}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 14,
                                  color: AppColors.textColorBlack,
                                  fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Spacer()
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Document Link',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 13,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '${docStorageItem.docLink}${docStorageItem.filename}',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 15,
                      color: AppColors.textColorBlack,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 13,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  '${docStorageItem.type}',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 15,
                      color: AppColors.textColorBlack,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Created',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${DateTime.parse(docStorageItem.created!).day.toString().padLeft(2, '0')}-${DateTime.parse(docStorageItem.created!).month.toString().padLeft(2, '0')}-${DateTime.parse(docStorageItem.created!).year.toString().padLeft(2, '0')}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 15,
                                  color: AppColors.textColorBlack,
                                  fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Modified',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${DateTime.parse(docStorageItem.created!).day.toString().padLeft(2, '0')}-${DateTime.parse(docStorageItem.created!).month.toString().padLeft(2, '0')}-${DateTime.parse(docStorageItem.created!).year.toString().padLeft(2, '0')}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 15,
                                  color: AppColors.textColorBlack,
                                  fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Spacer()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
