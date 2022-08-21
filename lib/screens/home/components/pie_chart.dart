import 'package:tip100/core/constants/app_colors.dart';
import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'indicator.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2(
      this.central, this.north, this.east, this.west, this.south,
      {Key? key})
      : super(key: key);
  final double central;
  final double north;
  final double east;
  final double west;
  final double south;

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChartSample2> {
  int touchedIndex = -1;
  String touchedSectionname = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.85,
      child: PieChart(
        PieChartData(
            // pieTouchData: PieTouchData(
            //     touchCallback: (FlTouchEvent event, pieTouchResponse) {
            //   setState(() {
            //     if (!event.isInterestedForInteractions ||
            //         pieTouchResponse == null ||
            //         pieTouchResponse.touchedSection == null) {
            //       touchedIndex = -1;
            //       touchedSectionname = '';
            //       return;
            //     }
            //     touchedIndex =
            //         pieTouchResponse.touchedSection!.touchedSectionIndex;
            //     print(pieTouchResponse.touchedSection);
            //   });
            // }),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 70,
            sections: showingSections()),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    int len = 0;
    return [
      if (widget.central != 0)
        PieChartSectionData(
          showTitle: true,
          title: 0 == touchedIndex ? '0%' : '',
          color: AppColors.orangeTag,
          value: widget.central,
          radius: 0 == touchedIndex ? 30.0 : 25.0,
          titleStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff)),
        ),
      if (widget.east != 0)
        PieChartSectionData(
          color: AppColors.greenTag,
          value: widget.east,
          showTitle: true,
          title: 1 == touchedIndex ? '0%' : '',
          radius: 1 == touchedIndex ? 30.0 : 25.0,
          titleStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        ),
      if (widget.north != 0)
        PieChartSectionData(
          color: AppColors.appBlue,
          value: widget.north,
          showTitle: true,
          title: 2 == touchedIndex ? '0%' : '',
          radius: 2 == touchedIndex ? 30.0 : 25.0,
          titleStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        ),
      if (widget.south != 0)
        PieChartSectionData(
          color: AppColors.appRed,
          value: widget.south,
          showTitle: true,
          title: 3 == touchedIndex ? '0%' : '',
          radius: 3 == touchedIndex ? 30.0 : 25.0,
          titleStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        ),
      if (widget.west != 0)
        PieChartSectionData(
          color: AppColors.purpleTag,
          value: widget.west,
          showTitle: true,
          title: 4 == touchedIndex ? '0%' : '',
          radius: 4 == touchedIndex ? 30.0 : 25.0,
          titleStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff)),
        )
    ];
    return List.generate(5, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 30.0 : 25.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            showTitle: true,
            title: isTouched ? '0%' : '',
            color: AppColors.orangeTag,
            value: widget.central,
            radius: radius,
            titleStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.greenTag,
            value: widget.east,
            showTitle: true,
            title: isTouched ? '18%' : '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.appBlue,
            value: widget.north,
            showTitle: true,
            title: isTouched ? '34%' : '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.appRed,
            value: widget.south,
            showTitle: true,
            title: isTouched ? '21%' : '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            color: AppColors.purpleTag,
            value: widget.west,
            showTitle: true,
            title: isTouched ? '26%' : '',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
