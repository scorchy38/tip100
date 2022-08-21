part of 'judgements_bloc.dart';

@immutable
abstract class JudgementsEvent {}

class JudgementsGetInitialList extends JudgementsEvent {}

class JudgementsGetNextPage extends JudgementsEvent {
  int limit;
  JudgementsGetNextPage({
    required this.limit,
  });
}

class JudgementsGetFilteredResults extends JudgementsEvent {
  String title;
  String cnr;

  int court;
  DateTime? startDate;
  DateTime? endDate;

  JudgementsGetFilteredResults({
    required this.title,
    required this.cnr,
    required this.startDate,
    required this.court,
    required this.endDate,
  });
}

class JudgementsImplementingFilters extends JudgementsEvent {}

class JudgementsRefreshing extends JudgementsEvent {}

class JudgementsFiltersImplemented extends JudgementsEvent {}
