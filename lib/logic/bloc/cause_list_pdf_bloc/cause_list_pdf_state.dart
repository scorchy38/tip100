part of 'cause_list_pdf_bloc.dart';

class CauseListPDFState {
  List<CauseListPDF>? causeList;
  int? currPage;
  int? currSkip;
  int? currLimit;
  int? totalCauses;
  bool? noCausesFound;

  CauseListPDFState(
      {this.causeList = const [],
      this.currPage = 0,
      this.currSkip = 0,
      this.totalCauses = 0,
      this.currLimit = 50,
      this.noCausesFound = false});

  CauseListPDFState copyWith({
    List<CauseListPDF>? causeList,
    int? currPage,
    int? currSkip,
    int? currLimit,
    int? totalCauses,
    bool? noCausesFound,
  }) {
    return CauseListPDFState(
      causeList: causeList ?? this.causeList,
      currPage: currPage ?? this.currPage,
      currSkip: currSkip ?? this.currSkip,
      currLimit: currLimit ?? this.currLimit,
      totalCauses: totalCauses ?? this.totalCauses,
      noCausesFound: noCausesFound ?? this.noCausesFound,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'causeList': causeList?.map((x) => x.toJson()).toList(),
      'currPage': currPage,
      'currSkip': currSkip,
      'currLimit': currLimit,
      'totalCauses': totalCauses,
      'noCausesFound': noCausesFound,
    };
  }

  factory CauseListPDFState.fromMap(Map<String, dynamic> map) {
    return CauseListPDFState(
      causeList: List<CauseListPDF>.from(
          map['causeList']?.map((x) => CauseListPDF.fromJson(x))),
      currLimit: map['currLimit'],
      currPage: map['currPage'],
      currSkip: map['currSkip'],
      totalCauses: map['totalCauses'],
      noCausesFound: map['noCausesFound'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CauseListPDFState.fromJson(String source) =>
      CauseListPDFState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventDisplayState(causeList: $causeList, currLimit: $currLimit, currPage: $currPage, currSkip: $currSkip, totalCauses: $totalCauses)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CauseListPDFState &&
        listEquals(other.causeList, causeList) &&
        other.currSkip == currSkip &&
        other.currPage == currPage &&
        other.totalCauses == totalCauses &&
        other.noCausesFound == noCausesFound &&
        other.currLimit == currLimit;
  }

  @override
  int get hashCode {
    return causeList.hashCode ^
        currSkip.hashCode ^
        currPage.hashCode ^
        totalCauses.hashCode ^
        noCausesFound.hashCode ^
        currLimit.hashCode;
  }
}
