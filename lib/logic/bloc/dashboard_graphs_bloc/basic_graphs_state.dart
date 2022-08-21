part of 'basic_graphs_bloc.dart';

class BasicGraphsState {
  int? totalNewCases;
  int? maxNewCases;
  int? minNewCases;
  List<Map>? newCases;

  int? location_engaged_count;
  List<Map>? location_engaged;

  int? case_type_count;
  List<Map>? case_type;

  int? case_ongoing_count;
  int? case_disposed_count;

  int? case_by_count;
  int? case_against_count;

  // DateTime startDate = DateTime.now().subtract(Duration(days: 30));
  // DateTime endDate = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;

  List<Map>? product_wise_complaints;

  List<Map>? case_region_wise;

  String PAST30DAYSKEY = 'Past30';
  String PAST6MONTHSKEY = 'Past180';
  String PAST1YEARKEY = 'Past365';
  String THISFYKEY = 'PastFY';
  String ALLTIMEKEY = 'AllTime';

  String BASICGRAPHSKEY = 'basicGraphsData';
  String REGIONWISEKEY = 'regionWiseGraphData';
  String CASEBYAGAINSTKEY = 'caseByAgainstGraphData';
  String PRODUCTWISEKEY = 'productWiseGraphData';

  List? graphsPopulated;

  BasicGraphsState({
    this.totalNewCases = 0,
    this.maxNewCases = 0,
    this.minNewCases = 0,
    this.newCases = const [],
    this.location_engaged_count = 0,
    this.location_engaged = const [],
    this.case_type_count = 0,
    this.case_type = const [],
    this.case_region_wise = const [],
    this.case_disposed_count = 0,
    this.case_ongoing_count = 0,
    this.case_by_count = 0,
    this.case_against_count = 0,
    this.product_wise_complaints = const [],
    this.graphsPopulated = const [],
    DateTime? endDate,
    DateTime? startDate,
  });

  BasicGraphsState copyWith({
    int? totalNewCases,
    int? maxNewCases,
    int? minNewCases,
    int? location_engaged_count,
    List<Map>? newCases,
    List<Map>? location_engaged,
    int? case_type_count,
    List<Map>? case_type,
    List<Map>? case_region_wise,
    int? case_disposed_count,
    int? case_ongoing_count,
    int? case_by_count,
    int? case_against_count,
    DateTime? startDate,
    DateTime? endDate,
    List<Map>? product_wise_complaints,
    List? graphsPopulated,
  }) {
    return BasicGraphsState(
      totalNewCases: totalNewCases ?? this.totalNewCases,
      location_engaged_count:
          location_engaged_count ?? this.location_engaged_count,
      newCases: newCases ?? this.newCases,
      location_engaged: location_engaged ?? this.location_engaged,
      maxNewCases: maxNewCases ?? this.maxNewCases,
      minNewCases: minNewCases ?? this.minNewCases,
      case_type_count: case_type_count ?? this.case_type_count,
      case_type: case_type ?? this.case_type,
      case_disposed_count: case_disposed_count ?? this.case_disposed_count,
      case_ongoing_count: case_ongoing_count ?? this.case_ongoing_count,
      case_region_wise: case_region_wise ?? this.case_region_wise,
      product_wise_complaints:
          product_wise_complaints ?? this.product_wise_complaints,
      case_by_count: case_by_count ?? this.case_by_count,
      case_against_count: case_against_count ?? this.case_against_count,
      graphsPopulated: graphsPopulated ?? this.graphsPopulated,
      endDate: endDate ?? this.endDate,
      startDate: startDate ?? this.startDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalNewCases': totalNewCases,
      'maxNewCases': maxNewCases,
      'location_engaged': location_engaged,
      'location_engaged_count': location_engaged_count,
      'minNewCases': minNewCases,
      'newCases': newCases,
      'case_type_count': case_type_count,
      'case_type': case_type,
      'case_disposed_count': case_disposed_count,
      'case_ongoing_count': case_ongoing_count,
      'case_region_wise': case_region_wise,
      'product_wise_complaints': product_wise_complaints,
      'case_by_count': case_by_count,
      'case_against_count': case_against_count,
      'graphsPopulated': graphsPopulated,
      'endDate': endDate,
      'startDate': startDate,
    };
  }

  factory BasicGraphsState.fromMap(Map<String, dynamic> map) {
    return BasicGraphsState(
      totalNewCases: map['totalNewCases'],
      maxNewCases: map['maxNewCases'],
      minNewCases: map['minNewCases'],
      newCases: map['newCases'],
      location_engaged: map['location_engaged'],
      location_engaged_count: map['location_engaged_count'],
      case_type_count: map['case_type_count'],
      case_type: map['case_type'],
      case_disposed_count: map['case_disposed_count'],
      case_ongoing_count: map['case_ongoing_count'],
      case_region_wise: map['case_region_wise'],
      product_wise_complaints: map['product_wise_complaints'],
      case_by_count: map['case_by_count'],
      case_against_count: map['case_against_count'],
      graphsPopulated: map['graphsPopulated'],
      startDate: map['startDate'],
      endDate: map['endDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BasicGraphsState.fromJson(String source) =>
      BasicGraphsState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventDisplayState(case_type_count: $case_type_count,case_type: $case_type,totalNewCases: $totalNewCases, newCases: $newCases, maxNewCases: $maxNewCases, minNewCases: $minNewCases, location_engaged: $location_engaged, location_engaged_count: $location_engaged_count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BasicGraphsState &&
        // listEquals(other.all_cases, all_cases) &&
        other.totalNewCases == totalNewCases &&
        other.product_wise_complaints == product_wise_complaints &&
        other.case_by_count == case_by_count &&
        other.case_against_count == case_against_count &&
        other.maxNewCases == maxNewCases &&
        other.minNewCases == minNewCases &&
        other.case_type == case_type &&
        other.case_type_count == case_type_count &&
        other.location_engaged == location_engaged &&
        other.location_engaged_count == location_engaged_count &&
        other.case_disposed_count == case_disposed_count &&
        other.case_ongoing_count == case_ongoing_count &&
        other.case_region_wise == case_region_wise &&
        other.startDate == startDate &&
        other.graphsPopulated == graphsPopulated &&
        other.endDate == endDate &&
        other.newCases == newCases;
  }

  @override
  int get hashCode {
    return totalNewCases.hashCode ^
        newCases.hashCode ^
        maxNewCases.hashCode ^
        product_wise_complaints.hashCode ^
        case_by_count.hashCode ^
        case_against_count.hashCode ^
        location_engaged.hashCode ^
        location_engaged_count.hashCode ^
        case_type.hashCode ^
        case_type_count.hashCode ^
        case_disposed_count.hashCode ^
        case_ongoing_count.hashCode ^
        case_region_wise.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        graphsPopulated.hashCode ^
        minNewCases.hashCode;
  }
}
