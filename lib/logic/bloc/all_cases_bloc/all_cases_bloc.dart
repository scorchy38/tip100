import 'dart:convert';
import 'dart:developer';

import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_repository.dart';
import 'package:tip100/model/all_cases_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'all_cases_state.dart';
part 'all_cases_event.dart';

class AllCasesBloc extends Bloc<AllCasesEvent, AllCasesState> {
  AllCasesBloc({required this.allCasesRepository})
      : super(AllCasesState(
            currLimit: 50,
            currPage: 1,
            currSkip: 0,
            all_cases: [],
            noCasesFound: false));
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AllCasesRepository allCasesRepository;

  @override
  Stream<AllCasesState> mapEventToState(
    AllCasesEvent event,
  ) async* {
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();
    // print(_prefs.getString("user_id"));
    // print(_prefs.getString("user_obj"));
    List<AllCasesModel> allCases = [];
    int casesCount = 0;
    if (event is AllCasesRefreshing) {
      print('Hitting refresh with false');
      emit(AllCasesState(
          all_cases: [],
          currLimit: 50,
          currPage: 1,
          currSkip: 0,
          totalCases: 0,
          noCasesFound: false));
    }
    if (event is AllCasesGetInitialCases) {
      await allCasesRepository.getInitial50Cases().listen((events) {
        allCases = events;
        casesCount = allCases.length;
        if (casesCount == 0) {
          print('Hitting init with true and 0');
          emit(AllCasesState(
              all_cases: allCases,
              currLimit: 50,
              currPage: 1,
              currSkip: 0,
              totalCases: casesCount,
              noCasesFound: true));
        } else {
          print('Hitting init with false and 50');
          emit(AllCasesState(
              all_cases: allCases,
              currLimit: 50,
              currPage: 1,
              currSkip: 0,
              totalCases: casesCount,
              noCasesFound: false));
        }
      });
      log(allCases.toString());
    }
    if (event is AllCasesGetNextPageCases) {
      await allCasesRepository
          .getPaginatedCases(
              state.currSkip.toString(),
              (state.currPage! + 1).toString(),
              event.limit.toString(),
              state.all_cases!)
          .listen((nextCases) {
        emit(AllCasesState(
          all_cases: nextCases,
          currLimit: event.limit,
          currPage: state.currPage! + 1,
          currSkip: 0 + event.limit,
        ));
      });
      // yield EventDisplayState(
      //     pending: ,
      //     virtual_events: event.newEvents
      //         .where((element) => element.virtual_event)
      //         .toList(),
      //     recommended_events: recommended,
      //     eventDisplayType: EventDisplayTypeAll());
    }
    if (event is AllCasesGetFilteredResults) {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      await allCasesRepository
          .getFilteredCases(
              event.title,
              event.type,
              event.stage,
              event.court,
              event.state,
              event.manager,
              event.region,
              event.status,
              event.orderType,
              event.location,
              event.amount,
              event.winEstimate,
              event.counsel,
              event.brand,
              event.product,
              event.allFilter,
              event.tracking)
          .listen((nextCases) {
        if (nextCases.length == 0)
          emit(AllCasesState(
              all_cases: nextCases,
              currLimit: state.currLimit,
              currPage: state.currPage,
              totalCases: _prefs.getInt('numberOfCases'),
              currSkip: state.currSkip,
              noCasesFound: true));
        else
          emit(AllCasesState(
              all_cases: nextCases,
              currLimit: state.currLimit,
              currPage: state.currPage,
              totalCases: _prefs.getInt('numberOfCases'),
              currSkip: state.currSkip,
              noCasesFound: false));
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
