import 'dart:convert';
import 'dart:developer';

import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_bloc.dart';
import 'package:tip100/logic/bloc/add_case_bloc/add_case_bloc.dart';
import 'package:tip100/model/activity_log_item_model.dart';
import 'package:tip100/model/all_cases_model.dart';
import 'package:tip100/model/case_explorer_details_model.dart';
import 'package:tip100/model/case_explorer_model.dart';
import 'package:tip100/model/doc_storage_item.dart';
import 'package:tip100/model/hearing_models.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../model/all_cases_details_model.dart';
import '../../../model/task_model.dart';

class AllCasesDetailsRepository {
  Stream<AllCasesDetails> getCaseDetails(int id) async* {
    AllCasesDetails result = AllCasesDetails();
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'Accept': 'application/json, text/plain, */*',
        'Authorization': 'JWT ${_prefs.getString('token')}',
        'Content-Type': 'application/json',
      };
//TODO: Removing static case id 2601879
      var url = Uri.parse('https://corporate.legistify.com/api/case/2601879/');
      var res = await http.get(url, headers: headers);
      if (res.statusCode != 200)
        throw Exception('http.get error: statusCode= ${res.statusCode}');
      log(res.body);
      log(AllCasesDetails.fromJson(json.decode(res.body)).toString());
      log(res.statusCode.toString());
      log(id.toString());
      // print(resData);

      if (res.statusCode.toString() == '200') {
        result = AllCasesDetails.fromJson(json.decode(res.body));
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

  Stream<List<ActivityLogItem>> getActivityLog(int id) async* {
    List<ActivityLogItem> result = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'Accept': 'application/json, text/plain, */*',
        'Authorization': 'JWT ${_prefs.getString('token')}',
        'Content-Type': 'application/json',
      };

      var url = Uri.parse(
          'https://corporate.legistify.com/api/get-activity-log/2601879');
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
          result.add(ActivityLogItem.fromJson(e));
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

  Stream<List<DocStorageItem>> getDocStorageItems(int id) async* {
    List<DocStorageItem> result = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'Accept': 'application/json, text/plain, */*',
        'Authorization': 'JWT ${_prefs.getString('token')}',
        'Content-Type': 'application/json',
      };

      var url = Uri.parse(
          'https://corporate.legistify.com/api/case/2601879/documents/');
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
          result.add(DocStorageItem.fromJson(e));
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

  Stream<List<ManualHearing>> getManualHearings(int id) async* {
    List<ManualHearing> result = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'Accept': 'application/json, text/plain, */*',
        'Authorization': 'JWT ${_prefs.getString('token')}',
        'Content-Type': 'application/json',
      };

      var url = Uri.parse(
          'https://corporate.legistify.com/api/case/2601879/hearings/');
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
          result.add(ManualHearing.fromJson(e));
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

  Stream<List<AutomaticHearing>> getAutomaticHearings(int id) async* {
    List<AutomaticHearing> result = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'Accept': 'application/json, text/plain, */*',
        'Authorization': 'JWT ${_prefs.getString('token')}',
        'Content-Type': 'application/json',
      };

      var url = Uri.parse(
          'https://corporate.legistify.com/api/case/2601879/explorer_hearings/');
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
          result.add(AutomaticHearing.fromJson(e));
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

  Stream<List<Task>> getTasks(int id) async* {
    List<Task> result = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      var headers = {
        'Accept': 'application/json, text/plain, */*',
        'Authorization': 'JWT ${_prefs.getString('token')}',
        'Content-Type': 'application/json',
      };

      var url = Uri.parse(
          'https://corporate.legistify.com/api/case/2601879/activities/');
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
          result.add(Task.fromJson(e));
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
