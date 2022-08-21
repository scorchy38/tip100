part of 'daily_orders_bloc.dart';

@immutable
abstract class DailyOrdersEvent {}

class DailyOrdersGetInitialList extends DailyOrdersEvent {}

class DailyOrdersGetNextPage extends DailyOrdersEvent {
  int limit;
  DailyOrdersGetNextPage({
    required this.limit,
  });
}

class DailyOrdersGetFilteredResults extends DailyOrdersEvent {
  String title;
  String cnr;

  int court;
  DateTime? startDate;
  DateTime? endDate;
  DailyOrdersGetFilteredResults({
    required this.title,
    required this.cnr,
    required this.startDate,
    required this.court,
    required this.endDate,
  });
}

class DailyOrdersImplementingFilters extends DailyOrdersEvent {}

class DailyOrdersRefreshing extends DailyOrdersEvent {}

class DailyOrdersFiltersImplemented extends DailyOrdersEvent {}
