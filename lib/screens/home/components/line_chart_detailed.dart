import 'dart:async';
import 'dart:developer';

import 'package:tip100/core/constants/app_defaults.dart';
import 'package:tip100/core/constants/constants.dart';
import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:tip100/size_config.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:super_tooltip/super_tooltip.dart' as Tooltip;

import '../../../core/components/small_button.dart';
import '../../../core/constants/app_icons.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({Key? key}) : super(key: key);

  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [AppColors.tertiary, Colors.white];
  int _start = 5;
  Timer _timer = Timer(const Duration(seconds: 5), () => print(''));

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: AppColors.primary, width: 2),
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(AppDefaults.padding),
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
                            ?.copyWith(fontSize: 16),
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
                  SvgPicture.asset(AppIcons.shrink)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDefaults.padding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Range- ${context.watch<BasicGraphsBloc>().state.startDate!.day}/${context.watch<BasicGraphsBloc>().state.startDate!.month}/${context.watch<BasicGraphsBloc>().state.startDate!.year} to ${context.watch<BasicGraphsBloc>().state.endDate!.day}/${context.watch<BasicGraphsBloc>().state.endDate?.month}/${context.watch<BasicGraphsBloc>().state.endDate!.year}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: getProportionateScreenHeight(15),
                        color: AppColors.appGrey),
                  ),
                  Text(
                    ' ● Updated Just Now',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: getProportionateScreenHeight(12),
                        color: AppColors.appGrey),
                  ),
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 1.1,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 18.0, left: 12.0, top: 0, bottom: 12),
                  child: Builder(
                    builder: (context) {
                      List<FlSpot> newCasesList = [];
                      context
                          .watch<BasicGraphsBloc>()
                          .state
                          .newCases!
                          .forEach((element) {
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
                      return context
                              .watch<BasicGraphsBloc>()
                              .state
                              .graphsPopulated!
                              .contains(BasicGraphsState().BASICGRAPHSKEY)
                          ? newCasesList.isEmpty
                              ? const Center(
                                  child: Text('No Cases Found'),
                                )
                              : LineChart(
                                  mainData(
                                      newCasesList,
                                      context
                                          .watch<BasicGraphsBloc>()
                                          .state
                                          .minNewCases!,
                                      context
                                          .watch<BasicGraphsBloc>()
                                          .state
                                          .maxNewCases!),
                                )
                          : const Center(
                              child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.transparent,
                                  child: CircularProgressIndicator()));
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: AppDefaults.padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.greenTag),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Row(
                          children: [
                            Text(
                              'View All Cases ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(color: Colors.white),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              size: 14,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
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
                          items: <String>['Annually', 'Half Yearly', 'Monthly']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value,
                                child: InkWell(
                                  splashColor: AppColors.primary,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: AppColors.appBlue,
                                        fontWeight: FontWeight.w500),
                                  ),
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
    );
  }

  String dropdownValue = "Annually";

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.appGrey,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Apr';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'July';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dec';
        break;
      default:
        text = '';
        break;
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.appGrey,
      fontSize: 10,
    );
    // String text;
    // switch (value.toInt()) {
    //   case 0:
    //     text = '0';
    //     break;
    //   case 1:
    //     text = '1';
    //     break;
    //   case 2:
    //     text = '2';
    //     break;
    //   case 3:
    //     text = '3';
    //     break;
    //   case 4:
    //     text = '4';
    //     break;
    //   case 5:
    //     text = '5';
    //     break;
    //
    //   default:
    //     return Container();
    // }

    return Text(value.toInt().toString(),
        style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(
      List<FlSpot> newCasesList, int minCases, int maxCases) {
    return LineChartData(
      lineTouchData: LineTouchData(touchTooltipData: LineTouchTooltipData(
        // tooltipBgColor: Colors.red,
        getTooltipItems: (value) {
          return value.map((e) {
            if (e.x.floor() == 0)
              return LineTooltipItem(
                  "Jan : ${e.y.round()}", TextStyle(color: Colors.white));
            if (e.x.floor() == 1)
              return LineTooltipItem(
                  "Feb : ${e.y.round()}", TextStyle(color: Colors.white));
            if (e.x.floor() == 2)
              return LineTooltipItem(
                  "Mar : ${e.y.round()}", TextStyle(color: Colors.white));
            if (e.x.floor() == 3)
              return LineTooltipItem(
                  "Apr : ${e.y.round()}", TextStyle(color: Colors.white));
            if (e.x.floor() == 4)
              return LineTooltipItem(
                  "May : ${e.y.round()}", TextStyle(color: Colors.white));
            if (e.x.floor() == 5)
              return LineTooltipItem(
                  "Jun : ${e.y.round()}", TextStyle(color: Colors.white));

            if (e.x.floor() == 6)
              return LineTooltipItem(
                  "Jul : ${e.y.round()}", TextStyle(color: Colors.white));
            if (e.x.floor() == 7)
              return LineTooltipItem(
                  "Aug : ${e.y.round()}", TextStyle(color: Colors.white));
            if (e.x.floor() == 8)
              return LineTooltipItem(
                  "Sep : ${e.y.round()}", TextStyle(color: Colors.white));
            if (e.x.floor() == 9)
              return LineTooltipItem(
                  "Oct : ${e.y.round()}", TextStyle(color: Colors.white));
            if (e.x.floor() == 10)
              return LineTooltipItem(
                  "Nov : ${e.y.round()}", TextStyle(color: Colors.white));
            if (e.x.floor() == 11)
              return LineTooltipItem(
                  "Dec : ${e.y.round()}", TextStyle(color: Colors.white));
          }).toList();
        },
      )),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: AppColors.gridGrey,
            strokeWidth: 2.5,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: minCases * 1.0,
      maxY: maxCases * 1.0,
      lineBarsData: [
        LineChartBarData(
          spots: newCasesList,
          // spots: const [
          //   FlSpot(0, 1),
          //   FlSpot(2.6, 5),
          //   FlSpot(4.9, 3),
          //   FlSpot(6.8, 4),
          //   FlSpot(8, 2),
          //   FlSpot(9.5, 3),
          //   FlSpot(11, 4),
          // ],
          isCurved: true,
          color: AppColors.primary,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: false,
            gradient: const LinearGradient(
              colors: [AppColors.tertiary, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
