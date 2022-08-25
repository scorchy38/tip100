import 'dart:convert';
import 'dart:developer';

import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/model/all_cases_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllCasesRepository {
  Stream<List<AllCasesModel>> getInitial50Cases() async* {
    List<AllCasesModel> res = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var requestBody = {"page": "1", "skip": "0", "limit": "50"};
      Dio dio = new Dio();
      // dio.options.headers['content-type'] = 'application/json';
      // dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      print(
          "https://tip100.herokuapp.com/getUserTips?uid=${_prefs.getString('token')}");
      Response response = await dio.get(
          'https://tip100.herokuapp.com/getUserTips?uid=${_prefs.getString('token')}');

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

  // Stream<int> getCasesCount() async* {
  //   int res = 0;
  //   try {
  //     final SharedPreferences _prefs = await SharedPreferences.getInstance();
  //     var requestBody = {"page": "1", "skip": "0", "limit": "50"};
  //     Dio dio = new Dio();
  //     dio.options.headers['content-type'] = 'application/json';
  //     dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
  //     Response response = await dio.post(
  //         'https://corporate.legistify.com/api/case-filter/',
  //         data: requestBody);
  //
  //     var resData = response.data;
  //     // print('response');
  //     // print(resData);
  //
  //     if (response.statusCode == 200) {
  //       res = resData["count"];
  //     } else {}
  //   } catch (e) {
  //     print('Error');
  //     print(e);
  //   }
  //
  //   yield res;
  // }

  Stream<List<AllCasesModel>> getPaginatedCases(String skip, String page,
      String limit, List<AllCasesModel> loadedCases) async* {
    List<AllCasesModel> res = loadedCases;
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
          res.add(AllCasesModel.fromJson(element));
        });
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }

    yield res;
  }

  Stream<List<AllCasesModel>> getFilteredCases(
      String title,
      int type,
      int stage,
      int court,
      int state,
      int manager,
      String region,
      String status,
      String orderType,
      String location,
      String amount,
      String winEstimate,
      String counsel,
      String brand,
      String product,
      String allFilter,
      String tracking) async* {
    List<AllCasesModel> res = [];
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
        if (region != '') "region": [region],
        if (status != '') "case_status": [status],
        if (orderType != '') "order_type": orderType,
        if (location != '') "city": [location],
        if (amount != '') "amount_claimed": amount,
        if (winEstimate != '') "win": winEstimate,
        if (counsel != '') "lawyer_name": counsel,
        if (brand != '') "brands": [brand],
        if (product != '') "product": [product],
        if (allFilter != '') "activity": [allFilter],
        // if (tracking != '') "tracking": [tracking],
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
          res.add(AllCasesModel.fromJson(element));
        });
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }

    yield res;
  }
}
