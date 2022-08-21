part of 'all_cases_bloc.dart';

@immutable
abstract class AllCasesEvent {}

class AllCasesGetInitialCases extends AllCasesEvent {}

class AllCasesGetNextPageCases extends AllCasesEvent {
  int limit;
  AllCasesGetNextPageCases({
    required this.limit,
  });
}

class AllCasesGetFilteredResults extends AllCasesEvent {
  String title;
  int type;
  int stage;
  int court;
  int state;
  int manager;
  String region;
  String status;
  String orderType;
  String location;
  String amount;
  String winEstimate;
  String counsel;
  String brand;
  String product;
  String allFilter;
  String tracking;

  AllCasesGetFilteredResults(
      {required this.title,
      required this.type,
      required this.state,
      required this.court,
      required this.stage,
      required this.manager,
      required this.region,
      required this.status,
      required this.orderType,
      required this.location,
      required this.amount,
      required this.winEstimate,
      required this.counsel,
      required this.brand,
      required this.product,
      required this.allFilter,
      required this.tracking});
}

class AllCasesImplementingFilters extends AllCasesEvent {}

class AllCasesRefreshing extends AllCasesEvent {}

class AllCasesFiltersImplemented extends AllCasesEvent {}
