part of 'cause_list_filters_bloc.dart';

@immutable
abstract class CauseListFiltersEvent {}

class CauseListFilters extends CauseListFiltersEvent {}

class CauseListTypeFilters extends CauseListFiltersEvent {}

class CauseListStageFilters extends CauseListFiltersEvent {}

class CauseListCourtFilters extends CauseListFiltersEvent {}

class CauseListManagerFilters extends CauseListFiltersEvent {}

class CauseListFilterSelected extends CauseListFiltersEvent {
  bool selected;
  CauseListFilterSelected(this.selected);
}

class CauseListNoFilterSelected extends CauseListFiltersEvent {
  bool selected;
  CauseListNoFilterSelected(this.selected);
}

class CauseListStateFilters extends CauseListFiltersEvent {}
