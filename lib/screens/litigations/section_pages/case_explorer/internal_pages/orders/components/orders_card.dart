import 'package:tip100/core/components/card_tags.dart';
import 'package:tip100/core/components/small_button_transparent.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/model/case_explorer_details_model.dart'
    as CaseExplorerDetails;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../details/components/cta_button.dart';

class OrdersCard extends StatefulWidget {
  final CaseExplorerDetails.Orders orderDetails;

  const OrdersCard({Key? key, required this.orderDetails}) : super(key: key);

  @override
  State<OrdersCard> createState() => OrdersCardState();
}

class OrdersCardState extends State<OrdersCard> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = "Due";
    return Padding(
      padding: const EdgeInsets.all(AppDefaults.padding / 2),
      child: Card(
        elevation: 4,
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            // height: 110,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () async {
                        // const url = "https://flutter.io";
                        if (await canLaunchUrl(
                            Uri.parse(widget.orderDetails.documentFile!)))
                          await launchUrl(
                              Uri.parse(widget.orderDetails.documentFile!),
                              webViewConfiguration:
                                  WebViewConfiguration(enableJavaScript: true));
                        else
                          // can't launch url, there is some error
                          throw "Could not launch ${widget.orderDetails.documentFile!}";
                      },
                      child: CTAButton(
                          buttonColor: AppColors.purpleTag,
                          buttonName: 'Download',
                          prefixIcon: SvgPicture.asset(
                            AppIcons.download,
                            color: AppColors.purpleTag,
                          )),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CTAButton(
                        buttonColor: AppColors.primary,
                        buttonName: 'View',
                        prefixIcon: SvgPicture.asset(
                          AppIcons.show,
                          color: AppColors.primary,
                        )),
                    // Spacer()
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 12,
                      color: AppColors.appGrey,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  widget.orderDetails.title!,
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
                          'Date Of Upload',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        Text(
                          widget.orderDetails.created!,
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
                          'Uploaded By',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontSize: 13,
                                  color: AppColors.appGrey,
                                  fontWeight: FontWeight.w500),
                        ),
                        Text(
                          widget.orderDetails.uploadedByName!,
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
