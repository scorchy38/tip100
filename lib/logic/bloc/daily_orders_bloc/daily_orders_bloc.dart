import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/daily_orders_model.dart';
import 'daily_orders_repository.dart';

part 'daily_orders_event.dart';
part 'daily_orders_state.dart';

class DailyOrdersBloc extends Bloc<DailyOrdersEvent, DailyOrdersState> {
  DailyOrdersBloc({required this.dailyOrdersRepository})
      : super(DailyOrdersState(
            currLimit: 50,
            currPage: 1,
            currSkip: 0,
            dailyOrders: [],
            noDailyOrdersFound: false));
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DailyOrdersRepository dailyOrdersRepository;

  @override
  Stream<DailyOrdersState> mapEventToState(
    DailyOrdersEvent event,
  ) async* {
    // final SharedPreferences _prefs = await SharedPreferences.getInstance();
    // print(_prefs.getString("user_id"));
    // print(_prefs.getString("user_obj"));
    List<DailyOrders> allOrders = [];
    int ordersCount = 0;
    if (event is DailyOrdersRefreshing) {
      print('Hitting refresh with false');
      emit(DailyOrdersState(
          dailyOrders: [],
          currLimit: 50,
          currPage: 1,
          currSkip: 0,
          totalDailyOrders: 0,
          noDailyOrdersFound: false));
    }
    if (event is DailyOrdersGetInitialList) {
      await dailyOrdersRepository.getInitial20DailyOrders().listen((events) {
        allOrders = events;
        dailyOrdersRepository.getDailyOrdersCount().listen((count) async {
          ordersCount = await count;
          if (ordersCount == 0) {
            print('Hitting init with true and 0');
            emit(DailyOrdersState(
                dailyOrders: allOrders,
                currLimit: 50,
                currPage: 1,
                currSkip: 0,
                totalDailyOrders: ordersCount,
                noDailyOrdersFound: true));
          } else {
            print('Hitting init with false and 20');
            emit(DailyOrdersState(
                dailyOrders: allOrders,
                currLimit: 50,
                currPage: 1,
                currSkip: 0,
                totalDailyOrders: ordersCount,
                noDailyOrdersFound: false));
          }
        });
      });
      log(allOrders.toString());
    }
    if (event is DailyOrdersGetFilteredResults) {
      await dailyOrdersRepository
          .getFilteredDailyOrders(event.cnr, event.title, event.court,
              event.startDate, event.endDate)
          .listen((filteredOrders) {
        if (filteredOrders.length == 0)
          emit(DailyOrdersState(
              dailyOrders: [],
              currLimit: 50,
              currPage: 1,
              currSkip: 0,
              totalDailyOrders: 0,
              noDailyOrdersFound: true));
        else
          emit(DailyOrdersState(
              dailyOrders: filteredOrders,
              currLimit: 50,
              currPage: 1,
              currSkip: 0,
              totalDailyOrders: filteredOrders.length,
              noDailyOrdersFound: false));
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
