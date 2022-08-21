import 'dart:convert';
import 'dart:developer';
import 'package:tip100/logic/bloc/all_cases_filters_bloc/all_cases_filters_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'all_cases_filters_state.dart';
part 'all_cases_filters_event.dart';

class AllCasesFiltersBloc
    extends Bloc<AllCasesFiltersEvent, AllCasesFiltersState> {
  AllCasesFiltersBloc({required this.allCasesFiltersRepository})
      : super(AllCasesFiltersState(
            case_type: [],
            case_manager: [],
            case_stage: [],
            court: [],
            filter_activated: false,
            state_filters: []));
  final AllCasesFiltersRepository allCasesFiltersRepository;

  @override
  Stream<AllCasesFiltersState> mapEventToState(
    AllCasesFiltersEvent event,
  ) async* {
    if (event is AllCasesFilterSelected) {
      yield AllCasesFiltersState(
          court: state.court,
          case_stage: state.case_stage,
          case_type: state.case_type,
          case_manager: state.case_manager,
          state_filters: state.state_filters,
          filter_activated: event.selected);
    } else if (event is AllCasesNoFilterSelected) {
      yield AllCasesFiltersState(
          court: state.court,
          case_stage: state.case_stage,
          case_type: state.case_type,
          case_manager: state.case_manager,
          state_filters: state.state_filters,
          filter_activated: event.selected);
    } else {
      AllCasesFiltersState initialState = AllCasesFiltersState();
      initialState.filter_activated = false;
      await allCasesFiltersRepository
          .getCaseManagerFilters()
          .listen((caseManagers) async {
        initialState.case_manager = caseManagers;
        await allCasesFiltersRepository
            .getCaseStageFilters()
            .listen((caseStages) async {
          initialState.case_stage = caseStages;
          await allCasesFiltersRepository
              .getCaseTypeFilters()
              .listen((caseTypes) async {
            initialState.case_type = caseTypes;
            await allCasesFiltersRepository
                .getCourtFilters()
                .listen((courts) async {
              initialState.court = courts;
              await allCasesFiltersRepository
                  .getStateFilters()
                  .listen((states) async {
                initialState.state_filters = states;
                await allCasesFiltersRepository
                    .getCityFilters()
                    .listen((cities) async {
                  initialState.city_filters = cities;
                  if (event is AllCasesFilters) {
                    emit(initialState);
                    // log(initialState.toString());
                  }
                });
                // if (event is AllCasesFilters) {
                //   emit(initialState);
                //   // log(initialState.toString());
                // }
              });
            });
          });
        });
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
