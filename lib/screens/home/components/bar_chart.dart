import 'dart:async';
import 'dart:math';
import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_defaults.dart';

class BarChartSample1 extends StatefulWidget {
  const BarChartSample1(this.title, this.count, this.locationsEngaged,
      this.countKey, this.yAxisKey,
      {Key? key})
      : super(key: key);
  final String title;
  final String countKey;
  final String yAxisKey;
  final List locationsEngaged;
  final String count;
  @override
  State<StatefulWidget> createState() => BarChartSample1State();
}

class BarChartSample1State extends State<BarChartSample1> {
  final Color barBackgroundColor = Colors.amber;
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;

  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDefaults.padding,
        ),
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: AppColors.primary.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
          child: Card(
            // elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        widget.title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Text(
                        widget.count,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: context
                                .watch<BasicGraphsBloc>()
                                .state
                                .graphsPopulated!
                                .contains(BasicGraphsState().BASICGRAPHSKEY)
                            ? BarChart(
                                mainBarData(widget.locationsEngaged,
                                    widget.countKey, widget.yAxisKey),
                                swapAnimationDuration: animDuration,
                              )
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
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = AppColors.primary,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
          toY: isTouched ? y + 1 : y,
          color: isTouched ? AppColors.secondary : barColor,
          width: width,
          borderSide: isTouched
              ? const BorderSide(color: AppColors.secondary, width: 1)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: false,
            toY: 20,
            color: barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups(List locationEngaged, String countKey) {
    List<BarChartGroupData> groupData = [];
    for (int i = 0; i < locationEngaged.length; i++) {
      groupData.add(makeGroupData(i, locationEngaged[i][countKey] * 1.0,
          isTouched: i == touchedIndex));
    }
    return groupData;
    // List.generate(7, (i) {
    //   switch (i) {
    //     case 0:
    //       return makeGroupData(0, 5, isTouched: i == touchedIndex);
    //     case 1:
    //       return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
    //     case 2:
    //       return makeGroupData(2, 5, isTouched: i == touchedIndex);
    //     case 3:
    //       return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
    //     case 4:
    //       return makeGroupData(4, 9, isTouched: i == touchedIndex);
    //     case 5:
    //       return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
    //     case 6:
    //       return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
    //     default:
    //       return throw Error();
    //   }
    // });
  }

  BarChartData mainBarData(
      List locationsEngaged, String countKey, String yAxisKey) {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.black,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;

              return BarTooltipItem(
                "${locationsEngaged[groupIndex][yAxisKey]}" + '\n',
                const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.toY - 1).toString(),
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        // show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            // showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(locationsEngaged, countKey),
      gridData: FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );

    return const Padding(padding: EdgeInsets.only(top: 16), child: Text(" "));
  }
}
