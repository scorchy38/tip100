import 'dart:async';

import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_defaults.dart';
import '../../../core/constants/app_icons.dart';
import 'package:super_tooltip/super_tooltip.dart' as Tooltip;

class CasesChart extends StatefulWidget {
  const CasesChart({Key? key}) : super(key: key);

  @override
  _CasesChartState createState() => _CasesChartState();
}

class _CasesChartState extends State<CasesChart> {
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

  String dropdownValue = "Annually";

  // We create the tooltip on the first use
  Tooltip.SuperTooltip tooltip = Tooltip.SuperTooltip(
    arrowLength: 10,
    arrowBaseWidth: 10,
    popupDirection: Tooltip.TooltipDirection.up,
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
      aspectRatio: 1.2,
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
                            'Ongoing vs Disposed',
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
                Expanded(
                  child: context
                          .watch<BasicGraphsBloc>()
                          .state
                          .graphsPopulated!
                          .contains(BasicGraphsState().BASICGRAPHSKEY)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: AppDefaults.padding,
                                top: AppDefaults.padding,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cases Ongoing',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 16,
                                            color: AppColors.appGrey),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    context
                                        .watch<BasicGraphsBloc>()
                                        .state
                                        .case_ongoing_count!
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 30,
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Cases Disposed',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 16,
                                            color: AppColors.appGrey),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    context
                                        .watch<BasicGraphsBloc>()
                                        .state
                                        .case_disposed_count!
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 30,
                                            color: AppColors.appRed,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: SfRadialGauge(axes: <RadialAxis>[
                                  RadialAxis(
                                    minimum: 0,
                                    maximum: 100,
                                    showLabels: false,
                                    showTicks: false,
                                    radiusFactor: 0.9,
                                    axisLineStyle: AxisLineStyle(
                                      thickness: 0.06,
                                      cornerStyle: CornerStyle.bothCurve,
                                      color: Colors.grey.withOpacity(0.3),
                                      thicknessUnit: GaugeSizeUnit.factor,
                                    ),
                                    pointers: <GaugePointer>[
                                      RangePointer(
                                        color: AppColors.primary,
                                        value: ((context
                                                        .watch<
                                                            BasicGraphsBloc>()
                                                        .state
                                                        .case_ongoing_count! /
                                                    (context
                                                            .watch<
                                                                BasicGraphsBloc>()
                                                            .state
                                                            .case_ongoing_count! +
                                                        context
                                                            .watch<
                                                                BasicGraphsBloc>()
                                                            .state
                                                            .case_disposed_count!)) *
                                                100)
                                            .roundToDouble(),
                                        cornerStyle: CornerStyle.bothCurve,
                                        width: 0.1,
                                        sizeUnit: GaugeSizeUnit.factor,
                                      )
                                    ],
                                    annotations: <GaugeAnnotation>[
                                      GaugeAnnotation(
                                          positionFactor: 0.8,
                                          angle: 90,
                                          widget: Column(
                                            children: [
                                              Text(
                                                'Ongoing',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                        fontSize: 18,
                                                        color:
                                                            AppColors.appGrey),
                                              ),
                                              Text(
                                                '${((context.watch<BasicGraphsBloc>().state.case_ongoing_count! / (context.watch<BasicGraphsBloc>().state.case_ongoing_count! + context.watch<BasicGraphsBloc>().state.case_disposed_count!)) * 100).round()}%',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                        fontSize: 26,
                                                        color:
                                                            AppColors.primary,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ],
                                          ))
                                    ],
                                  )
                                ]),
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.transparent,
                              child: CircularProgressIndicator())),
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

