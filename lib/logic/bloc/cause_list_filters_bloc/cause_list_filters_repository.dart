import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CauseListFiltersRepository {
  Stream<List> getBenchTypeFilters() async* {
    List res = [];
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      Dio dio = new Dio();

      dio.options.headers['authorization'] = 'JWT ${_prefs.getString('token')}';
      Response response = await dio.post(
          'https://corporate.legistify.com/api/causelist/get-bench/',
          data: {});

      var resData = response.data.toList();
      print('Number Of Filters Bench ${resData.length}');

      res = resData;
    } catch (e) {
      print('Error Type');
      print(e);
    }

    yield res;
  }
}
