part of 'cause_list_free_text_bloc.dart';

class CauseListFreeTextState {
  List<CauseListFreeText>? causeList;
  int? currPage;
  int? currSkip;
  int? currLimit;
  int? totalCauses;
  bool? noCausesFound;

  CauseListFreeTextState(
      {this.causeList = const [],
      this.currPage = 0,
      this.currSkip = 0,
      this.totalCauses = 0,
      this.currLimit = 50,
      this.noCausesFound = false});

  CauseListFreeTextState copyWith({
    List<CauseListFreeText>? causeList,
    int? currPage,
    int? currSkip,
    int? currLimit,
    int? totalCauses,
    bool? noCausesFound,
  }) {
    return CauseListFreeTextState(
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

  factory CauseListFreeTextState.fromMap(Map<String, dynamic> map) {
    return CauseListFreeTextState(
      causeList: List<CauseListFreeText>.from(
          map['causeList']?.map((x) => CauseListFreeText.fromJson(x))),
      currLimit: map['currLimit'],
      currPage: map['currPage'],
      currSkip: map['currSkip'],
      totalCauses: map['totalCauses'],
      noCausesFound: map['noCausesFound'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CauseListFreeTextState.fromJson(String source) =>
      CauseListFreeTextState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventDisplayState(causeList: $causeList, currLimit: $currLimit, currPage: $currPage, currSkip: $currSkip, totalCauses: $totalCauses)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CauseListFreeTextState &&
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
