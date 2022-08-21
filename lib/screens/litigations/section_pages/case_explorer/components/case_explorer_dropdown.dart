import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/logic/bloc/case_explorer_bloc/case_explorer_bloc.dart';
import 'package:tip100/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaseExplorerDropdown extends StatefulWidget {
  const CaseExplorerDropdown({
    Key? key,
  }) : super(key: key);

  @override
  State<CaseExplorerDropdown> createState() => _CaseExplorerDropdownState();
}

class _CaseExplorerDropdownState extends State<CaseExplorerDropdown> {
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
            'Case Explorer',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: getProportionateScreenHeight(22),
                fontWeight: FontWeight.bold,
                color: AppColors.textColorBlack),
          ),
          Text(
            '(${context.watch<CaseExplorerBloc>().state.totalCases}+)',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: getProportionateScreenHeight(22),
                fontWeight: FontWeight.bold,
                color: AppColors.appGrey),
          ),

          Spacer(),
          Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                  items: <String>['Primary Cases', 'Secondary Cases', 'Monthly']
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
