part of 'all_cases_filters_bloc.dart';

class AllCasesFiltersState {
  List? case_type;
  List? case_stage;
  List? court;
  List? case_manager;
  List? state_filters;
  List? city_filters;
  bool? filter_activated;

  AllCasesFiltersState(
      {this.case_type = const [],
      this.case_stage = const [],
      this.city_filters = const [],
      this.court = const [],
      this.case_manager = const [],
      this.state_filters = const [],
      this.filter_activated = false});

  AllCasesFiltersState copyWith({
    List? case_type,
    List? case_stage,
    List? court,
    List? case_manager,
    List? city_filters,
    List? state_filters,
    bool? filter_activated,
  }) {
    return AllCasesFiltersState(
      case_type: case_type ?? this.case_type,
      case_stage: case_stage ?? this.case_stage,
      court: court ?? this.court,
      city_filters: city_filters ?? this.city_filters,
      case_manager: case_manager ?? this.case_manager,
      state_filters: state_filters ?? this.state_filters,
      filter_activated: filter_activated ?? this.filter_activated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'case_type': case_type,
      'case_stage': case_stage,
      'court': court,
      'case_manager': case_manager,
      'city_filters': city_filters,
      'state_filters': state_filters,
      'filter_activated': filter_activated,
    };
  }

  factory AllCasesFiltersState.fromMap(Map<String, dynamic> map) {
    return AllCasesFiltersState(
      case_type: map['case_type'],
      case_stage: map['case_stage'],
      court: map['court'],
      case_manager: map['case_manager'],
      city_filters: map['city_filters'],
      state_filters: map['state_filters'],
      filter_activated: map['filter_activated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AllCasesFiltersState.fromJson(String source) =>
      AllCasesFiltersState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AllCasesFiltersState(case_type: $case_type, filter_activated: $filter_activated, case_stage: $case_stage, court: $court, case_manager: $case_manager, state_filters: $state_filters)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AllCasesFiltersState &&
        listEquals(other.case_type, case_type) &&
        listEquals(other.case_stage, case_stage) &&
        listEquals(other.court, court) &&
        listEquals(other.case_manager, case_manager) &&
        listEquals(other.city_filters, city_filters) &&
        filter_activated == other.filter_activated &&
        listEquals(other.state_filters, state_filters);
  }

  @override
  int get hashCode {
    return case_type.hashCode ^
        case_stage.hashCode ^
        court.hashCode ^
        case_manager.hashCode ^
        city_filters.hashCode ^
        filter_activated.hashCode ^
        state_filters.hashCode;
  }
}
