import 'dart:convert';
import 'dart:developer';

import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_repository.dart';
import 'package:tip100/logic/bloc/my_counsel_bloc/my_counsel_repository.dart';
import 'package:tip100/model/all_cases_model.dart';
import 'package:tip100/model/my_counsel_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'my_counsel_state.dart';
part 'my_counsel_event.dart';

class MyCounselBloc extends Bloc<MyCounselEvent, MyCounselState> {
  MyCounselBloc({required this.myCounselRepository})
      : super(MyCounselState(
            all_counsels: [], totalCounsels: 0, noCounselsFound: false));
  final MyCounselRepository myCounselRepository;

  @override
  Stream<MyCounselState> mapEventToState(
    MyCounselEvent event,
  ) async* {
    if (event is MyCounselRefreshing) {
      print('Hitting refresh with false');
      emit(MyCounselState(
          all_counsels: [], totalCounsels: 0, noCounselsFound: false));
    }
    if (event is MyCounselGetAllCounsels) {
      await myCounselRepository.getAllCounsels().listen((newMyCounselState) {
        emit(newMyCounselState);
      });
    }
    if (event is MyCounselGetFilteredResults) {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      await myCounselRepository
          .getFilteredCounsels(
        event.name,
        event.city,
        event.court,
        event.sort,
      )
          .listen((newCounselsState) {
        emit(newCounselsState);
      });
      // yield EventDisplayState(
      //     pending: ,
      //     virtual_events: event.newEvents
      //         .where((element) => element.virtual_event)
      //         .toList(),
      //     recommended_events: recommended,
      //     eventDisplayType: EventDisplayTypeAll());
    }
  }
}
