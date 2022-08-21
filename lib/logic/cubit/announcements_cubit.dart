import 'dart:convert';

import 'package:tip100/model/announcements_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'announcements_state.dart';

class AnnouncementsCubit extends Cubit<AnnouncementState> {
  List<AnnouncementsModel> listofdata;
  AnnouncementsCubit(
    this.listofdata,
  ) : super(AnnouncementInitial()) {
    loadAnnouncements();
  }

  Future loadAnnouncements() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(
        'https://nextopay.com/uploop/announcement.php?userid=${_prefs.getString("user_id")}&token=1234'));

    if (json.decode(response.body)['status'] == '1') {
      var jsonlist = json.decode(response.body)['data'] as List;
      listofdata.clear();
      for (var i = 0; i < jsonlist.length; i++) {
        listofdata.add(AnnouncementsModel.fromJson(jsonlist[i]));
      }
      emitLoadedData();
    }
  }

  void emitLoading() => emit(AnnouncementInitial());
  void emitLoadedData() => emit(AnnouncementLoaded());
  void emitError() => emit(AnnouncementError());
}
