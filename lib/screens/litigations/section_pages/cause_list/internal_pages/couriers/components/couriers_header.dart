import 'package:tip100/core/components/icon_button_with_text.dart';
import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:flutter/material.dart';

class CouriersHeader extends StatefulWidget {
  const CouriersHeader({
    Key? key,
  }) : super(key: key);

  @override
  State<CouriersHeader> createState() => CouriersHeaderState();
}

class CouriersHeaderState extends State<CouriersHeader> {
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
                  onTap: () {},
                  buttonColor: AppColors.purpleTag,
                  buttonIcon: AppIcons.filter),
              SizedBox(
                width: 10,
              ),
              IconButtonWithText(
                  onTap: () {},
                  buttonColor: AppColors.greenTag,
                  buttonText: 'New Courier',
                  buttonIcon: AppIcons.addButton),
            ],
          ),
        ),
      ),
    );
  }
}
