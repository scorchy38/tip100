import 'package:tip100/core/components/components.dart';
import 'package:tip100/core/constants/app_buttons.dart';
import 'package:tip100/screens/litigations/components/litigations_search_box.dart';
import 'package:tip100/screens/temp.dart';
import 'package:tip100/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/constants.dart';

class LitigationsHeader extends StatefulWidget {
  const LitigationsHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<LitigationsHeader> createState() => _LitigationsHeaderState();
}

class _LitigationsHeaderState extends State<LitigationsHeader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
        image: AssetImage(AppImages.litigationsHeaderBg),
        fit: BoxFit.fill,
      )),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const LitigationsSearchBox(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDefaults.padding,
                          vertical: AppDefaults.padding / 2),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: AppColors.primary),
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(AppDefaults.padding / 2),
                              child: SvgPicture.asset(
                                AppIcons.newIcon,
                                height: AppDefaults.padding,
                                width: AppDefaults.padding,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '36',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primary),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                'New Cases',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        fontSize: 11, color: AppColors.appGrey),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDefaults.padding,
                          vertical: AppDefaults.padding / 2),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: AppColors.purpleTag),
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(AppDefaults.padding / 2),
                              child: SvgPicture.asset(
                                AppIcons.allIcon,
                                height: AppDefaults.padding,
                                width: AppDefaults.padding,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>  MyHomePage()));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '105',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.purpleTag),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  'Upcoming Hearings',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontSize: 11, color: AppColors.appGrey),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
