import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/model/all_cases_model.dart';
import 'package:tip100/model/cause_list_pdf_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/cause_list_free_text_model.dart';

class CauseListFreeTextRepository {
  Stream<List<CauseListFreeText>> getInitial20Causes() async* {
    List<CauseListFreeText> result = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'accept': 'application/json, text/plain, */*',
        'authorization': 'JWT ${_prefs.getString('token')}',
        'content-type': 'application/json',
      };

      var data =
          '{"lower_range":"${DateTime.now().subtract(Duration(days: 90)).year}-${DateTime.now().subtract(Duration(days: 90)).month.toString().padLeft(2, '0')}-${DateTime.now().subtract(Duration(days: 90)).day.toString().padLeft(2, '0')}","upper_range":"${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}","page":1}';

      var url =
          Uri.parse('https://corporate.legistify.com/api/causelist/freetext/');
      var res = await http.post(url, headers: headers, body: data);
      if (res.statusCode != 202)
        throw Exception('http.post error: statusCode= ${res.statusCode}');
      print(res.body);

      if (res.statusCode == 202) {
        Map resData = json.decode(res.body);
        List cases = resData["data"].toList();
        cases.forEach((element) {
          result.add(CauseListFreeText.fromJson(element));
        });
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }

    yield result;
  }

  Stream<int> getCausesCount() async* {
    int result = 0;
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'accept': 'application/json, text/plain, */*',
        'authorization': 'JWT ${_prefs.getString('token')}',
        'content-type': 'application/json',
      };

      var data =
          '{"lower_range":"${DateTime.now().subtract(Duration(days: 90)).year}-${DateTime.now().subtract(Duration(days: 90)).month.toString().padLeft(2, '0')}-${DateTime.now().subtract(Duration(days: 90)).day.toString().padLeft(2, '0')}","upper_range":"${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}","page":1}';

      var url =
          Uri.parse('https://corporate.legistify.com/api/causelist/freetext/');
      var res = await http.post(url, headers: headers, body: data);
      if (res.statusCode != 202)
        throw Exception('http.post error: statusCode= ${res.statusCode}');
      print(res.body);

      if (res.statusCode == 202) {
        Map resData = json.decode(res.body);
        result = resData["count"];
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }
    yield result;
  }

  Stream<List<CauseListFreeText>> getPaginatedCases(String skip, String page,
      String limit, List<CauseListFreeText> loadedCases) async* {
    List<CauseListFreeText> res = loadedCases;
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
          res.add(CauseListFreeText.fromJson(element));
        });
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }

    yield res;
  }

  Stream<List<CauseListFreeText>> getFilteredCases(
    DateTime? startDate,
    DateTime? endDate,
  ) async* {
    List<CauseListFreeText> res = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      log(startDate.toString());
      log(endDate.toString());

      var requestBody = {
        if (startDate != null)
          "lower_range":
              '${startDate.year}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}',
        if (endDate != null)
          "lower_range":
              '${endDate.year}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}',
        "page": 1,
      };

      log(requestBody.toString());
      Dio dio = new Dio();
      dio.options.headers['content-type'] = 'application/json';
      dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response = await dio.post(
          'https://corporate.legistify.com/api/causelist/freetext/',
          data: requestBody);

      // var resData = response.data;

      print('Loaded Filtered Results');
      log(response.data.toString());
      if (response.statusCode == 202) {
        // Map resData = json.decode(response.data.toString());
        List cases = response.data["data"].toList();
        cases.forEach((element) {
          res.add(CauseListFreeText.fromJson(element));
        });
      } else {}
      // if (response.statusCode == 200) {
      //   _prefs.setInt('numberOfCases', resData["count"]);
      //   List cases = resData["cases"].toList();
      //   cases.forEach((element) {
      //     res.add(CauseListPDF.fromJson(element));
      //   });
      // } else {}
    } catch (e) {
      print('Error');
      print(e);
    }

    yield res;
  }
}
