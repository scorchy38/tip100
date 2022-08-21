import 'dart:convert';
import 'dart:developer' as dev;
import 'dart:math';
import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/model/all_cases_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasicGraphsRepository {
  Stream<BasicGraphsState> getBasicGraphsData(
      DateTime startDate, DateTime endDate) async* {
    Map<String, dynamic> basicGraphsData = {};
    try {
      dev.log('Basic Graph $startDate $endDate');
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      var headers = {
        'Accept': 'application/json, text/plain, */*',
        'Authorization': 'JWT ${_prefs.getString('token')}',
        'Content-Type': 'application/json',
      };

      var data =
          '{"lower_range":"${startDate.year}-${startDate.month}-${startDate.day}","upper_range":"${endDate.year}-${endDate.month}-${endDate.day}"}';

      var url = Uri.parse('https://corporate.legistify.com/api/dashboard/');
      var res = await http.post(url, headers: headers, body: data);
      if (res.statusCode != 200)
        throw Exception('http.post error: statusCode= ${res.statusCode}');
      // print(res.body);
      var resData = json.decode(res.body);

      // print(resData["new_cases"].toList().length);
      // print(resData);
      int caseCount = 0,
          maxNewCases = 0,
          minNewCases = 100000,
          totalLocationsEngaged = 0,
          caseTypeCount = 0,
          ongoingCount = 0,
          disposedCount = 0;

      List<Map<String, dynamic>> cases = [];
      List<Map<String, dynamic>> locationsEngaged = [];
      List<Map<String, dynamic>> caseType = [];

      resData["new_cases"].toList().forEach((el) {
        cases.add(el);
        maxNewCases = max(maxNewCases, el['count']);
        minNewCases = min(minNewCases, el['count']);
        caseCount = caseCount + int.parse(el['count'].toString());
      });
      totalLocationsEngaged = resData['location_engaged_count'];
      resData["location_engaged"].toList().forEach((el) {
        locationsEngaged.add(el);
      });

      caseTypeCount = resData['case_type_count'];
      resData["case_type"].toList().forEach((el) {
        caseType.add(el);
      });
      ongoingCount = resData['case_ongoing_count'];
      disposedCount = resData['case_disposed_count'];
      // log(cases.toString());
      basicGraphsData = {
        'newCases': cases,
        'totalNewCases': caseCount,
        'minNewCases': minNewCases,
        'location_engaged_count': totalLocationsEngaged,
        'location_engaged': locationsEngaged,
        'maxNewCases': maxNewCases,
        'case_type': caseType,
        'case_ongoing_count': ongoingCount,
        'case_disposed_count': disposedCount,
        'case_type_count': caseTypeCount,
        'startDate': startDate,
        'endDate': endDate,
        'graphsPopulated': []
      };
      dev.log({
        'PrintingMap'
            'newCases': cases,
        'totalNewCases': caseCount,
        'minNewCases': minNewCases,
        'location_engaged_count': totalLocationsEngaged,
        'location_engaged': locationsEngaged,
        'maxNewCases': maxNewCases,
        'case_type': caseType,
        'case_ongoing_count': ongoingCount,
        'case_disposed_count': disposedCount,
        'case_type_count': caseTypeCount,
        'startDate': startDate,
        'endDate': endDate
      }.toString());
    } catch (e) {
      print('Error');
      print(e);
    }

    yield BasicGraphsState.fromMap(basicGraphsData);
  }

  Stream<List<Map>> getRegionWiseGraphData(
      DateTime startDate, DateTime endDate) async* {
    List<Map<String, dynamic>> regionWiseGraphData = [];
    try {
      dev.log('Region Wise Graph $startDate $endDate');
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      var headers = {
        'Accept': 'application/json, text/plain, */*',
        'Authorization': 'JWT ${_prefs.getString('token')}',
        'Content-Type': 'application/json',
      };

      var data =
          '{"lower_range":"${startDate.year}-${startDate.month}-${startDate.day}","upper_range":"${endDate.year}-${endDate.month}-${endDate.day}"}';

      var url = Uri.parse(
          'https://corporate.legistify.com/api/dashboard-case-region-wise/');
      var res = await http.post(url, headers: headers, body: data);
      if (res.statusCode != 200)
        throw Exception('http.post error: statusCode= ${res.statusCode}');

      Map resData = json.decode(res.body);
      await resData["case_region_wise"].toList().forEach((el) {
        regionWiseGraphData.add(el);
      });
    } catch (e) {
      print('Error');
      print(e);
    }

    yield regionWiseGraphData;
  }

  Stream<List<DateTime>> changeDuration(String selectedDuration) async* {
    List<DateTime> dates = [DateTime.now(), DateTime.now()];
    try {
      if (selectedDuration == 'Past30') {
        dates[0] = DateTime.now();
        dates[1] = DateTime.now().subtract(Duration(days: 30));
      } else if (selectedDuration == 'Past180') {
        dates[0] = DateTime.now();
        dates[1] = DateTime.now().subtract(Duration(days: 180));
      } else if (selectedDuration == 'Past365') {
        dates[0] = DateTime.now();
        dates[1] = DateTime.now().subtract(Duration(days: 365));
      } else if (selectedDuration == 'PastFY') {
        dates[0] = DateTime(DateTime.now().year, 3, 31);
        dates[1] = DateTime(DateTime.now().year - 1, 4, 1);
      } else if (selectedDuration == 'AllTime') {
        dates[0] = DateTime.now();
        dates[1] = DateTime(1990, 01, 01);
      }
    } catch (e) {
      print('Error');
      print(e);
    }

    yield dates;
  }

  Stream<BasicGraphsState> getCaseByAgainstGraphData(
      DateTime startDate, DateTime endDate) async* {
    Map<String, dynamic> basicGraphsData = {};
    try {
      dev.log('Case By Against Graph $startDate $endDate');
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      int caseByCount = 0, caseAgainstCount = 0;
      var headers = {
        'Accept': 'application/json, text/plain, */*',
        'Authorization': 'JWT ${_prefs.getString('token')}',
        'Content-Type': 'application/json',
      };

      var data =
          '{"lower_range":"${startDate.year}-${startDate.month}-${startDate.day}","upper_range":"${endDate.year}-${endDate.month}-${endDate.day}"}';

      var url = Uri.parse(
          'https://corporate.legistify.com/api/dashboard-case-by-against/');
      var res = await http.post(url, headers: headers, body: data);
      if (res.statusCode != 200)
        throw Exception('http.post error: statusCode= ${res.statusCode}');
      print(res.body);

      Map resData = json.decode(res.body);
      if (resData['case_by']
              .toList()
              .where((el) => el['case_by'] == 'CA')
              .length !=
          0)
        caseAgainstCount = resData['case_by']
            .toList()
            .where((el) => el['case_by'] == 'CA')
            .toList()[0]['case_by_count'];
      if (resData['case_by']
              .toList()
              .where((el) => el['case_by'] == 'CB')
              .length !=
          0)
        caseByCount = resData['case_by']
            .toList()
            .where((el) => el['case_by'] == 'CB')
            .toList()[0]['case_by_count'];
      basicGraphsData = {
        'case_by_count': caseByCount,
        'case_against_count': caseAgainstCount
      };
    } catch (e) {
      print('Error');
      print(e);
    }

    yield BasicGraphsState.fromMap(basicGraphsData);
  }

  Stream<BasicGraphsState> getProductWiseComplaintsGraphsData(
      DateTime startDate, DateTime endDate) async* {
    Map<String, dynamic> basicGraphsData = {};
    try {
      dev.log('Product Wise Graph $startDate $endDate');
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      var headers = {
        'Accept': 'application/json, text/plain, */*',
        'Authorization': 'JWT ${_prefs.getString('token')}',
        'Content-Type': 'application/json',
      };

      var data =
          '{"lower_range":"${startDate.year}-${startDate.month}-${startDate.day}","upper_range":"${endDate.year}-${endDate.month}-${endDate.day}"}';

      var url = Uri.parse(
          'https://corporate.legistify.com/api/dashboard-case-product-wise/');
      var res = await http.post(url, headers: headers, body: data);
      if (res.statusCode != 200)
        throw Exception('http.post error: statusCode= ${res.statusCode}');
      var resData = json.decode(res.body);

      List<Map<String, dynamic>> productWiseComplaints = [];

      resData["product_model"].toList().forEach((el) {
        productWiseComplaints.add(el);
      });

      basicGraphsData = {
        'product_wise_complaints': productWiseComplaints,
      };
    } catch (e) {
      print('Error');
      print(e);
    }

    yield BasicGraphsState.fromMap(basicGraphsData);
  }
}
