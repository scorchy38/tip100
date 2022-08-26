import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:tip100/core/components/dropdown_large.dart';
import 'package:tip100/core/components/text_field.dart';
import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RenameSheet extends StatefulWidget {
  const RenameSheet({Key? key}) : super(key: key);

  @override
  RenameSheetState createState() => RenameSheetState();
}

class RenameSheetState extends State<RenameSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController priorityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: 190,
        child: Scaffold(
          backgroundColor: AppColors.offWhite,
          body: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDefaults.padding, vertical: 25),
            child: Column(
              children: [
                AppLargeDropdown(
                    width: 300,
                    dropdownValue: 'English',
                    values: ['English', 'Hindi'],
                    controller: priorityController,
                    label: 'English'),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Text(
                        'Discard',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: AppColors.appGrey,
                            fontWeight: FontWeight.w600,
                            fontSize: 15),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        final preferences =
                            await StreamingSharedPreferences.instance;
                        preferences.setString('token', ' ');
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 4,
                          color: AppColors.appBlue,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppIcons.save),
                                SizedBox(
                                  width: 10,
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
                        ),
                      ),
                    )
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
