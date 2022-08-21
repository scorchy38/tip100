import 'dart:async';

import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:tip100/screens/home/components/bar_chart_detailed.dart';
import 'package:tip100/screens/home/components/bar_chart_detailed_with_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../core/components/small_button.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_defaults.dart';
import '../../../core/constants/app_icons.dart';

class BarChartExpandedChartCard extends StatefulWidget {
  const BarChartExpandedChartCard(
      this.title, this.locationsEngaged, this.countKey, this.yAxisKey,
      {Key? key})
      : super(key: key);
  final String title;
  final String countKey;
  final String yAxisKey;
  final List locationsEngaged;

  @override
  _BarChartExpandedChartCardState createState() =>
      _BarChartExpandedChartCardState();
}

class _BarChartExpandedChartCardState extends State<BarChartExpandedChartCard> {
  String dropdownValue = "Annually";
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
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.01,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: AppColors.primary.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            // elevation: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Builder(builder: (context) {
                            return GestureDetector(
                                onTapDown: (details) {
                                  _start = 5;
                                  startTimer();
                                  tooltip.show(context);
                                },
                                onTapUp: (details) {
                                  if (_start != 0) tooltip.close();
                                },
                                onTapCancel: () {
                                  if (_start != 0) tooltip.close();
                                },
                                child: SvgPicture.asset(
                                  AppIcons.info,
                                  height: 15,
                                  width: 15,
                                ));
                          })
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ' ● Updated Just Now',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 14, color: AppColors.appGrey),
                      ),
                      Text(
                        '${context.read<BasicGraphsBloc>().state.startDate!.day}/${context.read<BasicGraphsBloc>().state.startDate!.month}/${context.read<BasicGraphsBloc>().state.startDate!.year} to ${context.read<BasicGraphsBloc>().state.endDate!.day}/${context.read<BasicGraphsBloc>().state.endDate!.month}/${context.read<BasicGraphsBloc>().state.endDate!.year}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 14, color: AppColors.appGrey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(AppDefaults.padding),
                  child: BarChartDetailedWithData(widget.yAxisKey,
                      widget.countKey, widget.locationsEngaged),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: AppDefaults.padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallButton(
                          onTap: () {},
                          buttonColor: AppColors.purpleTag,
                          buttonIcon: AppIcons.download),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                          height: 35,
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.appBlue,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(8)),
                          child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: AppColors.appBlue,
                              ),
                              items: <String>[
                                'Annually',
                                'Half Yearly',
                                'Monthly'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          color: AppColors.appBlue,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
