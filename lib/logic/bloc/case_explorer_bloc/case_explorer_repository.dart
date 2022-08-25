import 'dart:convert';
import 'dart:developer';

import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/model/all_cases_model.dart';
import 'package:tip100/model/case_explorer_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CaseExplorerRepository {
  Stream<List<CaseExplorerModel>> getInitial20Cases() async* {
    List<CaseExplorerModel> res = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var requestBody = {
        "scrape_type": 3, "lower_range": "2022-04-05T10:19:21.220Z",
        "upper_range": "2022-07-05T10:19:21.221Z",
        // "lower_range":
        //     "${DateTime.now().subtract(Duration(days: 90)).year}-${DateTime.now().subtract(Duration(days: 90)).month}-${DateTime.now().subtract(Duration(days: 90)).day}T10:19:21.220Z",
        // "upper_range":
        //     "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}T10:19:21.221Z",
        "keyword_type": 0,
        "keyword_search_for": "C"
      };
      Dio dio = new Dio();
      dio.options.headers['content-type'] = 'application/json';
      dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response = await dio.post(
          'https://corporate.legistify.com/api/case-explorer-filter/',
          data: requestBody);

      var resData = response.data;
      print('Cases List Length');
      print(resData["data"].toList().length);
      // print(resData);

      if (response.statusCode == 200) {
        List cases = resData["data"].toList();
        cases.forEach((element) {
          res.add(CaseExplorerModel.fromJson(element));
        });
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }

    yield res;
  }

  Stream<List<AllCasesModel>> getAlerts() async* {
    List<AllCasesModel> res = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var requestBody = {"page": "1", "skip": "0", "limit": "50"};
      Dio dio = new Dio();
      // dio.options.headers['content-type'] = 'application/json';
      // dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      print(
          "https://tip100.herokuapp.com/getAllTips?uid=${_prefs.getString('token')}");
      Response response =
          await dio.get('https://tip100.herokuapp.com/getAllTips');

      var resData = response.data;
      print('Cases List Length');
      print(resData["chain"].toList().length);
      // print(resData);

      if (response.statusCode == 200) {
        List cases = resData["chain"].toList();

        cases.forEach((element) {
          print(element);
          res.add(AllCasesModel.fromJson(element));
        });
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }

    yield res;
  }

  Stream<int> getCasesCount() async* {
    int res = 0;
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var requestBody = {
        "scrape_type": 3, "lower_range": "2022-04-05T10:19:21.220Z",
        "upper_range": "2022-07-05T10:19:21.221Z",
        // "lower_range":
        //     "${DateTime.now().subtract(Duration(days: 90)).year}-${DateTime.now().subtract(Duration(days: 90)).month}-${DateTime.now().subtract(Duration(days: 90)).day}T10:19:21.220Z",
        // "upper_range":
        //     "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}T10:19:21.221Z",
        "keyword_type": 0,
        "keyword_search_for": "C"
      };
      Dio dio = new Dio();
      dio.options.headers['content-type'] = 'application/json';
      dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response = await dio.post(
          'https://corporate.legistify.com/api/case-explorer-filter/',
          data: requestBody);

      var resData = response.data;
      print('Cases List Length');
      if (response.statusCode == 200) {
        res = resData["count"];
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }

    yield res;
  }

  Stream<List<CaseExplorerModel>> getPaginatedCases(String skip, String page,
      String limit, List<CaseExplorerModel> loadedCases) async* {
    List<CaseExplorerModel> res = loadedCases;
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
          res.add(CaseExplorerModel.fromJson(element));
        });
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }

    yield res;
  }

  Stream<List<CaseExplorerModel>> getFilteredCases(String title, int type,
      int stage, int court, int state, int manager) async* {
    List<CaseExplorerModel> res = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      log(manager.toString());
      log(stage.toString());
      log(state.toString());
      log(type.toString());
      log(court.toString());
      var requestBody = {
        if (manager != MAXINT) "case_manager": manager,
        if (stage != MAXINT) "case_status": [stage],
        if (state != MAXINT) "state": [state],
        if (type != MAXINT) "types": [type],
        if (court != MAXINT) "court": [court],
        "title": title,
      };
      if (state != MAXINT) {}
      log(requestBody.toString());
      Dio dio = new Dio();
      dio.options.headers['content-type'] = 'application/json';
      dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response = await dio.post(
          'https://corporate.legistify.com/api/case-filter/',
          data: requestBody);

      var resData = response.data;

      print('Loaded Filtered Results');

      if (response.statusCode == 200) {
        _prefs.setInt('numberOfCases', resData["count"]);
        List cases = resData["cases"].toList();
        cases.forEach((element) {
          res.add(CaseExplorerModel.fromJson(element));
        });
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }

    yield res;
  }
}
