part of 'all_cases_details_bloc.dart';

class AllCasesDetailsState {
  AllCasesDetails? caseDetails;
  List<ActivityLogItem>? activityLog;
  List<DocStorageItem>? docStorageItems;
  List<ManualHearing>? manualHearings;
  List<AutomaticHearing>? automaticHearings;
  List<Task>? tasks;
  bool? tasksLoading;
  bool? loading;
  bool? activityLogLoading;
  bool? docStorageLoading;
  bool? manualHearingsLoading;
  bool? automaticHearingsLoading;

  AllCasesDetailsState(
      {this.caseDetails,
      this.loading = true,
      this.activityLog,
      this.activityLogLoading = true,
      this.docStorageItems,
      this.docStorageLoading = true,
      this.manualHearings,
      this.manualHearingsLoading = true,
      this.automaticHearings,
      this.automaticHearingsLoading = true,
      this.tasks,
      this.tasksLoading = true});

  AllCasesDetailsState copyWith(
      {AllCasesDetails? caseDetails,
      bool? loading,
      bool? activityLogLoading,
      List<ActivityLogItem>? activityLog,
      bool? docStorageLoading,
      List<DocStorageItem>? docStorageItems,
      bool? manualHearingsLoading,
      List<ManualHearing>? manualHearings,
      bool? automaticHearingsLoading,
      List<AutomaticHearing>? automaticHearings,
      bool? tasksLoading,
      List<Task>? tasks}) {
    return AllCasesDetailsState(
      caseDetails: caseDetails ?? this.caseDetails,
      loading: loading ?? this.loading,
      activityLogLoading: activityLogLoading ?? this.activityLogLoading,
      activityLog: activityLog ?? this.activityLog,
      docStorageLoading: docStorageLoading ?? this.docStorageLoading,
      docStorageItems: docStorageItems ?? this.docStorageItems,
      manualHearingsLoading:
          manualHearingsLoading ?? this.manualHearingsLoading,
      manualHearings: manualHearings ?? this.manualHearings,
      automaticHearingsLoading:
          automaticHearingsLoading ?? this.automaticHearingsLoading,
      automaticHearings: automaticHearings ?? this.automaticHearings,
      tasks: tasks ?? this.tasks,
      tasksLoading: tasksLoading ?? this.tasksLoading,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'caseDetails': caseDetails?.toJson(),
      'loading': loading,
      'activityLogLoading': activityLogLoading,
      'activityLog': activityLog?.map((e) => e.toJson()).toList(),
      'docStorageLoading': docStorageLoading,
      'docStorageItems': docStorageItems?.map((e) => e.toJson()).toList(),
      'manualHearingsLoading': manualHearingsLoading,
      'manualHearings': manualHearings?.map((e) => e.toJson()).toList(),
      'automaticHearingsLoading': automaticHearingsLoading,
      'automaticHearings': automaticHearings?.map((e) => e.toJson()).toList(),
      'tasksLoading': tasksLoading,
      'tasks': tasks?.map((e) => e.toJson()).toList(),
    };
  }

  factory AllCasesDetailsState.fromMap(Map<String, dynamic> map) {
    return AllCasesDetailsState(
        caseDetails: AllCasesDetails.fromJson(map['caseDetails']),
        loading: map['loading'],
        activityLogLoading: map['activityLogLoading'],
        activityLog: map['activityLog']
            ?.map((e) => ActivityLogItem.fromJson(e))
            .toList(),
        docStorageLoading: map['docStorageLoading'],
        docStorageItems: map['docStorageItems']
            ?.map((e) => DocStorageItem.fromJson(e))
            .toList(),
        manualHearingsLoading: map['manualHearingsLoading'],
        manualHearings: map['manualHearings']
            ?.map((e) => ManualHearing.fromJson(e))
            .toList(),
        automaticHearingsLoading: map['automaticHearingsLoading'],
        automaticHearings: map['automaticHearings']
            ?.map((e) => AutomaticHearing.fromJson(e))
            .toList(),
        tasksLoading: map['tasksLoading'],
        tasks: map['tasks']?.map((e) => AutomaticHearing.fromJson(e)).toList());
  }

  String toJson() => json.encode(toMap());

  factory AllCasesDetailsState.fromJson(String source) =>
      AllCasesDetailsState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventDisplayState(caseDetails: $caseDetails, loading: $loading, activityLog: $activityLog, activityLogLoading: $activityLogLoading)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AllCasesDetailsState &&
        other.caseDetails == caseDetails &&
        other.loading == loading &&
        other.activityLogLoading == activityLogLoading &&
        other.activityLog == activityLog &&
        other.docStorageLoading == docStorageLoading &&
        other.docStorageItems == docStorageItems &&
        other.manualHearingsLoading == manualHearingsLoading &&
        other.manualHearings == manualHearings &&
        other.automaticHearingsLoading == automaticHearingsLoading &&
        other.automaticHearings == automaticHearings &&
        other.tasksLoading == tasksLoading &&
        other.tasks == tasks;
  }

  @override
  int get hashCode {
    return caseDetails.hashCode ^
        loading.hashCode ^
        activityLog.hashCode ^
        activityLogLoading.hashCode;
  }
}
