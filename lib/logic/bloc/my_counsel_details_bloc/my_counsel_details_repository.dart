import 'dart:convert';
import 'dart:developer';

import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/model/activity_log_item_model.dart';
import 'package:tip100/model/all_cases_model.dart';
import 'package:tip100/model/case_explorer_details_model.dart';
import 'package:tip100/model/case_explorer_model.dart';
import 'package:tip100/model/counsel_case_item.dart';
import 'package:tip100/model/counsel_details_model.dart';
import 'package:tip100/model/counsel_doc_storage_item.dart';
import 'package:tip100/model/counsel_notice_item.dart';
import 'package:tip100/model/doc_storage_item.dart';
import 'package:tip100/model/hearing_models.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../model/all_cases_details_model.dart';
import '../../../model/task_model.dart';

class MyCounselDetailsRepository {
  Stream<CounselDetail> getCounselDetails(int id) async* {
    CounselDetail result = CounselDetail();
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'authority': 'corporate.legistify.com',
        'accept-language': 'en-US,en;q=0.9',
        'Authorization': 'JWT ${_prefs.getString('token')}',
        'Accept-Encoding': 'gzip',
      };

      var url = Uri.parse('https://corporate.legistify.com/api/lawyer/$id/');
      var res = await http.get(url, headers: headers);
      if (res.statusCode != 200)
        throw Exception('http.get error: statusCode= ${res.statusCode}');
      print(res.body);

      log(res.body);
      log(CounselDetail.fromJson(json.decode(res.body)).toString());
      log(res.statusCode.toString());
      log(id.toString());
      // print(resData);

      if (res.statusCode.toString() == '200') {
        result = CounselDetail.fromJson(json.decode(res.body));
        print('Accepted');
      } else {
        print('Denied');
      }
    } catch (e) {
      print('Error');
      print(e);
    }

    yield result;
  }

  Stream<List<CounselCaseItem>> getCaseItems(int id) async* {
    List<CounselCaseItem> result = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'authority': 'corporate.legistify.com',
        'accept-language': 'en-US,en;q=0.9',
        'authorization': 'JWT ${_prefs.getString('token')}',
        'content-type': 'application/json',
        'Accept-Encoding': 'gzip',
      };

      var data = '{"page":1,"lawyer":"$id"}';

      var url = Uri.parse('https://corporate.legistify.com/api/case-filter/');
      var res = await http.post(url, headers: headers, body: data);
      if (res.statusCode != 200)
        throw Exception('http.post error: statusCode= ${res.statusCode}');
      print(res.body);
      List response = json.decode(res.body)['cases'];
      log(res.statusCode.toString());
      log(id.toString());

      if (res.statusCode.toString() == '200') {
        response.forEach((e) {
          result.add(CounselCaseItem.fromJson(e));
        });
        print('Accepted');
      } else {
        print('Denied');
      }
    } catch (e) {
      print('Error');
      print(e);
    }

    yield result;
  }

  Stream<List<CounselDocStorageItem>> getDocStorageItems(int id) async* {
    List<CounselDocStorageItem> result = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'authority': 'corporate.legistify.com',
        'accept-language': 'en-US,en;q=0.9',
        'authorization': 'JWT ${_prefs.getString('token')}',
        'Accept-Encoding': 'gzip',
      };

      var url =
          Uri.parse('https://corporate.legistify.com/api/lawyer/$id/kyc/');
      var res = await http.get(url, headers: headers);
      if (res.statusCode != 200)
        throw Exception('http.get error: statusCode= ${res.statusCode}');

      log(res.body);
      List response = json.decode(res.body);

      log(res.statusCode.toString());
      log(id.toString());
      // print(resData);

      if (res.statusCode.toString() == '200') {
        response.forEach((e) {
          result.add(CounselDocStorageItem.fromJson(e));
        });
        print('Accepted');
      } else {
        print('Denied');
      }
    } catch (e) {
      print('Error');
      print(e);
    }
    log(result.toString());
    yield result;
  }

  Stream<List<CounselNoticeItem>> getNoticeItems(int id) async* {
    List<CounselNoticeItem> result = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'authority': 'corporate.legistify.com',
        'accept': 'application/json, text/plain, */*',
        'accept-language': 'en-US,en;q=0.9',
        'authorization': 'JWT ${_prefs.getString('token')}',
        'content-type': 'application/json',
        'Accept-Encoding': 'gzip',
      };

      var data = '{"page":1,"lawyer":"$id"}';

      var url = Uri.parse('https://corporate.legistify.com/api/notice/filter/');
      var res = await http.post(url, headers: headers, body: data);
      if (res.statusCode != 200)
        throw Exception('http.post error: statusCode= ${res.statusCode}');
      print(res.body);

      log(res.body);
      List response = json.decode(res.body)['notices'];

      log(res.statusCode.toString());
      log(id.toString());
      // print(resData);

      if (res.statusCode.toString() == '200') {
        response.forEach((e) {
          result.add(CounselNoticeItem.fromJson(e));
        });
        print('Accepted');
      } else {
        print('Denied');
      }
    } catch (e) {
      print('Error');
      print(e);
    }
    log(result.toString());
    yield result;
  }
}
