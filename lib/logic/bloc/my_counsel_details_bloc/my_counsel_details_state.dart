part of 'my_counsel_details_bloc.dart';

class MyCounselDetailsState {
  CounselDetail? counselDetails;
  List<CounselDocStorageItem>? docStorageItems;
  List<CounselCaseItem>? caseItems;
  List<CounselNoticeItem>? noticeItems;

  bool? casesLoading;
  bool? loading;
  bool? noticesLoading;
  bool? docStorageLoading;

  MyCounselDetailsState(
      {this.counselDetails,
      this.loading = true,
      this.docStorageItems,
      this.docStorageLoading = true,
      this.caseItems,
      this.casesLoading = true,
      this.noticeItems,
      this.noticesLoading = true});

  MyCounselDetailsState copyWith(
      {CounselDetail? counselDetails,
      bool? loading,
      bool? docStorageLoading,
      List<CounselDocStorageItem>? docStorageItems,
      bool? casesLoading,
      List<CounselCaseItem>? caseItems,
      bool? noticesLoading,
      List<CounselNoticeItem>? noticeItems}) {
    return MyCounselDetailsState(
      counselDetails: counselDetails ?? this.counselDetails,
      loading: loading ?? this.loading,
      docStorageItems: docStorageItems ?? this.docStorageItems,
      docStorageLoading: docStorageLoading ?? this.docStorageLoading,
      caseItems: caseItems ?? this.caseItems,
      casesLoading: casesLoading ?? this.casesLoading,
      noticeItems: noticeItems ?? this.noticeItems,
      noticesLoading: noticesLoading ?? this.noticesLoading,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'counselDetails': counselDetails?.toJson(),
      'loading': loading,
      'docStorageLoading': docStorageLoading,
      'docStorageItems': docStorageItems?.map((e) => e.toJson()).toList(),
      'casesLoading': casesLoading,
      'caseItems': caseItems?.map((e) => e.toJson()).toList(),
      'noticesLoading': noticesLoading,
      'noticeItems': noticeItems?.map((e) => e.toJson()).toList(),
    };
  }

  factory MyCounselDetailsState.fromMap(Map<String, dynamic> map) {
    return MyCounselDetailsState(
        counselDetails: CounselDetail.fromJson(map['counselDetails']),
        loading: map['loading'],
        docStorageLoading: map['docStorageLoading'],
        docStorageItems: map['docStorageItems']
            ?.map((e) => CounselDocStorageItem.fromJson(e))
            .toList(),
        casesLoading: map['casesLoading'],
        caseItems:
            map['caseItems']?.map((e) => CounselCaseItem.fromJson(e)).toList(),
        noticesLoading: map['noticesLoading'],
        noticeItems: map['noticeItems']
            ?.map((e) => CounselNoticeItem.fromJson(e))
            .toList());
  }

  String toJson() => json.encode(toMap());

  factory MyCounselDetailsState.fromJson(String source) =>
      MyCounselDetailsState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventDisplayState(caseDetails: $counselDetails, loading: $loading, activityLog: $caseItems, activityLogLoading: $casesLoading)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MyCounselDetailsState &&
        other.counselDetails == counselDetails &&
        other.loading == loading &&
        other.casesLoading == casesLoading &&
        other.caseItems == caseItems &&
        other.docStorageLoading == docStorageLoading &&
        other.docStorageItems == docStorageItems &&
        other.noticesLoading == noticesLoading &&
        other.noticeItems == noticeItems;
  }

  @override
  int get hashCode {
    return counselDetails.hashCode ^
        loading.hashCode ^
        casesLoading.hashCode ^
        caseItems.hashCode ^
        docStorageLoading.hashCode ^
        docStorageItems.hashCode ^
        noticesLoading.hashCode ^
        noticeItems.hashCode;
  }
}
