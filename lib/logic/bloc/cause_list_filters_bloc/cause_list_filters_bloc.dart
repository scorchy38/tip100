import 'dart:convert';
import 'dart:developer';
import 'package:tip100/logic/bloc/all_cases_filters_bloc/all_cases_filters_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cause_list_filters_repository.dart';

part 'cause_list_filters_state.dart';
part 'cause_list_filters_event.dart';

class CauseListFiltersBloc
    extends Bloc<CauseListFiltersEvent, CauseListFiltersState> {
  CauseListFiltersBloc({required this.causeListFiltersRepository})
      : super(CauseListFiltersState(bench: [], filter_activated: false));
  final CauseListFiltersRepository causeListFiltersRepository;

  @override
  Stream<CauseListFiltersState> mapEventToState(
    CauseListFiltersEvent event,
  ) async* {
    if (event is CauseListFilterSelected) {
      yield CauseListFiltersState(
          bench: state.bench, filter_activated: event.selected);
    } else if (event is CauseListNoFilterSelected) {
      yield CauseListFiltersState(
          bench: state.bench, filter_activated: event.selected);
    } else {
      CauseListFiltersState initialState = CauseListFiltersState();
      initialState.filter_activated = false;
      await causeListFiltersRepository
          .getBenchTypeFilters()
          .listen((bench) async {
        initialState.bench = await bench;
        if (event is CauseListFilters) {
          emit(initialState);
          log(initialState.toString());
        }
      });
    }

    // if (event is EventDiplayGetAllEventsInitial) {
    //   log('EventDiplayGetAllEventsInitial');
    //   emit(EventDisplayState(
    //       all_events: allEvents,
    //       virtual_events:
    //           allEvents.where((element) => element.virtual_event).toList(),
    //       recommended_events: recommended,
    //       eventDisplayType: EventDisplayTypeAll()));
    //
    //
    // }
    // else
    // if (event is EventDiplayRequestedToJoin) {
    //   yield EventDisplayState(
    //       all_events: event.newEvents,
    //       virtual_events: event.newEvents
    //           .where((element) => element.virtual_event)
    //           .toList(),
    //       recommended_events: recommended,
    //       eventDisplayType: EventDisplayTypeAll());
    // }
    // if (event is AllCasesGetNextPageCases) {
    //   await allCasesRepository
    //       .getPaginatedCases(
    //           state.currSkip.toString(),
    //           (state.currPage! + 1).toString(),
    //           event.limit.toString(),
    //           state.all_cases!)
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
  }
}
