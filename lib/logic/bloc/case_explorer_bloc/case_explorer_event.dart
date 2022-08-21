part of 'case_explorer_bloc.dart';

@immutable
abstract class CaseExplorerEvent {}

class CaseExplorerGetInitialCases extends CaseExplorerEvent {}

class CaseExplorerGetNextPageCases extends CaseExplorerEvent {
  int limit;
  CaseExplorerGetNextPageCases({
    required this.limit,
  });
}

class AllCasesGetFilteredResults extends CaseExplorerEvent {
  String title;
  int type;
  int stage;
  int court;
  int state;
  int manager;
  AllCasesGetFilteredResults({
    required this.title,
    required this.type,
    required this.state,
    required this.court,
    required this.stage,
    required this.manager,
  });
}

class AllCasesImplementingFilters extends CaseExplorerEvent {}

class CaseExplorerRefreshing extends CaseExplorerEvent {}

class AllCasesFiltersImplemented extends CaseExplorerEvent {}
