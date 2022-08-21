part of 'case_explorer_details_bloc.dart';

class CaseExplorerDetailsState {
  CaseExplorerDetails? caseDetails;
  bool? loading;

  CaseExplorerDetailsState({this.caseDetails, this.loading = true});

  CaseExplorerDetailsState copyWith({
    CaseExplorerDetails? caseDetails,
    bool? loading,
  }) {
    return CaseExplorerDetailsState(
      caseDetails: caseDetails ?? this.caseDetails,
      loading: loading ?? this.loading,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'caseDetails': caseDetails?.toJson(),
      'loading': loading,
    };
  }

  factory CaseExplorerDetailsState.fromMap(Map<String, dynamic> map) {
    return CaseExplorerDetailsState(
      caseDetails: CaseExplorerDetails.fromJson(map['caseDetails']),
      loading: map['loading'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CaseExplorerDetailsState.fromJson(String source) =>
      CaseExplorerDetailsState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventDisplayState(caseDetails: $caseDetails, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CaseExplorerDetailsState &&
        other.caseDetails == caseDetails &&
        other.loading == loading;
  }

  @override
  int get hashCode {
    return caseDetails.hashCode ^ loading.hashCode;
  }
}
