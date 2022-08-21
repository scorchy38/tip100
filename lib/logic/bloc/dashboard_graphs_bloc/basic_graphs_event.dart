part of 'basic_graphs_bloc.dart';

@immutable
abstract class BasicGraphsEvent {}

class RefreshingAllGraphs extends BasicGraphsEvent {}

class PopulateAllGraphs extends BasicGraphsEvent {}

class BasicGraphsInitiate extends BasicGraphsEvent {}

class PopulateRegionWiseGraph extends BasicGraphsEvent {}

class PopulateCaseByAgainstGraph extends BasicGraphsEvent {}

class PopulateProductWiseComplaintsGraph extends BasicGraphsEvent {}

class ChangeGraphsDuration extends BasicGraphsEvent {
  String? durationSelected;

  ChangeGraphsDuration({this.durationSelected});
}

class ChangeGraphsStartDate extends BasicGraphsEvent {
  DateTime? startDate;

  ChangeGraphsStartDate({this.startDate});
}

class ChangeGraphsEndDate extends BasicGraphsEvent {
  DateTime? endDate;

  ChangeGraphsEndDate({this.endDate});
}
// class AllCasesFilterSelected extends BasicGraphsEvent {
//   bool selected;
//   AllCasesFilterSelected(this.selected);
// }
//
// class AllCasesNoFilterSelected extends BasicGraphsEvent {
//   bool selected;
//   AllCasesNoFilterSelected(this.selected);
// }

// class AllCasesStateFilters extends BasicGraphsEvent {}
