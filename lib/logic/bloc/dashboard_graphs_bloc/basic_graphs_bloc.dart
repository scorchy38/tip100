import 'dart:convert';
import 'dart:developer';
import 'package:tip100/logic/bloc/dashboard_graphs_bloc/basic_graphs_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'basic_graphs_state.dart';
part 'basic_graphs_event.dart';

class BasicGraphsBloc extends Bloc<BasicGraphsEvent, BasicGraphsState> {
  BasicGraphsBloc({required this.basicGraphsRepository})
      : super(BasicGraphsState(
            totalNewCases: 0,
            newCases: [],
            maxNewCases: 10,
            minNewCases: 0,
            case_against_count: 0,
            case_by_count: 0,
            case_disposed_count: 0,
            case_ongoing_count: 0,
            graphsPopulated: [],
            endDate: DateTime.now(),
            startDate: DateTime.now().subtract(Duration(days: 30)),
            case_region_wise: []));
  final BasicGraphsRepository basicGraphsRepository;

  @override
  Stream<BasicGraphsState> mapEventToState(
    BasicGraphsEvent event,
  ) async* {
    BasicGraphsState initialState = BasicGraphsState(
        totalNewCases: 0,
        newCases: [],
        maxNewCases: 10,
        minNewCases: 0,
        case_against_count: 0,
        case_by_count: 0,
        case_disposed_count: 0,
        case_ongoing_count: 0,
        graphsPopulated: [],
        endDate: DateTime.now(),
        startDate: DateTime.now().subtract(Duration(days: 30)),
        case_region_wise: []);

    // if (event is PopulateAllGraphs) {
    //   await basicGraphsRepository
    //       .getBasicGraphsData(state.startDate!, state.endDate!)
    //       .listen((basicGraphState) async {
    //     initialState = basicGraphState;
    //   });
    //   await basicGraphsRepository
    //       .getRegionWiseGraphData(state.startDate!, state.endDate!)
    //       .listen((regionWiseGraphData) async {
    //     initialState.case_region_wise = regionWiseGraphData;
    //   });
    //   await basicGraphsRepository
    //       .getCaseByAgainstGraphData(state.startDate!, state.endDate!)
    //       .listen((caseByAgainstGraphState) async {
    //     initialState.case_by_count = caseByAgainstGraphState.case_by_count;
    //     initialState.case_against_count =
    //         caseByAgainstGraphState.case_against_count;
    //   });
    //   await basicGraphsRepository
    //       .getProductWiseComplaintsGraphsData(state.startDate!, state.endDate!)
    //       .listen((productWiseComplaintsGraphState) async {
    //     initialState.product_wise_complaints =
    //         productWiseComplaintsGraphState.product_wise_complaints;
    //     log('Printing State');
    //     log(initialState.toMap().toString());
    //   });
    //   emit(initialState);
    // }

    if (event is RefreshingAllGraphs) {
      emit(BasicGraphsState(
          totalNewCases: 0,
          newCases: [],
          location_engaged: [],
          location_engaged_count: 0,
          case_type: [],
          case_type_count: 0,
          product_wise_complaints: [],
          maxNewCases: 10,
          minNewCases: 0,
          case_against_count: 0,
          case_by_count: 0,
          case_disposed_count: 0,
          case_ongoing_count: 0,
          graphsPopulated: [],
          endDate: DateTime.now(),
          startDate: DateTime.now().subtract(Duration(days: 30)),
          case_region_wise: []));
    }

    if (event is BasicGraphsInitiate) {
      await basicGraphsRepository
          .getBasicGraphsData(
              state.startDate ?? DateTime.now().subtract(Duration(days: 30)),
              state.endDate ?? DateTime.now())
          .listen((basicGraphState) async {
        initialState = basicGraphState;
        // if (initialState.graphsPopulated == null)
        //   initialState.graphsPopulated = [BasicGraphsState().BASICGRAPHSKEY];
        // else
        initialState.graphsPopulated = await state.graphsPopulated;
        initialState.graphsPopulated?.add(BasicGraphsState().BASICGRAPHSKEY);
        initialState.startDate = state.startDate;
        initialState.endDate = state.endDate;
        initialState.case_region_wise = state.case_region_wise;
        initialState.case_against_count = state.case_against_count;
        initialState.case_by_count = state.case_by_count;
        initialState.product_wise_complaints = state.product_wise_complaints;

        print(
            '1 Initial Dates ${initialState.startDate} ${initialState.startDate}');
        log('A ${initialState.toMap().toString()}');
        emit(initialState);
      });
    }
    if (event is PopulateRegionWiseGraph) {
      await basicGraphsRepository
          .getRegionWiseGraphData(
              state.startDate ?? DateTime.now().subtract(Duration(days: 30)),
              state.endDate ?? DateTime.now())
          .listen((regionWiseGraphData) async {
        BasicGraphsState newState = state;
        if (newState.graphsPopulated == null)
          newState.graphsPopulated = [BasicGraphsState().REGIONWISEKEY];
        else
          newState.graphsPopulated?.add(BasicGraphsState().REGIONWISEKEY);
        newState.case_region_wise = regionWiseGraphData;
        print('2 Initial Dates ${newState.startDate} ${newState.startDate}');
        log('B ${newState.toMap().toString()}');
        emit(newState);
      });
    }
    if (event is PopulateCaseByAgainstGraph) {
      await basicGraphsRepository
          .getCaseByAgainstGraphData(
              state.startDate ?? DateTime.now().subtract(Duration(days: 30)),
              state.endDate ?? DateTime.now())
          .listen((caseByAgainstGraphState) async {
        BasicGraphsState newState = state;
        if (newState.graphsPopulated == null)
          newState.graphsPopulated = [BasicGraphsState().CASEBYAGAINSTKEY];
        else
          newState.graphsPopulated?.add(BasicGraphsState().CASEBYAGAINSTKEY);
        newState.case_by_count = caseByAgainstGraphState.case_by_count;
        newState.case_against_count =
            caseByAgainstGraphState.case_against_count;

        print('3 Initial Dates ${newState.startDate} ${newState.startDate}');
        log('C ${newState.toMap().toString()}');
        emit(newState);
      });
    }
    if (event is PopulateProductWiseComplaintsGraph) {
      await basicGraphsRepository
          .getProductWiseComplaintsGraphsData(
              state.startDate ?? DateTime.now().subtract(Duration(days: 30)),
              state.endDate ?? DateTime.now())
          .listen((productWiseComplaintsGraphState) async {
        BasicGraphsState newState = state;
        if (newState.graphsPopulated == null)
          newState.graphsPopulated = [BasicGraphsState().PRODUCTWISEKEY];
        else
          newState.graphsPopulated?.add(BasicGraphsState().PRODUCTWISEKEY);
        newState.product_wise_complaints =
            productWiseComplaintsGraphState.product_wise_complaints;
        print('4 Initial Dates ${newState.startDate} ${newState.startDate}');
        log('D ${newState.toMap().toString()}');
        emit(newState);
      });
    }
    if (event is ChangeGraphsDuration) {
      print('Duration');
      print(event.durationSelected);
      await basicGraphsRepository
          .changeDuration(event.durationSelected!)
          .listen((datesSelected) async {
        BasicGraphsState newState = state;
        newState.startDate = datesSelected[1];
        newState.endDate = datesSelected[0];

        emit(newState);

        log(newState.toMap().toString());
      });
    }

    if (event is ChangeGraphsEndDate) {
      print(event.endDate);

      BasicGraphsState newState = state;

      newState.endDate = event.endDate;

      emit(newState);

      log(newState.toMap().toString());
    }

    if (event is ChangeGraphsStartDate) {
      print(event.startDate);
      BasicGraphsState newState = state;
      newState.startDate = event.startDate;
      emit(newState);
      log(newState.toMap().toString());
    }
  }
}
