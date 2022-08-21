import 'dart:convert';
import 'dart:developer';

import 'package:tip100/model/judgements_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'judgements_repository.dart';

part 'judgements_state.dart';
part 'judgements_event.dart';

class JudgementsBloc extends Bloc<JudgementsEvent, JudgementsState> {
  JudgementsBloc({required this.judgementsRepository})
      : super(JudgementsState(
            currLimit: 50,
            currPage: 1,
            currSkip: 0,
            judgements: [],
            noJudgementsFound: false));
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final JudgementsRepository judgementsRepository;

  @override
  Stream<JudgementsState> mapEventToState(
    JudgementsEvent event,
  ) async* {
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();
    // print(_prefs.getString("user_id"));
    // print(_prefs.getString("user_obj"));
    List<Judgements> allCauses = [];
    int casesCount = 0;
    if (event is JudgementsRefreshing) {
      print('Hitting refresh with false');
      emit(JudgementsState(
          judgements: [],
          currLimit: 50,
          currPage: 1,
          currSkip: 0,
          totalJudgements: 0,
          noJudgementsFound: false));
    }
    if (event is JudgementsGetInitialList) {
      await judgementsRepository.getInitial20Judgements().listen((events) {
        allCauses = events;
        judgementsRepository.getJudgementsCount().listen((count) async {
          casesCount = await count;
          if (casesCount == 0) {
            print('Hitting init with true and 0');
            emit(JudgementsState(
                judgements: allCauses,
                currLimit: 50,
                currPage: 1,
                currSkip: 0,
                totalJudgements: casesCount,
                noJudgementsFound: true));
          } else {
            print('Hitting init with false and 20');
            emit(JudgementsState(
                judgements: allCauses,
                currLimit: 50,
                currPage: 1,
                currSkip: 0,
                totalJudgements: casesCount,
                noJudgementsFound: false));
          }
        });
      });
      log(allCauses.toString());
    }
    if (event is JudgementsGetFilteredResults) {
      await judgementsRepository
          .getFilteredJudgements(event.cnr, event.title, event.court,
              event.startDate, event.endDate)
          .listen((filteredJudgements) {
        if (filteredJudgements.length == 0)
          emit(JudgementsState(
              currLimit: 50,
              currPage: 1,
              currSkip: 0,
              judgements: filteredJudgements,
              totalJudgements: filteredJudgements.length,
              noJudgementsFound: true));
        else
          emit(JudgementsState(
              currLimit: 50,
              currPage: 1,
              currSkip: 0,
              judgements: filteredJudgements,
              totalJudgements: filteredJudgements.length,
              noJudgementsFound: false));
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
