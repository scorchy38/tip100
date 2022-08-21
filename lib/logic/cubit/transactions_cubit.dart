import 'dart:convert';

import 'package:tip100/model/transaction_model.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/notifications_model.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  List<TransactionModel> listofdata;
  TransactionsCubit(
    this.listofdata,
  ) : super(TransactionsInitial()) {
    loadNotifications();
  }

  Future loadNotifications() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(
        'https://nextopay.com/uploop/thistory?userid=${_prefs.get('user_id')}'));
    if (json.decode(response.body)['status'] == '1') {
      var jsonlist = json.decode(response.body)['data'] as List;
      listofdata.clear();
      for (var i = 0; i < jsonlist.length; i++) {
        listofdata.add(TransactionModel.fromJson(jsonlist[i]));
      }
      emitLoadedData();
    }
  }

  void emitLoading() => emit(TransactionsInitial());
  void emitLoadedData() => emit(TransactionsLoaded());
  void emitError() => emit(TransactionsError());
}
