import 'package:tip100/core/constants/app_illustrations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_buttons.dart';
import '../../../core/constants/app_colors.dart';

class BottomNavSheet extends StatefulWidget {
  const BottomNavSheet({Key? key}) : super(key: key);

  @override
  _BottomNavSheetState createState() => _BottomNavSheetState();
}

class _BottomNavSheetState extends State<BottomNavSheet> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return   Container(
     height: 170,
     child: Column(
       children: [
         TabBar(
           labelPadding: EdgeInsets.all(0),
           indicatorWeight: 0.1,
           onTap: (val) {
             setState(() {});
           },
           padding: EdgeInsets.zero,
           indicatorColor: AppColors.tertiary,
           controller: tabController,
           tabs: <Widget>[
             tabController.index == 0
                 ? SvgPicture.asset(AppButtons.litiActiveTab)
                 : SvgPicture.asset(AppButtons.litiTab),
             tabController.index == 1
                 ? SvgPicture.asset(AppButtons.iprActiveTab)
                 : SvgPicture.asset(AppButtons.iprTab),
             tabController.index == 2
                 ? SvgPicture.asset(AppButtons.noticeActiveTab)
                 : SvgPicture.asset(AppButtons.noticeTab),
           ],
         ),
         Text('Select Dashboard View', style: Theme.of(context)
             .textTheme
             .bodyLarge
             ?.copyWith(color: AppColors.appGrey),)
       ],
     ),
   );
  }
}
