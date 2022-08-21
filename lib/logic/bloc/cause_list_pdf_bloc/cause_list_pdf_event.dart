part of 'cause_list_pdf_bloc.dart';

@immutable
abstract class CauseListPDFEvent {}

class CauseListPDFGetInitialCauses extends CauseListPDFEvent {}

class CauseListPDFGetNextPageCauses extends CauseListPDFEvent {
  int limit;
  CauseListPDFGetNextPageCauses({
    required this.limit,
  });
}

class CauseListPDFGetFilteredResults extends CauseListPDFEvent {
  String title;
  DateTime? startDate;
  DateTime? endDate;
  String bench;
  int court;

  CauseListPDFGetFilteredResults({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.court,
    required this.bench,
  });
}

class CauseListPDFImplementingFilters extends CauseListPDFEvent {}

class CauseListPDFRefreshing extends CauseListPDFEvent {}

class CauseListPDFFiltersImplemented extends CauseListPDFEvent {}
