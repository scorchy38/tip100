import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/logic/bloc/add_lawyer_bloc/add_lawyer_bloc.dart';
import 'package:tip100/logic/cubit/switch_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../logic/bloc/add_case_bloc/add_case_bloc.dart';
import '../../size_config.dart';
import '../constants/app_colors.dart';

class AppLargeDropdown extends StatefulWidget {
  String? dropdownValue;
  List<String>? values;
  TextEditingController? controller;
  String? label;
  double? width;

  AppLargeDropdown(
      {this.dropdownValue,
      this.values,
      this.controller,
      this.label,
      this.width,
      Key? key})
      : super(key: key);

  @override
  _AppLargeDropdownState createState() => _AppLargeDropdownState();
}

class _AppLargeDropdownState extends State<AppLargeDropdown> {
  bool changeColor = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: AppColors.primary.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 5)
      ]),
      child: Card(
        // elevation: 3,
        shadowColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                    ?.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Container(
                        width: getProportionateScreenWidth(widget.width ?? 130),
                        child: Text(
                          value,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 14,
                              overflow: TextOverflow.ellipsis,
                              color: !changeColor
                                  ? AppColors.appGrey
                                  : Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ));
                }).toList(),
                onChanged: (String? newValue) {
// do something here

                  setState(() {
                    changeColor = true;
                    widget.dropdownValue = newValue ?? widget.dropdownValue;
                    widget.controller?.text =
                        (newValue ?? widget.dropdownValue)!;
                    if (widget.label == 'Crime Category') {
                      context.read<AddCaseBloc>().add(EventAddCrimeType(
                          crimeType: widget.controller!.text));
                      // print(context.read<AddCaseBloc>().state.crimeType);
                      // print("Added");
                    } else if (widget.label == 'Priority(Optional)')
                      context.read<AddCaseBloc>().add(
                          EventAddPriority(priority: widget.controller!.text));
                    else if (widget.label == 'Time(Optional)')
                      context
                          .read<AddCaseBloc>()
                          .add(EventAddTitle(title: widget.controller!.text));
                    // if (widget.controller?.text.compareTo(widget.label!) == 0)
                    //   context
                    //       .read<SwitchCubit>()
                    //       .toggleFilter(widget.label!, true);
                    // else
                    //   context
                    //       .read<SwitchCubit>()
                    //       .toggleFilter(widget.label!, false);
                  });
                },
                underline: DropdownButtonHideUnderline(
                    child: Container(
                  width: 50,
                )))),
      ),
    );
  }
}
