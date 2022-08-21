import 'dart:async';
import 'dart:math';

import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/app_icons.dart';
import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:expandable/expandable.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:super_tooltip/super_tooltip.dart' as Tooltip;

import 'line_chart_detailed.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        List<FlSpot> newCasesList = [];
        context.watch<BasicGraphsBloc>().state.newCases!.forEach((element) {
          switch (element['date'].toString().substring(0, 3)) {
            case 'Jan':
              newCasesList.add(
                FlSpot(0.0, element['count'] * 1.0),
              );
              break;
            case 'Feb':
              newCasesList.add(
                FlSpot(1.0, element['count'] * 1.0),
              );
              break;
            case 'Mar':
              newCasesList.add(
                FlSpot(2.0, element['count'] * 1.0),
              );
              break;
            case 'Apr':
              newCasesList.add(
                FlSpot(3.0, element['count'] * 1.0),
              );
              break;
            case 'May':
              newCasesList.add(
                FlSpot(4.0, element['count'] * 1.0),
              );
              break;
            case 'Jun':
              newCasesList.add(
                FlSpot(5.0, element['count'] * 1.0),
              );
              break;
            case 'Jul':
              newCasesList.add(
                FlSpot(6.0, element['count'] * 1.0),
              );
              break;
            case 'Aug':
              newCasesList.add(
                FlSpot(7.0, element['count'] * 1.0),
              );
              break;
            case 'Sep':
              newCasesList.add(
                FlSpot(8.0, element['count'] * 1.0),
              );
              break;
            case 'Oct':
              newCasesList.add(
                FlSpot(9.0, element['count'] * 1.0),
              );
              break;
            case 'Nov':
              newCasesList.add(
                FlSpot(10.0, element['count'] * 1.0),
              );
              break;
            case 'Dec':
              newCasesList.add(
                FlSpot(11.0, element['count'] * 1.0),
              );
              break;
          }
        });
        newCasesList.sort((a, b) => a.x.compareTo(b.x));

        return LineChart(
          sampleData1(
              newCasesList,
              context.watch<BasicGraphsBloc>().state.minNewCases!,
              context.watch<BasicGraphsBloc>().state.maxNewCases!),
          swapAnimationDuration: const Duration(milliseconds: 250),
        );
      },
    );
  }

  LineChartData sampleData1(
          List<FlSpot> newCasesList, int minCases, int maxCases) =>
      LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1(newCasesList, minCases, maxCases),
        minX: 0,
        maxX: 11,
        maxY: maxCases * 1.0,
        minY: minCases * 1.0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
      handleBuiltInTouches: true,
      touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.black.withOpacity(0.8),
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            LineTooltipItem lineToolTip = LineTooltipItem(
              touchedBarSpots[0].x == 1.0
                  ? 'Jan : ${(touchedBarSpots[0].y).round()}'
                  : touchedBarSpots[0].x == 2.0
                      ? 'Feb : ${(touchedBarSpots[0].y).round()}'
                      : touchedBarSpots[0].x == 3.0
                          ? 'Mar : ${(touchedBarSpots[0].y).round()}'
                          : touchedBarSpots[0].x == 4.0
                              ? 'Apr : ${(touchedBarSpots[0].y).round()}'
                              : touchedBarSpots[0].x == 5.0
                                  ? 'May : ${(touchedBarSpots[0].y).round()}'
                                  : touchedBarSpots[0].x == 6.0
                                      ? 'Jun : ${(touchedBarSpots[0].y).round()}'
                                      : touchedBarSpots[0].x == 7.0
                                          ? 'Jul : ${(touchedBarSpots[0].y).round()}'
                                          : touchedBarSpots[0].x == 8.0
                                              ? 'Aug : ${(touchedBarSpots[0].y).round()}'
                                              : touchedBarSpots[0].x == 9.0
                                                  ? 'Sep : ${(touchedBarSpots[0].y).round()}'
                                                  : touchedBarSpots[0].x == 10.0
                                                      ? 'Oct : ${(touchedBarSpots[0].y).round()}'
                                                      : touchedBarSpots[0].x ==
                                                              11.0
                                                          ? 'Nov : ${(touchedBarSpots[0].y).round()}'
                                                          : 'Dec : ${(touchedBarSpots[0].y).round()}',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );

            return [lineToolTip];
            // return [
            //   if (nextInt == 1)
            //     LineTooltipItem(
            //       'Jan : ${nextInt.toString()}',
            //       const TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     )
            //   else if (nextInt == 2)
            //     LineTooltipItem(
            //       'Feb : ${nextInt.toString()}',
            //       const TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     )
            //   else if (nextInt == 3)
            //     LineTooltipItem(
            //       'Mar : ${nextInt.toString()}',
            //       const TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     )
            //   else if (nextInt == 4)
            //     LineTooltipItem(
            //       'Apr : ${nextInt.toString()}',
            //       const TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     )
            //   else if (nextInt == 5)
            //     LineTooltipItem(
            //       'May : ${nextInt.toString()}',
            //       const TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     )
            //   else if (nextInt == 6)
            //     LineTooltipItem(
            //       'Jun : ${nextInt.toString()}',
            //       const TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     )
            //   else if (nextInt == 7)
            //     LineTooltipItem(
            //       'Jul : ${nextInt.toString()}',
            //       const TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     )
            //   else if (nextInt == 8)
            //     LineTooltipItem(
            //       'Aug : ${nextInt.toString()}',
            //       const TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     )
            //   else if (nextInt == 9)
            //     LineTooltipItem(
            //       'Sep : ${nextInt.toString()}',
            //       const TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     )
            //   else if (nextInt == 10)
            //     LineTooltipItem(
            //       'Oct : ${nextInt.toString()}',
            //       const TextStyle(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     )
            // ];
          }));

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> lineBarsData1(
          List<FlSpot> newCasesList, int minCases, int maxCases) =>
      [
        lineChartBarData1_1(newCasesList, minCases, maxCases),
      ];

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  SideTitles leftTitles() => SideTitles(
        // showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  SideTitles get bottomTitles => SideTitles(
        // showTitles: true,
        reservedSize: 32,
        interval: 1,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: Colors.transparent),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData lineChartBarData1_1(
          List<FlSpot> newCasesList, int minCases, int maxCases) =>
      LineChartBarData(
        isCurved: true,
        color: AppColors.primary,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
            show: true,
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.tertiary, Colors.white])),
        spots: newCasesList,
      );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

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

