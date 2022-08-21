import 'dart:convert';
import 'dart:developer';

import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/logic/bloc/my_counsel_bloc/my_counsel_bloc.dart';
import 'package:tip100/model/all_cases_model.dart';
import 'package:tip100/model/my_counsel_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyCounselRepository {
  Stream<MyCounselState> getAllCounsels() async* {
    List<MyCounselModel> res = [];
    MyCounselState counselState = MyCounselState();
    int count = 0;
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var requestBody = {
        "token": _prefs.getString('token'),
        "user": "Tarun@legistify.com"
      };
      Dio dio = new Dio();
      dio.options.headers['content-type'] = 'application/json';
      dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response = await dio.post(
          'https://corporate.legistify.com/api/lawyer/filter/',
          data: requestBody);

      var resData = response.data;

      print(resData["data"].toList().length);
      // print(resData);

      if (response.statusCode == 200) {
        List counsels = resData["data"].toList();
        counsels.forEach((element) {
          res.add(MyCounselModel.fromJson(element));
        });
        count = resData['count'];
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }
    counselState.totalCounsels = await count;
    counselState.all_counsels = await res;
    counselState.noCounselsFound = await res.isEmpty;

    yield counselState;
  }

  Stream<MyCounselState> getFilteredCounsels(
      String name, int city, int court, String sort) async* {
    List<MyCounselModel> res = [];
    MyCounselState counselState = MyCounselState();
    log(name);
    log(city.toString());
    log(court.toString());
    log(sort);
    log('My Counsel Listing');
    int count = 0;
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var requestBody = {
        if (name != '') "name": name,
        // "page": 1,
        if (city != MAXINT) "city": city,
        if (court != MAXINT) "courts": court,
        if (sort != '') "sort_data": sort
      };
      Dio dio = new Dio();
      dio.options.headers['content-type'] = 'application/json';
      dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response = await dio.post(
          'https://corporate.legistify.com/api/lawyer/filter/',
          data: requestBody);

      var resData = response.data;

      print(resData["data"].toList().length);
      // print(resData);

      if (response.statusCode == 200) {
        List counsels = resData["data"].toList();
        counsels.forEach((element) {
          res.add(MyCounselModel.fromJson(element));
        });
        count = resData['count'];
      } else {}
    } catch (e) {
      print('Error');
      print(e);
    }
    counselState.totalCounsels = await count;
    counselState.all_counsels = await res;
    counselState.noCounselsFound = await res.isEmpty;
    yield counselState;
  }
}
