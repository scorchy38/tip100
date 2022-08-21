// part of 'event_display_bloc.dart';
//
// import 'package:tip100/logic/bloc/add_lawyer_bloc.dart';
//
// class EventDisplayState {
//   List<EventState> all_events;
//   List<EventState> my_events;
//   List<EventState> virtual_events;
//   List<EventState> recommended_events;
//   List<EventState> current_events;
//   List<Map> upcomming;
//   List<Map> pending;
//   // EventDisplayType eventDisplayType;
//
//   EventDisplayState({
//     this.all_events = const [],
//     this.virtual_events = const [],
//     this.my_events = const [],
//     this.recommended_events = const [],
//     this.current_events = const [],
//     this.upcomming = const [],
//     this.pending = const [],
//     this.eventDisplayType = const EventDisplayType(),
//   });
//
//   EventDisplayState copyWith({
//     List<EventState>? all_events,
//     List<EventState>? virtual_events,
//     List<EventState>? my_events,
//     List<Map>? upcomming,
//     List<Map>? pending,
//     List<EventState>? recommended_events,
//     List<EventState>? current_events,
//     EventDisplayType? eventDisplayType,
//   }) {
//     return EventDisplayState(
//       all_events: all_events ?? this.all_events,
//       virtual_events: virtual_events ?? this.virtual_events,
//       my_events: my_events ?? this.my_events,
//       recommended_events: recommended_events ?? this.recommended_events,
//       current_events: current_events ?? this.current_events,
//       pending: pending ?? this.pending,
//       upcomming: upcomming ?? this.upcomming,
//       eventDisplayType: eventDisplayType ?? this.eventDisplayType,
//     );
//   }
//
//   Map<String, dynamic> toMap() {
//     return {
//       'all_events': all_events.map((x) => x.toMap()).toList(),
//       'my_events': my_events.map((x) => x.toMap()).toList(),
//       'virtual_events': virtual_events.map((x) => x.toMap()).toList(),
//       'pending': pending.toList(),
//       'upcomming': upcomming.toList(),
//       'recommended_events': recommended_events.map((x) => x.toMap()).toList(),
//       'current_events': current_events.map((x) => x.toMap()).toList(),
//       // 'eventDisplayType': eventDisplayType.toMap(),
//     };
//   }
//
//   factory EventDisplayState.fromMap(Map<String, dynamic> map) {
//     return EventDisplayState(
//       all_events: List<EventState>.from(
//           map['all_events']?.map((x) => EventState.fromMap(x))),
//       my_events: List<EventState>.from(
//           map['my_events']?.map((x) => EventState.fromMap(x))),
//       virtual_events: List<EventState>.from(
//           map['virtual_events']?.map((x) => EventState.fromMap(x))),
//       pending: List<Map>.from(map['pending']),
//       upcomming: List<Map>.from(map['upcomming']),
//       recommended_events: List<EventState>.from(
//           map['recommended_events']?.map((x) => EventState.fromMap(x))),
//       current_events: List<EventState>.from(
//           map['current_events']?.map((x) => EventState.fromMap(x))),
//       // eventDisplayType: EventDisplayType.fromMap(map['eventDisplayType']),
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory EventDisplayState.fromJson(String source) =>
//       EventDisplayState.fromMap(json.decode(source));
//
//   @override
//   String toString() {
//     return 'EventDisplayState(all_events: $all_events, virtual_events: $virtual_events, my_events: $my_events, recommended_events: $recommended_events, current_events: $current_events, eventDisplayType: $eventDisplayType)';
//   }
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//
//     return other is EventDisplayState &&
//         listEquals(other.all_events, all_events) &&
//         listEquals(other.my_events, my_events) &&
//         listEquals(other.virtual_events, virtual_events) &&
//         listEquals(other.pending, pending) &&
//         listEquals(other.upcomming, upcomming) &&
//         listEquals(other.recommended_events, recommended_events) &&
//         listEquals(other.current_events, current_events) &&
//         other.eventDisplayType == eventDisplayType;
//   }
//
//   @override
//   int get hashCode {
//     return all_events.hashCode ^
//         virtual_events.hashCode ^
//         my_events.hashCode ^
//         recommended_events.hashCode ^
//         current_events.hashCode ^
//         eventDisplayType.hashCode;
//   }
// }
