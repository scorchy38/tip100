import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../logic/bloc/all_cases_details_bloc/all_cases_details_bloc.dart';
import 'cta_button.dart';

class FollowersCard extends StatefulWidget {
  const FollowersCard({
    Key? key,
  }) : super(key: key);

  @override
  State<FollowersCard> createState() => FollowersCardState();
}

class FollowersCardState extends State<FollowersCard> {
  List<Widget> followers = [];
  @override
  void initState() {
    for (int i = 0;
        i <
            context
                .read<AllCasesDetailsBloc>()
                .state
                .caseDetails!
                .followersDetail!
                .length;
        i++) {
      context
                  .read<AllCasesDetailsBloc>()
                  .state
                  .caseDetails!
                  .followersDetail![i]
                  .file !=
              null
          ? followers.add(i == 0
              ? Positioned(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(context
                        .read<AllCasesDetailsBloc>()
                        .state
                        .caseDetails!
                        .followersDetail![i]
                        .file!),
                  ),
                )
              : Positioned(
                  left: 35.0 * i,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(context
                        .read<AllCasesDetailsBloc>()
                        .state
                        .caseDetails!
                        .followersDetail![i]
                        .file!),
                  ),
                ))
          : null;
    }
    // setState(() {});
    // context
    //     .read<AllCasesDetailsBloc>()
    //     .state
    //     .caseDetails!
    //     .followersDetail!
    //     .forEach((element) {
    //   linkedNotices.add(SizedBox(
    //     height: 10,
    //   ));
    //   linkedNotices.add(RemovableTag(
    //     tagName: element.name!,
    //     // overflow: true,
    //   ));
    // });
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
        color: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Followers',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColorBlack),
                  ),
                  Spacer(),
                  CTAButton(
                      buttonColor: AppColors.primary,
                      buttonName: 'Edit',
                      prefixIcon: SvgPicture.asset(
                        AppIcons.edit,
                        height: 12,
                        width: 12,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  //alignment:new Alignment(x, y)
                  children: followers,
                  // children: <Widget>[
                  //   new CircleAvatar(
                  //     backgroundImage: AssetImage(AppImages.follower),
                  //   ),
                  //   new Positioned(
                  //     left: 35.0,
                  //     child: new CircleAvatar(
                  //       backgroundImage: AssetImage(AppImages.follower),
                  //     ),
                  //   ),
                  //   new Positioned(
                  //     left: 70.0,
                  //     child: new CircleAvatar(
                  //       backgroundImage: AssetImage(AppImages.follower),
                  //     ),
                  //   )
                  // ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
