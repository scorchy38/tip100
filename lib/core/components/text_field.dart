import 'dart:async';

import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/screens/litigations/section_pages/all_cases/components/add_new_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_tooltip/super_tooltip.dart';

import '../constants/app_colors.dart';
import '../constants/app_icons.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final double maxLines;
  String helper = " ";
  bool showCopyIcon = false;
  final Function(String?)? onChanged;

  bool label;
  AppTextField(this.label, this.controller, this.title, this.maxLines,
      {Key? key, this.onChanged, this.helper = " ", this.showCopyIcon = false})
      : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  int _start = 5;
  Timer _timer = Timer(const Duration(seconds: 5), () => print(' '));

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  SuperTooltip tooltip = SuperTooltip(
    arrowLength: 10,
    arrowBaseWidth: 10,
    popupDirection: TooltipDirection.up,
    shadowColor: AppColors.primary.withOpacity(0.05),
    backgroundColor: Colors.black,
    borderColor: AppColors.primary,
    borderWidth: 1,
    shadowBlurRadius: 5,
    shadowSpreadRadius: 1,
    content: new Material(
        color: Colors.black,
        child: Text(
          "Lorem ipsum dolor",
          style: TextStyle(color: Colors.white),
          softWrap: true,
        )),
  );
  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.controller.text));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Copied to clipboard'),
    ));
  }

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
        // shadowColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        // elevation: 4,
        child: TextFormField(
          onChanged: widget.onChanged,
          onTap: () {
            setState(() {
              widget.label = true;
            });
          },
          controller: widget.controller,
          minLines: widget.maxLines.toInt(),
          maxLines: widget.maxLines.toInt() + 1,
          enabled: true,
          decoration: widget.showCopyIcon
              ? InputDecoration(
                  icon: IconButton(
                    icon: const Icon(Icons.copy),
                    onPressed: _copyToClipboard,
                    padding: EdgeInsets.all(0),
                  ),
                  labelText: widget.label ? widget.title : '',
                  // suffixIcon: !widget.label
                  //     ? Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 8.0, vertical: 10),
                  //         child: Builder(builder: (context) {
                  //           return GestureDetector(
                  //             onTapDown: (details) {
                  //               _start = 5;
                  //               startTimer();
                  //               tooltip.show(context);
                  //             },
                  //             onTapUp: (details) {
                  //               if (_start != 0) tooltip.close();
                  //             },
                  //             onTapCancel: () {
                  //               if (_start != 0) tooltip.close();
                  //             },
                  //             child: SvgPicture.asset(
                  //               AppIcons.info,
                  //               alignment: Alignment.bottomCenter,
                  //             ),
                  //           );
                  //         }),
                  //       )
                  //     : Container(
                  //         height: 1,
                  //         width: 1,
                  //       ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 9.0, horizontal: 0),
                  fillColor: Colors.white,
                  filled: true,
                  helperText: widget.helper,
                  helperMaxLines: 2,
                  hintText: !widget.label ? widget.title : '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIconConstraints: const BoxConstraints(maxWidth: 48),
                )
              : InputDecoration(
                  labelText: widget.label ? widget.title : '',
                  // suffixIcon: !widget.label
                  //     ? Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 8.0, vertical: 10),
                  //         child: Builder(builder: (context) {
                  //           return GestureDetector(
                  //             onTapDown: (details) {
                  //               _start = 5;
                  //               startTimer();
                  //               tooltip.show(context);
                  //             },
                  //             onTapUp: (details) {
                  //               if (_start != 0) tooltip.close();
                  //             },
                  //             onTapCancel: () {
                  //               if (_start != 0) tooltip.close();
                  //             },
                  //             child: SvgPicture.asset(
                  //               AppIcons.info,
                  //               alignment: Alignment.bottomCenter,
                  //             ),
                  //           );
                  //         }),
                  //       )
                  //     : Container(
                  //         height: 1,
                  //         width: 1,
                  //       ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 9.0, horizontal: 10),
                  fillColor: Colors.white,
                  filled: true,
                  helperText: widget.helper,
                  helperMaxLines: 2,

                  hintText: !widget.label ? widget.title : '',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIconConstraints: const BoxConstraints(maxWidth: 48),
                ),
        ),
      ),
    );
  }
}
