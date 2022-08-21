part of 'daily_orders_bloc.dart';

class DailyOrdersState {
  List<DailyOrders>? dailyOrders;
  int? currPage;
  int? currSkip;
  int? currLimit;
  int? totalDailyOrders;
  bool? noDailyOrdersFound;

  DailyOrdersState(
      {this.dailyOrders = const [],
      this.currPage = 0,
      this.currSkip = 0,
      this.totalDailyOrders = 0,
      this.currLimit = 50,
      this.noDailyOrdersFound = false});

  DailyOrdersState copyWith({
    List<DailyOrders>? dailyOrders,
    int? currPage,
    int? currSkip,
    int? currLimit,
    int? totalDailyOrders,
    bool? noDailyOrdersFound,
  }) {
    return DailyOrdersState(
      dailyOrders: dailyOrders ?? this.dailyOrders,
      currPage: currPage ?? this.currPage,
      currSkip: currSkip ?? this.currSkip,
      currLimit: currLimit ?? this.currLimit,
      totalDailyOrders: totalDailyOrders ?? this.totalDailyOrders,
      noDailyOrdersFound: noDailyOrdersFound ?? this.noDailyOrdersFound,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'judgements': dailyOrders?.map((x) => x.toJson()).toList(),
      'currPage': currPage,
      'currSkip': currSkip,
      'currLimit': currLimit,
      'totalDailyOrders': totalDailyOrders,
      'noDailyOrdersFound': noDailyOrdersFound,
    };
  }

  factory DailyOrdersState.fromMap(Map<String, dynamic> map) {
    return DailyOrdersState(
      dailyOrders: List<DailyOrders>.from(
          map['judgements']?.map((x) => DailyOrders.fromJson(x))),
      currLimit: map['currLimit'],
      currPage: map['currPage'],
      currSkip: map['currSkip'],
      totalDailyOrders: map['totalDailyOrders'],
      noDailyOrdersFound: map['noDailyOrdersFound'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyOrdersState.fromJson(String source) =>
      DailyOrdersState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventDisplayState(judgements: $dailyOrders, currLimit: $currLimit, currPage: $currPage, currSkip: $currSkip, totalDailyOrders: $totalDailyOrders)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DailyOrdersState &&
        listEquals(other.dailyOrders, dailyOrders) &&
        other.currSkip == currSkip &&
        other.currPage == currPage &&
        other.totalDailyOrders == totalDailyOrders &&
        other.noDailyOrdersFound == noDailyOrdersFound &&
        other.currLimit == currLimit;
  }

  @override
  int get hashCode {
    return dailyOrders.hashCode ^
        currSkip.hashCode ^
        currPage.hashCode ^
        totalDailyOrders.hashCode ^
        noDailyOrdersFound.hashCode ^
        currLimit.hashCode;
  }
}
