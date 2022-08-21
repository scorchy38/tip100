part of 'judgements_bloc.dart';

class JudgementsState {
  List<Judgements>? judgements;
  int? currPage;
  int? currSkip;
  int? currLimit;
  int? totalJudgements;
  bool? noJudgementsFound;

  JudgementsState(
      {this.judgements = const [],
      this.currPage = 0,
      this.currSkip = 0,
      this.totalJudgements = 0,
      this.currLimit = 50,
      this.noJudgementsFound = false});

  JudgementsState copyWith({
    List<Judgements>? judgements,
    int? currPage,
    int? currSkip,
    int? currLimit,
    int? totalJudgements,
    bool? noJudgementsFound,
  }) {
    return JudgementsState(
      judgements: judgements ?? this.judgements,
      currPage: currPage ?? this.currPage,
      currSkip: currSkip ?? this.currSkip,
      currLimit: currLimit ?? this.currLimit,
      totalJudgements: totalJudgements ?? this.totalJudgements,
      noJudgementsFound: noJudgementsFound ?? this.noJudgementsFound,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'judgements': judgements?.map((x) => x.toJson()).toList(),
      'currPage': currPage,
      'currSkip': currSkip,
      'currLimit': currLimit,
      'totalJudgements': totalJudgements,
      'noJudgementsFound': noJudgementsFound,
    };
  }

  factory JudgementsState.fromMap(Map<String, dynamic> map) {
    return JudgementsState(
      judgements: List<Judgements>.from(
          map['judgements']?.map((x) => Judgements.fromJson(x))),
      currLimit: map['currLimit'],
      currPage: map['currPage'],
      currSkip: map['currSkip'],
      totalJudgements: map['totalJudgements'],
      noJudgementsFound: map['noJudgementsFound'],
    );
  }

  String toJson() => json.encode(toMap());

  factory JudgementsState.fromJson(String source) =>
      JudgementsState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventDisplayState(judgements: $judgements, currLimit: $currLimit, currPage: $currPage, currSkip: $currSkip, totalJudgements: $totalJudgements)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is JudgementsState &&
        listEquals(other.judgements, judgements) &&
        other.currSkip == currSkip &&
        other.currPage == currPage &&
        other.totalJudgements == totalJudgements &&
        other.noJudgementsFound == noJudgementsFound &&
        other.currLimit == currLimit;
  }

  @override
  int get hashCode {
    return judgements.hashCode ^
        currSkip.hashCode ^
        currPage.hashCode ^
        totalJudgements.hashCode ^
        noJudgementsFound.hashCode ^
        currLimit.hashCode;
  }
}
