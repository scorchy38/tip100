part of 'case_explorer_bloc.dart';

class CaseExplorerState {
  List<AllCasesModel>? all_cases;
  int? currPage;
  int? currSkip;
  int? currLimit;
  int? totalCases;
  bool? noCasesFound;
  int? scrape_type;
  int? keyword_type;
  String? keyword_search_for;

  CaseExplorerState(
      {this.all_cases = const [],
      this.currPage = 0,
      this.currSkip = 0,
      this.totalCases = 0,
      this.currLimit = 50,
      this.noCasesFound = false,
      this.scrape_type = 1,
      this.keyword_search_for = "C",
      this.keyword_type = 0});

  CaseExplorerState copyWith({
    List<AllCasesModel>? all_cases,
    int? currPage,
    int? currSkip,
    int? currLimit,
    int? totalCases,
    int? scrape_type,
    int? keyword_type,
    String? keyword_search_for,
    bool? noCasesFound,
  }) {
    return CaseExplorerState(
      all_cases: all_cases ?? this.all_cases,
      currPage: currPage ?? this.currPage,
      currSkip: currSkip ?? this.currSkip,
      currLimit: currLimit ?? this.currLimit,
      totalCases: totalCases ?? this.totalCases,
      noCasesFound: noCasesFound ?? this.noCasesFound,
      scrape_type: scrape_type ?? this.scrape_type,
      keyword_type: keyword_type ?? this.keyword_type,
      keyword_search_for: keyword_search_for ?? this.keyword_search_for,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'all_cases': all_cases?.map((x) => x.toJson()).toList(),
      'currPage': currPage,
      'currSkip': currSkip,
      'currLimit': currLimit,
      'totalCases': totalCases,
      'noCasesFound': noCasesFound,
      'scrape_type': scrape_type,
      'keyword_type': keyword_type,
      'keyword_search_for': keyword_search_for,
    };
  }

  factory CaseExplorerState.fromMap(Map<String, dynamic> map) {
    return CaseExplorerState(
      all_cases: List<AllCasesModel>.from(
          map['all_cases']?.map((x) => AllCasesModel.fromJson(x))),
      currLimit: map['currLimit'],
      currPage: map['currPage'],
      currSkip: map['currSkip'],
      totalCases: map['totalCases'],
      noCasesFound: map['noCasesFound'],
      scrape_type: map['scrape_type'],
      keyword_type: map['keyword_type'],
      keyword_search_for: map['keyword_search_for'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CaseExplorerState.fromJson(String source) =>
      CaseExplorerState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventDisplayState(all_cases: $all_cases, currLimit: $currLimit, currPage: $currPage, currSkip: $currSkip, totalCases: $totalCases)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CaseExplorerState &&
        listEquals(other.all_cases, all_cases) &&
        other.currSkip == currSkip &&
        other.currPage == currPage &&
        other.totalCases == totalCases &&
        other.noCasesFound == noCasesFound &&
        other.scrape_type == scrape_type &&
        other.keyword_type == keyword_type &&
        other.keyword_search_for == keyword_search_for &&
        other.currLimit == currLimit;
  }

  @override
  int get hashCode {
    return all_cases.hashCode ^
        currSkip.hashCode ^
        currPage.hashCode ^
        totalCases.hashCode ^
        noCasesFound.hashCode ^
        scrape_type.hashCode ^
        keyword_type.hashCode ^
        keyword_search_for.hashCode ^
        currLimit.hashCode;
  }
}
