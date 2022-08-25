import 'dart:convert';
import 'dart:developer';

import 'package:tip100/logic/bloc/all_cases_bloc/all_cases_repository.dart';
import 'package:tip100/logic/bloc/case_explorer_bloc/case_explorer_repository.dart';
import 'package:tip100/model/all_cases_model.dart';
import 'package:tip100/model/case_explorer_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'case_explorer_state.dart';
part 'case_explorer_event.dart';

class CaseExplorerBloc extends Bloc<CaseExplorerEvent, CaseExplorerState> {
  CaseExplorerBloc({required this.caseExplorerRepository})
      : super(CaseExplorerState(
            currLimit: 50,
            currPage: 1,
            currSkip: 0,
            all_cases: [],
            noCasesFound: false,
            keyword_search_for: 'C',
            keyword_type: 0,
            scrape_type: 1));
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CaseExplorerRepository caseExplorerRepository;

  @override
  Stream<CaseExplorerState> mapEventToState(
    CaseExplorerEvent event,
  ) async* {
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();
    // print(_prefs.getString("user_id"));
    // print(_prefs.getString("user_obj"));
    List<AllCasesModel> allCases = [];
    int casesCount = 0;
    if (event is CaseExplorerRefreshing) {
      print('Hitting refresh with false');
      emit(CaseExplorerState(
          all_cases: [],
          currLimit: 50,
          currPage: 1,
          currSkip: 0,
          totalCases: 0,
          noCasesFound: false,
          keyword_search_for: 'C',
          keyword_type: 0,
          scrape_type: 1));
    }
    if (event is CaseExplorerGetInitialCases) {
      await caseExplorerRepository.getAlerts().listen((events) {
        allCases = events;
        casesCount = events.length;
        if (casesCount == 0) {
          print('Hitting init with true and 0');
          emit(CaseExplorerState(
              all_cases: allCases,
              currLimit: 50,
              currPage: 1,
              currSkip: 0,
              totalCases: casesCount,
              noCasesFound: true));
        } else {
          print('Hitting init with false and 50');
          emit(CaseExplorerState(
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
    // if (event is CaseExplorerGetNextPageCases) {
    //   await caseExplorerRepository
    //       .getPaginatedCases(
    //           state.currSkip.toString(),
    //           (state.currPage! + 1).toString(),
    //           event.limit.toString(),
    //           state.all_cases!)
    //       .listen((nextCases) {
    //     emit(CaseExplorerState(
    //       all_cases: nextCases,
    //       currLimit: event.limit,
    //       currPage: state.currPage! + 1,
    //       currSkip: 0 + event.limit,
    //     ));
    //   });
    //   // yield EventDisplayState(
    //   //     pending: ,
    //   //     virtual_events: event.newEvents
    //   //         .where((element) => element.virtual_event)
    //   //         .toList(),
    //   //     recommended_events: recommended,
    //   //     eventDisplayType: EventDisplayTypeAll());
    // }
    // if (event is AllCasesGetFilteredResults) {
    //   final SharedPreferences _prefs = await SharedPreferences.getInstance();
    //
    //   await caseExplorerRepository
    //       .getFilteredCases(event.title, event.type, event.stage, event.court,
    //           event.state, event.manager)
    //       .listen((nextCases) {
    //     if (nextCases.length == 0)
    //       emit(CaseExplorerState(
    //           all_cases: nextCases,
    //           currLimit: state.currLimit,
    //           currPage: state.currPage,
    //           totalCases: _prefs.getInt('numberOfCases'),
    //           currSkip: state.currSkip,
    //           noCasesFound: true));
    //     else
    //       emit(CaseExplorerState(
    //           all_cases: nextCases,
    //           currLimit: state.currLimit,
    //           currPage: state.currPage,
    //           totalCases: _prefs.getInt('numberOfCases'),
    //           currSkip: state.currSkip,
    //           noCasesFound: false));
    //   });
    //   // yield EventDisplayState(
    //   //     pending: ,
    //   //     virtual_events: event.newEvents
    //   //         .where((element) => element.virtual_event)
    //   //         .toList(),
    //   //     recommended_events: recommended,
    //   //     eventDisplayType: EventDisplayTypeAll());
    // }
  }
}
