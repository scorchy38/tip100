// import 'dart:async';
// import 'dart:developer';
//
// import 'package:tip100/logic/bloc/add_lawyer_bloc.dart';
// import 'package:tip100/logic/bloc/my_counsel_repository.dart';
// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// part 'event_display_event.dart';
// part 'event_display_state.dart';
//
// class EventDisplayBloc extends Bloc<EventDisplayEvent, EventDisplayState> {
//   EventDisplayBloc({required this.eventDisplayRepository})
//       : super(EventDisplayState(eventDisplayType: EventDisplayTypeAll()));
//   // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final EventDisplayRepository eventDisplayRepository;
//
//   @override
//   Stream<EventDisplayState> mapEventToState(
//     EventDisplayEvent event,
//   ) async* {
//     final SharedPreferences _prefs = await SharedPreferences.getInstance();
//     print(_prefs.getString("user_id"));
//     print(_prefs.getString("user_obj"));
//     List<EventState> recommended = [];
//     List<EventState> allEvents = [];
//
//     await eventDisplayRepository
//         .getAllEvents(_prefs.getString("user_id")!,
//             json.decode(_prefs.getString("user_obj")!))
//         .listen((events) {
//       allEvents = events;
//       eventDisplayRepository
//           .getAllRecommendedEvents(_prefs.getString("user_id")!,
//               json.decode(_prefs.getString("user_obj")!))
//           .listen((recommendedEvent) {
//         recommended = recommendedEvent;
//         eventDisplayRepository
//             .getMyEvents(_prefs.getString("user_id")!,
//                 json.decode(_prefs.getString("user_obj")!))
//             .listen((myEvents) {
//           if (event is EventDiplayGetAllEventsInitial) {
//             emit(EventDisplayState(
//                 all_events: events,
//                 virtual_events:
//                     events.where((element) => element.virtual_event).toList(),
//                 my_events: myEvents,
//                 recommended_events: recommendedEvent,
//                 eventDisplayType: EventDisplayTypeAll()));
//           }
//         });
//         // if (event is EventDiplayGetAllEventsInitial) {
//         //   emit(EventDisplayState(
//         //       all_events: events,
//         //       virtual_events:
//         //           events.where((element) => element.virtual_event).toList(),
//         //       recommended_events: recommendedEvent,
//         //       eventDisplayType: EventDisplayTypeAll()));
//         // }
//       });
//     });
//     log(allEvents.toString());
//     // if (event is EventDiplayGetAllEventsInitial) {
//     //   log('EventDiplayGetAllEventsInitial');
//     //   emit(EventDisplayState(
//     //       all_events: allEvents,
//     //       virtual_events:
//     //           allEvents.where((element) => element.virtual_event).toList(),
//     //       recommended_events: recommended,
//     //       eventDisplayType: EventDisplayTypeAll()));
//     //
//     //
//     // }
//     // else
//     if (event is EventDiplayRequestedToJoin) {
//       yield EventDisplayState(
//           all_events: event.newEvents,
//           virtual_events: event.newEvents
//               .where((element) => element.virtual_event)
//               .toList(),
//           recommended_events: recommended,
//           eventDisplayType: EventDisplayTypeAll());
//     } else if (event is EventDiplayGetUpcommingAndPending) {
//       await eventDisplayRepository
//           .getAllUpcomming(_prefs.getString("user_id")!,
//               json.decode(_prefs.getString("user_obj")!))
//           .listen((upcomming) {
//         eventDisplayRepository
//             .getAllPending(_prefs.getString("user_id")!,
//                 json.decode(_prefs.getString("user_obj")!))
//             .listen((pending) {
//           emit(EventDisplayState(
//             all_events: state.all_events,
//             virtual_events: state.virtual_events,
//             recommended_events: state.recommended_events,
//             eventDisplayType: EventDisplayTypeAll(),
//             my_events: state.my_events,
//             pending: pending,
//             upcomming: upcomming,
//           ));
//         });
//       });
//       // yield EventDisplayState(
//       //     pending: ,
//       //     virtual_events: event.newEvents
//       //         .where((element) => element.virtual_event)
//       //         .toList(),
//       //     recommended_events: recommended,
//       //     eventDisplayType: EventDisplayTypeAll());
//     }
//   }
// }
