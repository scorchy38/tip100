part of 'cause_list_filters_bloc.dart';

class CauseListFiltersState {
  List? bench;
  bool? filter_activated;

  CauseListFiltersState({this.bench = const [], this.filter_activated = false});

  CauseListFiltersState copyWith({
    List? bench,
    bool? filter_activated,
  }) {
    return CauseListFiltersState(
      bench: bench ?? this.bench,
      filter_activated: filter_activated ?? this.filter_activated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bench': bench,
      'filter_activated': filter_activated,
    };
  }

  factory CauseListFiltersState.fromMap(Map<String, dynamic> map) {
    return CauseListFiltersState(
      bench: map['bench'],
      filter_activated: map['filter_activated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CauseListFiltersState.fromJson(String source) =>
      CauseListFiltersState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CauseListFiltersState(bench: $bench, filter_activated: $filter_activated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CauseListFiltersState &&
        listEquals(other.bench, bench) &&
        filter_activated == other.filter_activated;
  }

  @override
  int get hashCode {
    return filter_activated.hashCode ^ bench.hashCode;
  }
}
