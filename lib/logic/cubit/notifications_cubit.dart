import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/notifications_model.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  List<NotificationsModel> listofdata;
  NotificationsCubit(
    this.listofdata,
  ) : super(NotificationsInitial()) {
    loadNotifications();
  }

  Future loadNotifications() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(
        'https://nextopay.com/uploop/notification.php?userid=${_prefs.get('user_id')}&token=1234'));
    if (json.decode(response.body)['status'] == '1') {
      var jsonlist = json.decode(response.body)['data'] as List;
      listofdata.clear();
      for (var i = 0; i < jsonlist.length; i++) {
        listofdata.add(NotificationsModel.fromJson(jsonlist[i]));
      }
      emitLoadedData();
    }
  }

  void emitLoading() => emit(NotificationsInitial());
  void emitLoadedData() => emit(NotificationsLoaded());
  void emitError() => emit(NotificationsError());
}
