part of 'my_counsel_bloc.dart';

class MyCounselState {
  List<MyCounselModel>? all_counsels;
  int? totalCounsels;
  bool? noCounselsFound;

  MyCounselState(
      {this.all_counsels = const [],
      this.totalCounsels = 0,
      this.noCounselsFound = false});

  MyCounselState copyWith({
    List<MyCounselModel>? all_counsels,
    int? totalCounsels,
    bool? noCounselsFound,
  }) {
    return MyCounselState(
      all_counsels: all_counsels ?? this.all_counsels,
      totalCounsels: totalCounsels ?? this.totalCounsels,
      noCounselsFound: noCounselsFound ?? this.noCounselsFound,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'all_counsels': all_counsels?.map((x) => x.toJson()).toList(),
      'totalCounsels': totalCounsels,
      'noCounselsFound': noCounselsFound
    };
  }

  factory MyCounselState.fromMap(Map<String, dynamic> map) {
    return MyCounselState(
      all_counsels: List<MyCounselModel>.from(
          map['all_counsels']?.map((x) => MyCounselModel.fromJson(x))),
      totalCounsels: map['totalCounsels'],
      noCounselsFound: map['noCounselsFound'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MyCounselState.fromJson(String source) =>
      MyCounselState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventDisplayState(all_counsel: $all_counsels, totalCounsels: $totalCounsels)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyCounselState &&
        listEquals(other.all_counsels, all_counsels) &&
        other.totalCounsels == totalCounsels &&
        other.noCounselsFound == noCounselsFound;
  }

  @override
  int get hashCode {
    return all_counsels.hashCode ^
        totalCounsels.hashCode ^
        noCounselsFound.hashCode;
  }
}