// ExpandableController controller=new ExpandableController();
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        scrollOnExpand: true,
        scrollOnCollapse: false,
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            useInkWell: true,
            hasIcon: false,
            tapBodyToExpand: true,
            headerAlignment: ExpandablePanelHeaderAlignment.bottom,
            tapBodyToCollapse: true,
          ),
          // header: AspectRatio(
          //   aspectRatio: 2,
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
          //     child: Card(
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20.0),
          //       ),
          //       elevation: 5,
          //       child: Stack(
          //         children: <Widget>[
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: <Widget>[
          //               const SizedBox(
          //                 height: 15,
          //               ),
          //                Padding(
          //                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
          //                  child: Row(
          //                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                    children: [
          //                      Row(
          //                        children: [
          //                          Text(
          //                           'New Cases Initiated',
          //                           style:  Theme.of(context)
          //                               .textTheme
          //                               .bodyLarge
          //                               ?.copyWith(fontSize: 16),
          //                           textAlign: TextAlign.center,
          //               ),
          //                          const SizedBox(
          //                            width: 5,
          //                          ),
          //                          SvgPicture.asset(AppIcons.info)
          //                        ],
          //                      ),
          //                      InkWell(
          //                          onTap: (){
          //
          //                          },
          //                          child: SvgPicture.asset(AppIcons.expand))
          //                    ],
          //                  ),
          //                ), const SizedBox(
          //                 height: 5,
          //               ),
          //                Padding(
          //                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
          //                  child: Text(
          //                   '874',
          //                   style:  Theme.of(context)
          //                       .textTheme
          //                       .bodyLarge
          //                       ?.copyWith(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primary),
          //                   textAlign: TextAlign.center,
          //               ),
          //                ),
          //
          //
          //
          //               Expanded(
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(8.0),
          //                   child: _LineChart(isShowingMainData: isShowingMainData),
          //                 ),
          //               ),
          //
          //             ],
          //           ),
          //
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          expanded: context
                  .watch<BasicGraphsBloc>()
                  .state
                  .graphsPopulated!
                  .contains(BasicGraphsState().BASICGRAPHSKEY)
              ? LineChartSample2()
              : CircularProgressIndicator(),
          builder: (_, collapsed, expanded) {
            return Expandable(
              collapsed: collapsed,
              expanded: expanded,
              theme: const ExpandableThemeData(crossFadePoint: 0),
            );
          },
          collapsed: AspectRatio(
            aspectRatio: 2,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
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
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'New Cases Initiated',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(fontSize: 20),
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
                                SvgPicture.asset(AppIcons.expand)
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Builder(
                            builder: (context) {
                              int caseCount = context
                                  .watch<BasicGraphsBloc>()
                                  .state
                                  .totalNewCases!;

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: Text(
                                  '$caseCount',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primary),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: context
                                      .watch<BasicGraphsBloc>()
                                      .state
                                      .graphsPopulated!
                                      .contains(
                                          BasicGraphsState().BASICGRAPHSKEY)
                                  ? _LineChart(
                                      isShowingMainData: isShowingMainData)
                                  : Center(
                                      child: CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.transparent,
                                          child: CircularProgressIndicator())),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
