import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/notifications_model.dart';

part 'event_requests_state.dart';

class EventRequestsCubit extends Cubit<EventRequestsState> {
  List<Map> listofdata;
  EventRequestsCubit(
    this.listofdata,
  ) : super(EventRequestsInitial()) {
    loadFriends();
  }

  Future loadFriends() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(
        'https://nextopay.com/uploop/all_request.php?userid=${_prefs.get('user_id')}'));
    if (json.decode(response.body)['status'] == '1') {
      var jsonlist = json.decode(response.body)['data'] as List;
      listofdata.clear();
      for (var i = 0; i < jsonlist.length; i++) {
        listofdata.add(jsonlist[i]);
      }
      emitLoadedData();
    }
  }

  void emitLoading() => emit(EventRequestsInitial());
  void emitLoadedData() => emit(EventRequestsLoaded());
  void emitError() => emit(EventRequestsError());
}
