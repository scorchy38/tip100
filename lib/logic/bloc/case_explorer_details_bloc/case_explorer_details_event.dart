part of 'case_explorer_details_bloc.dart';

@immutable
abstract class CaseExplorerDetailsEvent {}

class GetCaseExplorerDetails extends CaseExplorerDetailsEvent {
  int id;
  GetCaseExplorerDetails(this.id);
}

class RefreshingCaseDetails extends CaseExplorerDetailsEvent {}
