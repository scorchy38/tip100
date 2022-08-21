import 'dart:async';
import 'dart:convert';

import 'package:tip100/core/components/small_button.dart';
import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:tip100/screens/home/components/indicator.dart';
import 'package:tip100/screens/home/components/pie_chart.dart';
import 'package:tip100/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:super_tooltip/super_tooltip.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_defaults.dart';
import '../../../core/constants/app_icons.dart';
import 'package:http/http.dart' as http;

class RegionWiseChart extends StatefulWidget {
  const RegionWiseChart({Key? key}) : super(key: key);

  @override
  _RegionWiseChartState createState() => _RegionWiseChartState();
}

class _RegionWiseChartState extends State<RegionWiseChart> {
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
      aspectRatio: 1,
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
            child: Stack(
              children: <Widget>[
                Column(
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
                                'Region Wise Cases',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
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
                                ?.copyWith(
                                    fontSize: 14, color: AppColors.appGrey),
                          ),
                          Text(
                            '${context.read<BasicGraphsBloc>().state.startDate!.day}/${context.read<BasicGraphsBloc>().state.startDate!.month}/${context.read<BasicGraphsBloc>().state.startDate!.year} to ${context.read<BasicGraphsBloc>().state.endDate!.day}/${context.read<BasicGraphsBloc>().state.endDate!.month}/${context.read<BasicGraphsBloc>().state.endDate!.year}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    fontSize: 14, color: AppColors.appGrey),
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
                              .contains(BasicGraphsState().REGIONWISEKEY)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Indicator(
                                        color: AppColors.orangeTag,
                                        title: 'Central',
                                        cases:
                                            '${context.watch<BasicGraphsBloc>().state.case_region_wise!.where((el) => el['city__state__region'] == 'C').isEmpty ? 0 : context.watch<BasicGraphsBloc>().state.case_region_wise!.where((el) => el['city__state__region'] == 'C').first['region_count']} Cases'),
                                    Indicator(
                                        color: AppColors.greenTag,
                                        title: 'East',
                                        cases:
                                            '${context.watch<BasicGraphsBloc>().state.case_region_wise!.where((el) => el['city__state__region'] == 'E').isEmpty ? 0 : context.watch<BasicGraphsBloc>().state.case_region_wise!.where((el) => el['city__state__region'] == 'E').first['region_count']} Cases'),
                                    Indicator(
                                        color: AppColors.appBlue,
                                        title: 'North',
                                        cases:
                                            '${context.watch<BasicGraphsBloc>().state.case_region_wise!.where((el) => el['city__state__region'] == 'N').isEmpty ? 0 : context.watch<BasicGraphsBloc>().state.case_region_wise!.where((el) => el['city__state__region'] == 'N').first['region_count']} Cases'),
                                    Indicator(
                                        color: AppColors.appRed,
                                        title: 'South',
                                        cases:
                                            '${context.watch<BasicGraphsBloc>().state.case_region_wise!.where((el) => el['city__state__region'] == 'S').isEmpty ? 0 : context.watch<BasicGraphsBloc>().state.case_region_wise!.where((el) => el['city__state__region'] == 'S').first['region_count']} Cases'),
                                    Indicator(
                                        color: AppColors.purpleTag,
                                        title: 'West',
                                        cases:
                                            '${context.watch<BasicGraphsBloc>().state.case_region_wise!.where((el) => el['city__state__region'] == 'W').isEmpty ? 0 : context.watch<BasicGraphsBloc>().state.case_region_wise!.where((el) => el['city__state__region'] == 'W').first['region_count']} Cases'),
                                  ],
                                ),
                                FutureBuilder<List<double>>(
                                  builder: (ctx, snapshot) {
                                    if (snapshot.hasData)
                                      return Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: PieChartSample2(
                                          snapshot.data![0],
                                          snapshot.data![1],
                                          snapshot.data![2],
                                          snapshot.data![3],
                                          snapshot.data![4],
                                        ),
                                      );
                                    else
                                      return Container();
                                  },
                                  future: getData(),
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
                      padding:
                          const EdgeInsets.only(bottom: AppDefaults.padding),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
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
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<double>> getData() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    var headers = {
      'Accept': 'application/json, text/plain, */*',
      'Authorization': 'JWT ${_prefs.getString('token')}',
      'Content-Type': 'application/json',
    };

    var data = '{"lower_range":"2021-01-01","upper_range":"2021-12-31"}';

    var url = Uri.parse(
        'https://corporate.legistify.com/api/dashboard-case-region-wise/');
    var res = await http.post(url, headers: headers, body: data);
    if (res.statusCode != 200)
      throw Exception('http.post error: statusCode= ${res.statusCode}');
    print(res.body);

    Map resData = json.decode(res.body);
    double central = 0, north = 0, east = 0, west = 0, south = 0, total = 0;

    await resData["case_region_wise"].toList().forEach((el) {
      switch (el['city__state__region']) {
        case 'C':
          central = el['region_count'] * 1.0;

          break;
        case 'N':
          north = el['region_count'] * 1.0;
          break;
        case 'E':
          east = el['region_count'] * 1.0;
          break;
        case 'W':
          west = el['region_count'] * 1.0;
          break;
        case 'S':
          south = el['region_count'] * 1.0;
          break;
        default:
          print('Default');
          break;
      }
    });
    total = await central + north + east + west + south;
    central = await (central / total * 100).roundToDouble();
    north = await (north / total * 100).roundToDouble();
    east = await (east / total * 100).roundToDouble();
    west = await (west / total * 100).roundToDouble();
    south = await (south / total * 100).roundToDouble();
    return [central, north, east, west, south];
  }
}
