import 'package:tip100/core/components/card_tags.dart';
import 'package:tip100/core/components/small_button_transparent.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/logic/bloc/my_counsel_details_bloc/my_counsel_details_bloc.dart';
import 'package:tip100/model/my_counsel_model.dart';
import 'package:tip100/screens/litigations/section_pages/case_explorer/components/case_card_button.dart';
import 'package:tip100/screens/litigations/section_pages/my_counsel/internal_pages/my_counsel_entrypoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:url_launcher/url_launcher.dart';

class CaseCard extends StatelessWidget {
  final MyCounselModel counselData;

  const CaseCard({
    Key? key,
    required this.counselData,
  }) : super(key: key);

  _launchCaller() async {
    String url = "tel:${counselData.number}";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchWhatsapp() async {
    String url = "https://wa.me/${counselData.number}?text=HeyThere";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchMail() async {
    String url =
        "mailto:${counselData.email}?subject=This is Subject Title&body=This is Body of Email";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: InkWell(
        onTap: () {
          context.read<MyCounselDetailsBloc>().add(RefreshingCounselDetails());
          context
              .read<MyCounselDetailsBloc>()
              .add(GetMyCounselDetails(counselData.id!));
          context
              .read<MyCounselDetailsBloc>()
              .add(GetCaseItems(counselData.id!));
          context
              .read<MyCounselDetailsBloc>()
              .add(GetDocStorageItems(counselData.id!));
          context
              .read<MyCounselDetailsBloc>()
              .add(GetNoticeItems(counselData.id!));

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyCounselEntryPointUI(
                        counselID: counselData.id!,
                        myCounselData: counselData,
                      )));
        },
        child: Card(
          elevation: 4,
          color: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              // height: 320,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // CardTag(
                  //   tagName: 'Active',
                  //   tagColor: AppColors.greenTag,
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lawyer name',
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
                            counselData.name!,
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
                      InkWell(
                        onTap: () => _launchCaller(),
                        child: SmallButtonTransparent(
                            buttonColor: AppColors.primary,
                            buttonIcon: AppIcons.phone),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () => _launchWhatsapp(),
                        child: SmallButtonTransparent(
                            buttonColor: AppColors.greenTag,
                            buttonIcon: AppIcons.whatsapp),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () => _launchMail(),
                        child: SmallButtonTransparent(
                            buttonColor: AppColors.purpleTag,
                            buttonIcon: AppIcons.email),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.36,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location',
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
                              counselData.city!['name'] == null
                                  ? ''
                                  : '${counselData.city!['name']},${counselData.city!['state_name']}',
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
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          height: 160,
                          child: AspectRatio(
                            aspectRatio: 1.5,
                            child: SfRadialGauge(axes: <RadialAxis>[
                              RadialAxis(
                                isInversed: true,
                                minimum: 0,
                                maximum: 100,
                                showLabels: false,
                                showTicks: false,
                                radiusFactor: 0.9,
                                axisLineStyle: AxisLineStyle(
                                  thickness: 0.06,
                                  cornerStyle: CornerStyle.bothCurve,
                                  color: Colors.grey.withOpacity(0.3),
                                  thicknessUnit: GaugeSizeUnit.factor,
                                ),
                                pointers: <GaugePointer>[
                                  RangePointer(
                                    color: AppColors.purpleTag,
                                    value:
                                        counselData.organization!.total_cases ==
                                                0
                                            ? 0
                                            : (counselData.organization!
                                                            .ongoing_case! /
                                                        counselData
                                                            .organization!
                                                            .total_cases!)
                                                    .roundToDouble() *
                                                100,
                                    cornerStyle: CornerStyle.bothCurve,
                                    width: 0.1,
                                    sizeUnit: GaugeSizeUnit.factor,
                                  )
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      positionFactor: 1,
                                      angle: 90,
                                      widget: Column(
                                        children: [
                                          Text(
                                            'Total Cases',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    fontSize: 15,
                                                    color: AppColors.appGrey),
                                          ),
                                          Text(
                                            counselData
                                                .organization!.total_cases
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    fontSize: 17,
                                                    color: AppColors
                                                        .textColorBlack,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ],
                                      ))
                                ],
                              )
                            ]),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          height: 160,
                          child: AspectRatio(
                            aspectRatio: 1.5,
                            child: SfRadialGauge(axes: <RadialAxis>[
                              RadialAxis(
                                isInversed: true,
                                minimum: 0,
                                maximum: 100,
                                showLabels: false,
                                showTicks: false,
                                radiusFactor: 0.9,
                                axisLineStyle: AxisLineStyle(
                                  thickness: 0.06,
                                  cornerStyle: CornerStyle.bothCurve,
                                  color: Colors.grey.withOpacity(0.3),
                                  thicknessUnit: GaugeSizeUnit.factor,
                                ),
                                pointers: <GaugePointer>[
                                  RangePointer(
                                    color: AppColors.purpleTag,
                                    value: counselData
                                                .organization!.total_notices ==
                                            0
                                        ? 0
                                        : (counselData.organization!
                                                        .ongoing_notice! /
                                                    counselData.organization!
                                                        .total_notices!)
                                                .roundToDouble() *
                                            100,
                                    cornerStyle: CornerStyle.bothCurve,
                                    width: 0.1,
                                    sizeUnit: GaugeSizeUnit.factor,
                                  )
                                ],
                                annotations: <GaugeAnnotation>[
                                  GaugeAnnotation(
                                      positionFactor: 1,
                                      angle: 90,
                                      widget: Column(
                                        children: [
                                          Text(
                                            'Total Notices',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    fontSize: 15,
                                                    color: AppColors.appGrey),
                                          ),
                                          Text(
                                            counselData
                                                .organization!.total_notices
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                    fontSize: 17,
                                                    color: AppColors
                                                        .textColorBlack,
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                        ],
                                      ))
                                ],
                              )
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ongoing',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 12,
                                            color: AppColors.appGrey),
                                  ),
                                  Text(
                                    counselData.organization!.ongoing_case
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 13,
                                            color: AppColors.orangeTag,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Disposed',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 12,
                                            color: AppColors.appGrey),
                                  ),
                                  Text(
                                    counselData.organization!.disposed_case
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 13,
                                            color: AppColors.purpleTag,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.5,
                          height: 200,
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Open',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 12,
                                            color: AppColors.appGrey),
                                  ),
                                  Text(
                                    counselData.organization!.ongoing_notice
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 13,
                                            color: AppColors.orangeTag,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Closed',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 12,
                                            color: AppColors.appGrey),
                                  ),
                                  Text(
                                    counselData.organization!.disposed_notice
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 13,
                                            color: AppColors.purpleTag,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CardTag(
                        tagName: counselData.lawyer_active == true
                            ? 'Active'
                            : 'Not Active',
                        tagColor: AppColors.textColorBlack,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CardTag(
                        tagName: '2 Open',
                        tagColor: AppColors.textColorBlack,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CardTag(
                        tagName:
                            '${counselData.organization!.portfolio!.round()}% Portfolio',
                        tagColor: AppColors.textColorBlack,
                      ),
                    ],
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     CardTag(
                  //       tagName: '0 Open',
                  //       tagColor: AppColors.primary,
                  //     ),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     CardTag(
                  //       tagName: '33% Portfolio',
                  //       tagColor: AppColors.purpleTag,
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
