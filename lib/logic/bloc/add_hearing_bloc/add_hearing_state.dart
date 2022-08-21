part of 'add_hearing_bloc.dart';

int MAXINT = 9223372036854775807;

class AddHearingState {
  String title;
  String date_of_hearing;
  String hearing_status;
  int hearing_stage;
  String hearing_description;
  int caseId;

  FormSubmissionStatus formSubmissionStatus;
  AddHearingState({
    this.title = '',
    this.date_of_hearing = '',
    this.hearing_status = '',
    this.hearing_stage = 0,
    this.hearing_description = '',
    this.caseId = 0,
    this.formSubmissionStatus = const InitialFormStatus(),
  });
  AddHearingState copyWith({
    String? title,
    String? date_of_hearing,
    String? hearing_status,
    int? hearing_stage,
    int? caseId,
    String? hearing_description,
    FormSubmissionStatus? formSubmissionStatus,
  }) {
    return AddHearingState(
      title: title ?? this.title,
      date_of_hearing: date_of_hearing ?? this.date_of_hearing,
      hearing_status: hearing_status ?? this.hearing_status,
      hearing_stage: hearing_stage ?? this.hearing_stage,
      hearing_description: hearing_description ?? this.hearing_description,
      caseId: caseId ?? this.caseId,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'date_of_hearing': date_of_hearing,
      'hearing_status': hearing_status,
      'hearing_stage': hearing_stage,
      'hearing_description': hearing_description,
      'caseId': caseId,
      'formSubmissionStatus': formSubmissionStatus,
    };
  }

  factory AddHearingState.fromMap(Map<String, dynamic> map) {
    return AddHearingState(
      title: map['title'].toString(),
      date_of_hearing: map['date_of_hearing'],
      hearing_status: map['hearing_status'],
      hearing_stage: map['hearing_stage'],
      hearing_description: map['hearing_description'].toString(),
      formSubmissionStatus: map['formSubmissionStatus'],
      caseId: map['caseId'],
    );
  }
  String toJson() => json.encode(toMap());
  factory AddHearingState.fromJson(String source) =>
      AddHearingState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddHearingState(date_of_hearing: $date_of_hearing, hearing_status: $hearing_status, hearing_stage: $hearing_stage, hearing_description: $hearing_description, formSubmissionStatus: $formSubmissionStatus, caseId: $caseId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddHearingState &&
        other.date_of_hearing == date_of_hearing &&
        other.hearing_status == hearing_status &&
        other.hearing_stage == hearing_stage &&
        other.hearing_description == hearing_description &&
        other.caseId == caseId &&
        other.title == title &&
        other.formSubmissionStatus == formSubmissionStatus;
  }

  @override
  int get hashCode {
    return date_of_hearing.hashCode ^
        hearing_status.hashCode ^
        hearing_stage.hashCode ^
        hearing_description.hashCode ^
        title.hashCode ^
        caseId.hashCode ^
        formSubmissionStatus.hashCode;
  }
}
