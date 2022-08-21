part of 'all_cases_details_bloc.dart';

@immutable
abstract class AllCasesDetailsEvent {}

class GetAllCasesDetails extends AllCasesDetailsEvent {
  int id;
  GetAllCasesDetails(this.id);
}

class GetCaseActivityLog extends AllCasesDetailsEvent {
  int id;
  GetCaseActivityLog(this.id);
}

class GetDocStorageItems extends AllCasesDetailsEvent {
  int id;
  GetDocStorageItems(this.id);
}

class GetManualHearings extends AllCasesDetailsEvent {
  int id;
  GetManualHearings(this.id);
}

class GetAutomaticHearings extends AllCasesDetailsEvent {
  int id;
  GetAutomaticHearings(this.id);
}

class GetTasks extends AllCasesDetailsEvent {
  int id;
  GetTasks(this.id);
}

class RefreshingCaseDetails extends AllCasesDetailsEvent {}
