part of 'cause_list_free_text_bloc.dart';

@immutable
abstract class CauseListFreeTextEvent {}

class CauseListFreeTextGetInitialCauses extends CauseListFreeTextEvent {}

class CauseListFreeTextGetNextPageCauses extends CauseListFreeTextEvent {
  int limit;
  CauseListFreeTextGetNextPageCauses({
    required this.limit,
  });
}

class CauseListFreeTextGetFilteredResults extends CauseListFreeTextEvent {
  DateTime? startDate;
  DateTime? endDate;

  CauseListFreeTextGetFilteredResults(
      {required this.startDate, required this.endDate});
}

class CauseListFreeTextImplementingFilters extends CauseListFreeTextEvent {}

class CauseListFreeTextRefreshing extends CauseListFreeTextEvent {}

class CauseListFreeTextFiltersImplemented extends CauseListFreeTextEvent {}
