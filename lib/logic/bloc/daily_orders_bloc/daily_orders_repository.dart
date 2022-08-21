import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/model/all_cases_model.dart';
import 'package:tip100/model/cause_list_pdf_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/daily_orders_model.dart';

class DailyOrdersRepository {
  Stream<List<DailyOrders>> getInitial20DailyOrders() async* {
    List<DailyOrders> result = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'accept': '*/*',
        'authorization': 'JWT ${_prefs.getString('token')}',
        'Accept-Encoding': 'gzip',
      };

      var url = Uri.parse(
          'https://scraper-dev.legistrak.com/api/v1/orders/?order_type=order');
      var res = await http.get(url, headers: headers);
      if (res.statusCode != 200)
        throw Exception('http.get error: statusCode= ${res.statusCode}');
      print(res.body);

      if (res.statusCode == 200) {
        Map resData = json.decode(res.body);
        List dailyOrders = resData["docs"].toList();
        dailyOrders.forEach((element) {
          result.add(DailyOrders.fromJson(element));
        });
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }

    yield result;
  }

  Stream<int> getDailyOrdersCount() async* {
    int result = 0;
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'accept': '*/*',
        'authorization': 'JWT ${_prefs.getString('token')}',
        'Accept-Encoding': 'gzip',
      };

      var url = Uri.parse(
          'https://scraper-dev.legistrak.com/api/v1/orders/?order_type=order');
      var res = await http.get(url, headers: headers);
      if (res.statusCode != 200)
        throw Exception('http.get error: statusCode= ${res.statusCode}');
      print(res.body);

      if (res.statusCode == 200) {
        Map resData = json.decode(res.body);
        result = resData["totalDocs"];
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }
    yield result;
  }

  Stream<List<DailyOrders>> getPaginatedDailyOrders(String skip, String page,
      String limit, List<DailyOrders> loadedCases) async* {
    List<DailyOrders> res = loadedCases;
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var requestBody = {"page": page, "skip": skip, "limit": limit};
      Dio dio = new Dio();
      dio.options.headers['content-type'] = 'application/json';
      dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response = await dio.post(
          'https://corporate.legistify.com/api/case-filter/',
          data: requestBody);

      var resData = response.data;
      print('Loaded Next 50');
      print(skip);
      print(page);
      print(limit);

      if (response.statusCode == 200) {
        List cases = resData["cases"].toList();
        cases.forEach((element) {
          res.add(DailyOrders.fromJson(element));
        });
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }

    yield res;
  }

  Stream<List<DailyOrders>> getFilteredDailyOrders(
    String cnr,
    String title,
    int court,
    DateTime? startDate,
    DateTime? endDate,
  ) async* {
    List<DailyOrders> result = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'accept': '*/*',
        'authorization': 'JWT ${_prefs.getString('token')}',
        'Accept-Encoding': 'gzip',
      };

      var url = Uri.parse(
          'https://scraper-dev.legistrak.com/api/v1/orders/?${court == MAXINT ? '' : 'court_link_id=$court'}&fromDate=${startDate != null ? '${startDate.day.toString().padLeft(2, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.year}' : ''}&toDate=${endDate != null ? '${endDate.day.toString().padLeft(2, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.year}' : ''}&case_no=$cnr&judge_name=&title=$title&order_type=order');
      var res = await http.get(url, headers: headers);
      if (res.statusCode != 200)
        throw Exception('http.get error: statusCode= ${res.statusCode}');
      print(res.body);

      if (res.statusCode == 200) {
        Map resData = json.decode(res.body);
        List dailyOrders = resData["docs"].toList();
        dailyOrders.forEach((element) {
          result.add(DailyOrders.fromJson(element));
        });
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }

    yield result;
  }
}
