import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tip100/core/components/card_tags.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/internal_pages/all_cases_entrypoint.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/components/case_card_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

import '../../../../../core/components/icon_button_with_text.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../logic/bloc/add_case_bloc/add_case_bloc.dart';
import '../../../../home/components/chat_page.dart';
import 'add_new_case.dart';

class CaseCard extends StatelessWidget {
  final String caseNumber, complaint, caseStage, court, pdoh, ndoh, ndohRemark;
  final int caseId;
  final Timestamp dateOfIncident;
  final List mediaURL;

  const CaseCard(
      {Key? key,
      required this.caseNumber,
      required this.complaint,
      required this.court,
      required this.caseStage,
      required this.pdoh,
      required this.ndoh,
      required this.ndohRemark,
      required this.dateOfIncident,
      required this.caseId,
      required this.mediaURL})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AllCasesEntryPointUI(caseId)));
        },
        // onTap: () => Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => AllCasesEntryPointUI())),
        child: Card(
          // elevation: 4,
          // color: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'Category',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 12,
                        color: AppColors.appGrey,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AllCasesEntryPointUI(caseId))),
                    child: Text(
                      caseNumber,
                      style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Location',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 12,
                        color: AppColors.appGrey,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    complaint,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 14,
                        color: AppColors.textColorBlack,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Details',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 12,
                        color: AppColors.appGrey,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    court,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        fontSize: 14,
                        color: AppColors.textColorBlack,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Date Of Incident',
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
                            DateFormat.yMMMd().format(dateOfIncident.toDate()),
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
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Time of Incident',
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
                            caseStage,
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
                      Spacer(),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  Row(
                    children: [
                      IconButtonWithText(
                        onTap: () {
                          mediaURL.forEach((element) {
                            launch(element);
                          });
                        },
                        buttonColor: AppColors.primary,
                        buttonIcon: AppIcons.addButton,
                        icon: EvaIcons.image,
                        buttonText: 'Related Media',
                      ),
                      SizedBox(
                        width: 6.7,
                      ),
                      IconButtonWithText(
                        onTap: () async {
                          final SharedPreferences _prefs =
                              await SharedPreferences.getInstance();

                          bool allow = false;
                          FirebaseFirestore firebaseFirestore =
                              FirebaseFirestore.instance;

                          QuerySnapshot query = await firebaseFirestore
                              .collection("alertChats")
                              .get();
                          query.docs.forEach((element) {
                            if (element.id
                                    .contains("${_prefs.getString('token')}") &&
                                element.id.contains(caseId.toString()))
                              allow = true;
                          });
                          if (allow)
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ChatPage(
                                        collectionName: 'alertChats',
                                        peerNickname: 'POLICE',
                                        peerAvatar:
                                            'https://firebasestorage.googleapis.com/v0/b/tip100-f1628.appspot.com/o/Upplogo.png?alt=media&token=bad7f7fd-d75a-4764-9d6c-5e2d56a6e65c',
                                        peerId: 'POLICE',
                                        userAvatar:
                                            'https://firebasestorage.googleapis.com/v0/b/tip100-f1628.appspot.com/o/anonymous-user.png?alt=media&token=486e84c2-9a1c-4e0b-9c63-8b5e2615b61b',
                                        tipID: '2')));
                          else
                            Fluttertoast.showToast(
                                msg:
                                    "You can share information once the police initiates a chat session.");
                        },
                        buttonColor: AppColors.primary,
                        buttonIcon: AppIcons.addButton,
                        icon: EvaIcons.infoOutline,
                        buttonText: 'Share Information',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
