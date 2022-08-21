part of 'event_requests_cubit.dart';

// @immutable
abstract class EventRequestsState {}

class EventRequestsInitial extends EventRequestsState {}

class EventRequestsLoaded extends EventRequestsState {}

class EventRequestsError extends EventRequestsState {}
