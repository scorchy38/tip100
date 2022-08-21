part of 'all_cases_filters_bloc.dart';

@immutable
abstract class AllCasesFiltersEvent {}

class AllCasesFilters extends AllCasesFiltersEvent {}

class AllCasesTypeFilters extends AllCasesFiltersEvent {}

class AllCasesStageFilters extends AllCasesFiltersEvent {}

class AllCasesCourtFilters extends AllCasesFiltersEvent {}

class AllCasesManagerFilters extends AllCasesFiltersEvent {}

class AllCasesFilterSelected extends AllCasesFiltersEvent {
  bool selected;
  AllCasesFilterSelected(this.selected);
}

class AllCasesNoFilterSelected extends AllCasesFiltersEvent {
  bool selected;
  AllCasesNoFilterSelected(this.selected);
}

class AllCasesStateFilters extends AllCasesFiltersEvent {}
