import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllCasesFiltersRepository {
  Stream<List> getCaseTypeFilters() async* {
    List res = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      Dio dio = new Dio();

      dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response = await dio.get(
          'https://corporate.legistify.com/api/type/list_type_all/?q=&u_id=');

      var resData = response.data.toList();
      print('Number Of Filters Type ${resData.length}');

      res = resData;
    } catch (e) {
      print('Error Type');
      print(e);
    }

    yield res;
  }

  Stream<List> getCityFilters() async* {
    List res = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      Dio dio = new Dio();

      dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response = await dio.get(
          'https://corporate.legistify.com/api/cities/list_cities/?q=&u_id=');

      var resData = response.data.toList();
      print('Number Of Filters Type ${resData.length}');

      res = resData;
    } catch (e) {
      print('Error Type');
      print(e);
    }

    yield res;
  }

  Stream<List> getCaseStageFilters() async* {
    List res = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      Dio dio = new Dio();

      dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response = await dio.get(
          'https://corporate.legistify.com/api/stage/list_stage_all/?q=&u_id=');

      var resData = response.data.toList();

      res = resData;
    } catch (e) {
      print('Error Stage');
      print(e);
    }
    print('Number Of Filters Stage ${res.length}');

    yield res;
  }

  Stream<List> getCourtFilters() async* {
    List res = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      Dio dio = new Dio();

      dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response = await dio.get(
          'https://corporate.legistify.com/api/courts/list_courts/?q=&u_id=&type_c=0');

      var resData = response.data.toList();

      res = resData;
    } catch (e) {
      print('Error Courts');
      print(e);
    }

    print('Number Of Filters Courts ${res.length}');

    yield res;
  }

  Stream<List> getCaseManagerFilters() async* {
    List res = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      Dio dio = new Dio();

      dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response = await dio.get(
          'https://corporate.legistify.com/api/case/all_case_manager/?q=&u_id=');

      var resData = response.data.toList();
      print('Number Of Filters Managers ${resData.length}');

      if (response.statusCode == 200) {
        res = resData;
      } else {}
    } catch (e) {
      print('Error Managers');
      print(e);
    }

    yield res;
  }

  Stream<List> getStateFilters() async* {
    List res = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      Dio dio = new Dio();

      dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response =
          await dio.get('https://corporate.legistify.com/api/states/retrive/');

      var resData = response.data.toList();
      print('Number Of Filters State ${resData.length}');
      // print(response.data.toString());

      if (response.statusCode == 200) {
        res = resData;
      } else {}
    } catch (e) {
      print('Error State');
      print(e);
    }

    yield res;
  }
}
