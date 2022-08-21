import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/logic/bloc/all_cases_filters_bloc/all_cases_filters_bloc.dart';
import 'package:tip100/logic/cubit/switch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:searchfield/searchfield.dart';

import '../../size_config.dart';
import '../constants/app_colors.dart';

class AppDropdown extends StatefulWidget {
  String dropdownValue;
  List<String> values;
  TextEditingController controller;
  String label;
  AppDropdown(this.dropdownValue, this.values, this.controller, this.label,
      {Key? key})
      : super(key: key);

  @override
  _AppDropdownState createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: AppColors.primary.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 5)
        ]),
        child: Card(
          // elevation: 3,
          shadowColor: AppColors.primary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  // border: Border.all(
                  //     color: AppColors.purpleTag,
                  //     width: 1,
                  //     style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10)),
              child: DropdownButton<String>(
                  value: widget.dropdownValue,
                  icon: SvgPicture.asset(AppIcons.down),
                  items: widget.values
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Container(
                          width: getProportionateScreenWidth(110),
                          child: Text(
                            value,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                                color: AppColors.appGrey,
                                fontWeight: FontWeight.w500),
                          ),
                        ));
                  }).toList(),
                  onChanged: (String? newValue) {
// do something here

                    setState(() {
                      widget.dropdownValue = newValue ?? widget.dropdownValue;
                      widget.controller.text = newValue ?? widget.dropdownValue;
                      if (widget.controller.text.compareTo(widget.label) == 0)
                        context
                            .read<SwitchCubit>()
                            .toggleFilter(widget.label, true);
                      else
                        context
                            .read<SwitchCubit>()
                            .toggleFilter(widget.label, false);
                    });
                  },
                  underline: DropdownButtonHideUnderline(
                      child: Container(
                    width: 50,
                  )))),
        ),
      ),
    );
  }
}
