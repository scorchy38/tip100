import 'dart:convert';

import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:tip100/model/app_user_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninRepository {
  Future<String> login(String phrase) async {
    final preferences = await StreamingSharedPreferences.instance;

    String res = "";
    try {
      Map requestBody = {"phrase": phrase};
      Dio dio = new Dio();
      Response response = await dio
          .post('https://tip100.herokuapp.com/getUserID', data: requestBody);

      if (response.statusCode == 200) {
        var resData = response.data;

        res = "success";

        final SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString("token", resData.toString());
        preferences.setString('token', resData.toString());

        Response response2 =
            await dio.get('https://tip100.herokuapp.com/getAllTippers');

        if (response2.statusCode == 200) {
          List resData2 = response2.data;

          res = "success";
          resData2.forEach((element) {
            if (element['uid'] == resData.toString()) {
              _prefs.setString("score", element['score']);
              preferences.setString('score', element['score']);
            }
          });

          // _prefs.setString("user_obj", jsonEncode(appuser.toJson()));
        } else {
          res = "Something went wrong 1";
        }
      }
    } catch (e) {
      res = "Something went wrong 2";
      print(e);
    }
    print(res);

    return res;
  }

  Future<dynamic> createUser(String phrase) async {
    final preferences = await StreamingSharedPreferences.instance;

    String res = "";
    try {
      Map requestBody = {"phrase": phrase};
      Dio dio = new Dio();
      Response registerResponse = await dio
          .post('https://tip100.herokuapp.com/register', data: requestBody);
      print(registerResponse.data);
      Response response = await dio
          .post('https://tip100.herokuapp.com/getUserID', data: requestBody);

      if (response.statusCode == 200) {
        var resData = response.data;

        res = "success";

        final SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString("token", resData.toString());
        preferences.setString('token', resData.toString());

        Response response2 =
            await dio.get('https://tip100.herokuapp.com/getAllTippers');

        if (response2.statusCode == 200) {
          List resData2 = response2.data;

          res = "success";
          resData2.forEach((element) {
            if (element['uid'] == resData.toString()) {
              _prefs.setString("score", element['score']);
              preferences.setString('score', element['score']);
            }
          });

          // _prefs.setString("user_obj", jsonEncode(appuser.toJson()));
        } else {
          res = "Something went wrong 1";
        }
      }
    } catch (e) {
      res = "Something went wrong 2";
      print(e);
    }
    print(res);

    return res;
  }
}