// AspectRatio(
// aspectRatio: 1.6,
// child: Padding(
// padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
// child: Container(
// decoration: BoxDecoration(boxShadow: [
// BoxShadow(
// color: AppColors.primary.withOpacity(0.1),
// spreadRadius: 2,
// blurRadius: 10)
// ]),
// child: Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(20.0),
// ),
// // elevation: 5,
// child: Stack(
// children: <Widget>[
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// const SizedBox(
// height: 15,
// ),
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 18.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Row(
// children: [
// Text(
// 'Ongoing vs Disposed',
// style: Theme.of(context)
// .textTheme
//     .bodyLarge
//     ?.copyWith(fontSize: 20),
// textAlign: TextAlign.center,
// ),
// const SizedBox(
// width: 5,
// ),
// Builder(builder: (context) {
// return GestureDetector(
// onTapDown: (details) {
// _start = 5;
// startTimer();
// tooltip.show(context);
// },
// onTapUp: (details) {
// if (_start != 0) tooltip.close();
// },
// onTapCancel: () {
// if (_start != 0) tooltip.close();
// },
// child: SvgPicture.asset(
// AppIcons.info,
// height: 15,
// width: 15,
// ));
// })
// ],
// ),
// SvgPicture.asset(AppIcons.expand)
// ],
// ),
// ),
// Expanded(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// child: SfRadialGauge(axes: <RadialAxis>[
// RadialAxis(
// minimum: 0,
// maximum: 100,
// showLabels: false,
// showTicks: false,
// radiusFactor: 0.9,
// axisLineStyle: AxisLineStyle(
// thickness: 0.06,
// cornerStyle: CornerStyle.bothCurve,
// color: Colors.grey.withOpacity(0.3),
// thicknessUnit: GaugeSizeUnit.factor,
// ),
// pointers: <GaugePointer>[
// RangePointer(
// color: AppColors.orangeTag,
// value: (context
//     .watch<BasicGraphsBloc>()
// .state
//     .case_ongoing_count! /
// (context
//     .watch<BasicGraphsBloc>()
// .state
//     .case_ongoing_count! +
// context
//     .watch<BasicGraphsBloc>()
// .state
//     .case_disposed_count!)) *
// 100,
// cornerStyle: CornerStyle.bothCurve,
// width: 0.1,
// sizeUnit: GaugeSizeUnit.factor,
// )
// ],
// annotations: <GaugeAnnotation>[
// GaugeAnnotation(
// positionFactor: 0.8,
// angle: 90,
// widget: Column(
// children: [
// Text(
// 'Ongoing',
// style: Theme.of(context)
// .textTheme
//     .bodyLarge
//     ?.copyWith(
// fontSize: 14,
// color: AppColors.appGrey),
// ),
// Text(
// '${((context.watch<BasicGraphsBloc>().state.case_ongoing_count! / (context.watch<BasicGraphsBloc>().state.case_ongoing_count! + context.watch<BasicGraphsBloc>().state.case_disposed_count!)) * 100).round()}%',
// style: Theme.of(context)
// .textTheme
//     .bodyLarge
//     ?.copyWith(
// fontSize: 22,
// color: AppColors.orangeTag,
// fontWeight: FontWeight.bold),
// ),
// ],
// ))
// ],
// )
// ]),
// ),
// ),
// Padding(
// padding:
// const EdgeInsets.only(bottom: AppDefaults.padding),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
// children: [
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'Cases Ongoing',
// style: Theme.of(context)
// .textTheme
//     .bodyLarge
//     ?.copyWith(
// fontSize: 16, color: AppColors.appGrey),
// ),
// Text(
// context
//     .watch<BasicGraphsBloc>()
// .state
//     .case_ongoing_count!
// .toString(),
// style: Theme.of(context)
// .textTheme
//     .bodyLarge
//     ?.copyWith(
// fontSize: 18, color: Colors.black),
// ),
// ],
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Text(
// 'Cases Disposed',
// style: Theme.of(context)
// .textTheme
//     .bodyLarge
//     ?.copyWith(
// fontSize: 16, color: AppColors.appGrey),
// ),
// Text(
// context
//     .watch<BasicGraphsBloc>()
// .state
//     .case_disposed_count!
// .toString(),
// style: Theme.of(context)
// .textTheme
//     .bodyLarge
//     ?.copyWith(
// fontSize: 18, color: Colors.black),
// ),
// ],
// ),
// ],
// ),
// )
// ],
// ),
// ],
// ),
// ),
// ),
// ),
// );
