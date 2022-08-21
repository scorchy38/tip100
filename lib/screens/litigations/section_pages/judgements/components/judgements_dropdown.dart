import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/size_config.dart';
import 'package:flutter/material.dart';

class JudgementsDropdown extends StatefulWidget {
  const JudgementsDropdown({
    Key? key,
  }) : super(key: key);

  @override
  State<JudgementsDropdown> createState() => _JudgementsDropdownState();
}

class _JudgementsDropdownState extends State<JudgementsDropdown> {
  // Initial Selected Value
  String dropdownValue = "Judgements";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppDefaults.padding, vertical: AppDefaults.padding / 4),
      child: Row(
        children: [
          Text(
            'Judgements',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: getProportionateScreenHeight(23),
                fontWeight: FontWeight.bold,
                color: AppColors.textColorBlack),
          ),
          Text(
            ' (99+)',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: getProportionateScreenHeight(23),
                fontWeight: FontWeight.bold,
                color: AppColors.appGrey),
          ),
          Spacer(),
          Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
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
                  items: <String>['Judgements', 'Daily Orders']
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
