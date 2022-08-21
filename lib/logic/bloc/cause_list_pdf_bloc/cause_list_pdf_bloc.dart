import 'dart:convert';
import 'dart:developer';

import 'package:tip100/logic/bloc/cause_list_free_text_bloc/cause_list_free_text_bloc.dart';
import 'package:tip100/logic/bloc/cause_list_pdf_bloc/cause_list_pdf_repository.dart';
import 'package:tip100/model/cause_list_pdf_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'cause_list_pdf_state.dart';
part 'cause_list_pdf_event.dart';

class CauseListPDFBloc extends Bloc<CauseListPDFEvent, CauseListPDFState> {
  CauseListPDFBloc({required this.causeListPDFRepository})
      : super(CauseListPDFState(
            currLimit: 50,
            currPage: 1,
            currSkip: 0,
            causeList: [],
            noCausesFound: false));
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CauseListPDFRepository causeListPDFRepository;

  @override
  Stream<CauseListPDFState> mapEventToState(
    CauseListPDFEvent event,
  ) async* {
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();
    // print(_prefs.getString("user_id"));
    // print(_prefs.getString("user_obj"));
    List<CauseListPDF> allCauses = [];
    int casesCount = 0;
    if (event is CauseListPDFRefreshing) {
      print('Hitting refresh with false');
      emit(CauseListPDFState(
          causeList: [],
          currLimit: 50,
          currPage: 1,
          currSkip: 0,
          totalCauses: 0,
          noCausesFound: false));
    }
    if (event is CauseListPDFGetInitialCauses) {
      await causeListPDFRepository.getInitial20Causes().listen((events) {
        allCauses = events;
        causeListPDFRepository.getCausesCount().listen((count) async {
          casesCount = await count;
          if (casesCount == 0) {
            print('Hitting init with true and 0');
            emit(CauseListPDFState(
                causeList: allCauses,
                currLimit: 50,
                currPage: 1,
                currSkip: 0,
                totalCauses: casesCount,
                noCausesFound: true));
          } else {
            print('Hitting init with false and 20');
            emit(CauseListPDFState(
                causeList: allCauses,
                currLimit: 50,
                currPage: 1,
                currSkip: 0,
                totalCauses: casesCount,
                noCausesFound: false));
          }
        });
      });
      log(allCauses.toString());
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
    //   //     eventDisplayType: EventDisplayType`All());
    // }
    if (event is CauseListPDFGetFilteredResults) {
      await causeListPDFRepository
          .getFilteredCases(event.title, event.bench, event.startDate,
              event.court, event.endDate)
          .listen((filteredCauses) {
        if (filteredCauses.length == 0)
          emit(CauseListPDFState(
              causeList: [],
              currLimit: 50,
              currPage: 1,
              currSkip: 0,
              totalCauses: 0,
              noCausesFound: true));
        else
          emit(CauseListPDFState(
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
  }
}
