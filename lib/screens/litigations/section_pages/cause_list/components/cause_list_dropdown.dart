import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/screens/litigations/section_pages/cause_list/components/cause_list_free_text_card.dart';
import 'package:flutter/material.dart';

import 'cause_list_pdf_card.dart';

String dropdownValue = "PDF";

class CauseListDropdown extends StatefulWidget {
  final BuildContext ctx;
  const CauseListDropdown({Key? key, required this.ctx}) : super(key: key);

  @override
  State<CauseListDropdown> createState() => _CauseListDropdownState();
}

class _CauseListDropdownState extends State<CauseListDropdown> {
  // Initial Selected Value
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDefaults.padding, vertical: AppDefaults.padding / 4),
      child: Row(
        children: [
          Text(
            'Cause List',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.textColorBlack),
          ),
          Spacer(),
          Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: AppColors.purpleTag,
                      width: 1,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(8)),
              child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppColors.purpleTag,
                  ),
                  items: <String>['PDF', 'Free Text']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(
                              color: AppColors.textColorBlack,
                              fontWeight: FontWeight.w500),
                        ));
                  }).toList(),
                  onChanged: (String? newValue) {
                    // do something here

                    setState(() {
                      dropdownValue = newValue ?? dropdownValue;
                    });
                  },
                  underline: DropdownButtonHideUnderline(
                      child: Container(
                    width: 50,
                  ))))
        ],
      ),
    );
  }
}
