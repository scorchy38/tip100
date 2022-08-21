import 'dart:convert';
import 'dart:developer';

import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/model/all_cases_model.dart';
import 'package:tip100/model/case_explorer_details_model.dart';
import 'package:tip100/model/case_explorer_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CaseExplorerDetailsRepository {
  Stream<CaseExplorerDetails> getCaseDetails(int id) async* {
    CaseExplorerDetails res = CaseExplorerDetails();
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      Dio dio = new Dio();
      dio.options.headers['content-type'] = 'application/json';
      dio.options.headers['Authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response = await dio
          .get('https://corporate.legistify.com/api/case-explorer/$id');

      var resData = response.data;
      log('Case Details ${response.data}');
      log(CaseExplorerDetails.fromJson(response.data).toString());
      log(response.statusCode.toString());
      log(id.toString());
      // print(resData);

      if (response.statusCode.toString() == '200') {
        res = CaseExplorerDetails.fromJson(resData);
        print('Accepted');
      } else {
        print('Denied');
      }
    } catch (e) {
      print('Error');
      print(e);
    }

    yield res;
  }
}
