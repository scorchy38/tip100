import 'dart:math';

import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/app_colors.dart';

class BarChartDetailedWithData extends StatefulWidget {
  const BarChartDetailedWithData(
      this.yAxisKey, this.countKey, this.locationsEngaged,
      {Key? key})
      : super(key: key);

  final String countKey;
  final String yAxisKey;
  final List locationsEngaged;

  @override
  State<StatefulWidget> createState() => BarChartDetailedWithDataState();
}

class BarChartDetailedWithDataState extends State<BarChartDetailedWithData> {
  int touchedIndex = -1;

  Widget bottomTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff939393),
      fontSize: 10,
    );

    return Transform.rotate(
        angle: pi / 2.5,
        child: SizedBox(
          width: (MediaQuery.of(context).size.width * 2.3) /
              widget.locationsEngaged.length,
          child: Row(
            children: [
              SizedBox(
                width: 2,
              ),
              Text(
                widget.locationsEngaged[value.toInt()][widget.yAxisKey],
                style: style,
                textAlign: TextAlign.start,
              ),
              // Spacer()
            ],
          ),
        ));
  }

  Widget leftTitles(double value, TitleMeta meta) {
    if (value == meta.max) {
      return Container();
    }
    const style = TextStyle(
      color: Color(
        0xff939393,
      ),
      fontSize: 10,
    );
    return Text(
      meta.formattedValue,
      style: style,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: context
                .watch<BasicGraphsBloc>()
                .state
                .graphsPopulated!
                .contains(BasicGraphsState().BASICGRAPHSKEY)
            ? widget.locationsEngaged.length == 0
                ? Center(
                    child: Text('No Cases Found'),
                  )
                : BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.center,
                      barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                            tooltipBgColor: Colors.black.withOpacity(0.8),
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              return BarTooltipItem(
                                " ",
                                const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: (rod.toY).toStringAsFixed(0),
                                    style: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
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
                            touchedIndex =
                                barTouchResponse.spot!.touchedBarGroupIndex;
                          });
                        },
                      ),
                      titlesData: FlTitlesData(
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 90,
                            getTitlesWidget: bottomTitles,
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 28,
                            getTitlesWidget: leftTitles,
                          ),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      gridData: FlGridData(
                        show: true,
                        checkToShowHorizontalLine: (value) => value % 5 == 0,
                        getDrawingHorizontalLine: (value) => FlLine(
                          color: AppColors.gridGrey,
                          strokeWidth: 2.5,
                        ),
                        horizontalInterval: 5,
                        drawVerticalLine: false,
                      ),
                      minY: 0,
                      maxY: 15,
                      borderData: FlBorderData(
                        show: false,
                      ),
                      groupsSpace: 5,
                      barGroups: getData(isTouched: 0 == touchedIndex),
                    ),
                  )
            : Center(
                child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.transparent,
                    child: CircularProgressIndicator())),
      ),
    );
  }

  List<BarChartGroupData> getData({bool isTouched = false}) {
    List<BarChartGroupData> groupData = [];

    for (int i = 0; i < widget.locationsEngaged.length; i++)
      groupData.add(BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
              color: isTouched ? AppColors.secondary : AppColors.primary,
              borderSide: isTouched
                  ? const BorderSide(color: AppColors.secondary, width: 1)
                  : const BorderSide(color: Colors.white, width: 0),
              toY: widget.locationsEngaged[i][widget.countKey] * 1.0,
              width: MediaQuery.of(context).size.width *
                  0.6 /
                  widget.locationsEngaged.length,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        ],
      ));
    return groupData;
  }
}
