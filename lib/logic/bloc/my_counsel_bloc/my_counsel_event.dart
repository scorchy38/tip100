part of 'my_counsel_bloc.dart';

@immutable
abstract class MyCounselEvent {}

class MyCounselGetAllCounsels extends MyCounselEvent {}

class MyCounselGetFilteredResults extends MyCounselEvent {
  String name;
  int city;
  String sort;
  int court;

  MyCounselGetFilteredResults({
    required this.name,
    required this.city,
    required this.sort,
    required this.court,
  });
}

// class AllCasesGetFilteredResults extends MyCounselEvent {
//   String title;
//   int type;
//   int stage;
//   int court;
//   int state;
//   int manager;
//   AllCasesGetFilteredResults({
//     required this.title,
//     required this.type,
//     required this.state,
//     required this.court,
//     required this.stage,
//     required this.manager,
//   });
// }
//
// class AllCasesImplementingFilters extends MyCounselEvent {}

class MyCounselRefreshing extends MyCounselEvent {}

// class AllCasesFiltersImplemented extends MyCounselEvent {}
