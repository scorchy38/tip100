import 'dart:convert';
import 'dart:developer';

import 'package:tip100/model/cause_list_free_text_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cause_list_free_text_repository.dart';

part 'cause_list_free_text_event.dart';
part 'cause_list_free_text_state.dart';

class CauseListFreeTextBloc
    extends Bloc<CauseListFreeTextEvent, CauseListFreeTextState> {
  CauseListFreeTextBloc({required this.causeListFreeTextRepository})
      : super(CauseListFreeTextState(
            currLimit: 50,
            currPage: 1,
            currSkip: 0,
            causeList: [],
            noCausesFound: false));
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CauseListFreeTextRepository causeListFreeTextRepository;

  @override
  Stream<CauseListFreeTextState> mapEventToState(
    CauseListFreeTextEvent event,
  ) async* {
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();
    // print(_prefs.getString("user_id"));
    // print(_prefs.getString("user_obj"));
    List<CauseListFreeText> allCauses = [];
    int casesCount = 0;
    if (event is CauseListFreeTextRefreshing) {
      print('Hitting refresh with false');
      emit(CauseListFreeTextState(
          causeList: [],
          currLimit: 50,
          currPage: 1,
          currSkip: 0,
          totalCauses: 0,
          noCausesFound: false));
    }
    if (event is CauseListFreeTextGetInitialCauses) {
      await causeListFreeTextRepository.getInitial20Causes().listen((events) {
        allCauses = events;
        causeListFreeTextRepository.getCausesCount().listen((count) async {
          casesCount = await count;
          if (casesCount == 0) {
            print('Hitting init with true and 0');
            emit(CauseListFreeTextState(
                causeList: allCauses,
                currLimit: 50,
                currPage: 1,
                currSkip: 0,
                totalCauses: casesCount,
                noCausesFound: true));
          } else {
            print('Cause List Free text');
            log(allCauses.toString());
            print('Hitting init with false and 20');
            emit(CauseListFreeTextState(
                causeList: allCauses,
                currLimit: 50,
                currPage: 1,
                currSkip: 0,
                totalCauses: casesCount,
                noCausesFound: false));
          }
        });
      });
    }
    if (event is CauseListFreeTextGetFilteredResults) {
      await causeListFreeTextRepository
          .getFilteredCases(event.startDate, event.endDate)
          .listen((filteredCauses) {
        if (filteredCauses.length == 0)
          emit(CauseListFreeTextState(
              causeList: [],
              currLimit: 50,
              currPage: 1,
              currSkip: 0,
              totalCauses: 0,
              noCausesFound: true));
        else
          emit(CauseListFreeTextState(
              causeList: filteredCauses,
              currLimit: 50,
              currPage: 1,
              currSkip: 0,
              totalCauses: filteredCauses.length,
              noCausesFound: false));
      });
      // yield EventDisplayState(
      //     pending: ,
      //     virtual_events: event.newEvents
      //         .where((element) => element.virtual_event)
      //         .toList(),
      //     recommended_events: recommended,
      //     eventDisplayType: EventDisplayTypeAll());
    }
    // if (event is AllCasesGetNextPageCases) {
    //   await allCasesRepository
    //       .getPaginatedCases(
    //       state.currSkip.toString(),
    //       (state.currPage! + 1).toString(),
    //       event.limit.toString(),
    //       state.all_cases!)
    //       .listen((nextCases) {
    //     emit(AllCasesState(
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
    //   await allCasesRepository
    //       .getFilteredCases(event.title, event.type, event.stage, event.court,
    //       event.state, event.manager)
    //       .listen((nextCases) {
    //     if (nextCases.length == 0)
    //       emit(AllCasesState(
    //           all_cases: nextCases,
    //           currLimit: state.currLimit,
    //           currPage: state.currPage,
    //           totalCases: _prefs.getInt('numberOfCases'),
    //           currSkip: state.currSkip,
    //           noCasesFound: true));
    //     else
    //       emit(AllCasesState(
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
