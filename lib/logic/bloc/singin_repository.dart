import 'dart:convert';

import 'package:tip100/model/app_user_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninRepository {
  Future<String> login(String email, String password) async {
    String res = "";
    try {
      Map requestBody = {"username": email, "password": password};
      Dio dio = new Dio();
      dio.options.headers['authority'] = 'corporate.legistify.com';
      Response response = await dio.post(
          'https://corporate.legistify.com/api-token-auth',
          data: requestBody);

      if (response.statusCode == 200) {
        Map resData = response.data;

        res = "success";
        var appuser = AppUserModel(
            email: email,
            user: resData['token']['user'],
            token: resData['token']['token']);
        print(appuser.token);
        final SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString("token", appuser.token ?? "");
        _prefs.setString("user_obj", jsonEncode(appuser.toJson()));
      } else {
        res = "Something went wrong 1";
      }
    } catch (e) {
      res = "Something went wrong 2";
      print(e);
    }
    print(res);

    return res;
  }

  Future<dynamic> createUser(String email, String password) async {
    // try {
    //   UserCredential res = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    //   final user = EventUser(email: email);

    //   print(res);

    //   await res.user!.sendEmailVerification();

    //   return res;
    // } catch (e) {
    //   return e;
    // }

    String res = "";
    try {
      var formData = FormData.fromMap(
          {'email': email, 'password': password, 'rpass': password});
      Response response = await Dio()
          .post('https://nextopay.com/uploop/register', data: formData);

      // if (jsonDecode(response.data)["status"] == "1") {
      var resData = jsonDecode(response.data);
      print('response');
      print(resData);
      print(formData.fields);

      if (resData["status"] == "1") {
        res = "success";
        var appuser = AppUserModel.fromJson(resData["data"].toList()[0]);
        final SharedPreferences _prefs = await SharedPreferences.getInstance();
        _prefs.setString("user_id", appuser.token ?? "");
        _prefs.setString("user_obj", jsonEncode(appuser.toJson()));
      } else {
        res = resData["message"];
      }
      // } else {
      //   res = "some thing is wrong from us, please try again";
      //   print(res);
      // }
    } catch (e) {
      res = "User Created Successfully";
      print('Error');
      print(e);
    }

    return res;
  }
}
