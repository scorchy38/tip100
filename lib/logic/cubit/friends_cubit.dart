import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/notifications_model.dart';

part 'friends_state.dart';

class FriendsCubit extends Cubit<FriendsState> {
  List<Map> listofdata;
  FriendsCubit(
    this.listofdata,
  ) : super(FriendsInitial()) {
    loadFriends();
  }

  Future loadFriends() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(
        'https://nextopay.com/uploop/friends?userid=${_prefs.get('user_id')}'));
    if (json.decode(response.body)['status'] == '1') {
      var jsonlist = json.decode(response.body)['data'] as List;
      listofdata.clear();
      for (var i = 0; i < jsonlist.length; i++) {
        listofdata.add(jsonlist[i]);
      }
      emitLoadedData();
    }
  }

  void emitLoading() => emit(FriendsInitial());
  void emitLoadedData() => emit(FriendsLoaded());
  void emitError() => emit(FriendsError());
}
