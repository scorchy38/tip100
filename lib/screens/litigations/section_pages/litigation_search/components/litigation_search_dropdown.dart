import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:flutter/material.dart';

class LitigationSearchDropdown extends StatefulWidget {
  const LitigationSearchDropdown({
    Key? key,
  }) : super(key: key);

  @override
  State<LitigationSearchDropdown> createState() =>
      _LitigationSearchDropdownState();
}

class _LitigationSearchDropdownState extends State<LitigationSearchDropdown> {
  // Initial Selected Value
  String dropdownValue = "Primary Cases";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDefaults.padding, vertical: AppDefaults.padding / 4),
      child: Row(
        children: [
          Text(
            'Litigation Search',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.textColorBlack),
          ),
          Text(
            ' (99+)',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: AppColors.appGrey),
          ),
          // Spacer(),
          // Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
          //     decoration: BoxDecoration(
          //         border: Border.all(
          //             color: AppColors.purpleTag,
          //             width: 1,
          //             style: BorderStyle.solid),
          //         borderRadius: BorderRadius.circular(8)),
          //     child: DropdownButton<String>(
          //         value: dropdownValue,
          //         icon: Icon(
          //           Icons.keyboard_arrow_down_outlined,
          //           color: AppColors.purpleTag,
          //         ),
          //         items: <String>['Primary Cases', 'Pending Cases']
          //             .map<DropdownMenuItem<String>>((String value) {
          //           return DropdownMenuItem<String>(
          //               value: value, child: Text(value));
          //         }).toList(),
          //         onChanged: (String? newValue) {
          //           // do something here
          //           setState(() {
          //             dropdownValue = newValue ?? dropdownValue;
          //           });
          //         },
          //         underline: DropdownButtonHideUnderline(
          //             child: Container(
          //           width: 50,
          //         ))))
        ],
      ),
    );
  }
}
