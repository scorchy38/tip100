part of 'add_case_bloc.dart';

int MAXINT = 9223372036854775807;

class AddCaseState {
  String priority;
  int case_type;
  String title;
  int court;
  int city;
  String description;
  bool is_alloted;
  FormSubmissionStatus formSubmissionStatus;
  AddCaseState({
    this.priority = '',
    this.case_type = 0,
    this.court = 0,
    this.city = 0,
    this.title = '',
    this.description = '',
    this.is_alloted = false,
    this.formSubmissionStatus = const InitialFormStatus(),
  });
  AddCaseState copyWith({
    String? priority,
    int? case_type,
    int? court,
    int? city,
    String? title,
    String? description,
    bool? is_alloted,
    FormSubmissionStatus? formSubmissionStatus,
  }) {
    return AddCaseState(
      priority: priority ?? this.priority,
      case_type: case_type ?? this.case_type,
      court: court ?? this.court,
      city: city ?? this.city,
      title: title ?? this.title,
      description: description ?? this.description,
      is_alloted: is_alloted ?? this.is_alloted,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'priority': priority,
      'case_type': case_type,
      'court': court,
      'city': city,
      'event_name': title,
      'description': description,
      'is_alloted': is_alloted,
      'formSubmissionStatus': formSubmissionStatus,
    };
  }

  factory AddCaseState.fromMap(Map<String, dynamic> map) {
    return AddCaseState(
      priority: map['priority'].toString(),
      case_type: map['case_type'],
      court: map['court'],
      city: map['city'],
      title: map['title'].toString(),
      description: map['description'].toString(),
      is_alloted: map['is_alloted'],
      formSubmissionStatus: map['formSubmissionStatus'],
    );
  }
  String toJson() => json.encode(toMap());
  factory AddCaseState.fromJson(String source) =>
      AddCaseState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddCaseState(priority: $priority, case_type: $case_type, court: $court, city: $city, description: $description, is_alloted: $is_alloted, formSubmissionStatus: $formSubmissionStatus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddCaseState &&
        other.priority == priority &&
        other.case_type == case_type &&
        other.court == court &&
        other.city == city &&
        other.title == title &&
        other.description == description &&
        other.is_alloted == is_alloted &&
        other.formSubmissionStatus == formSubmissionStatus;
  }

  @override
  int get hashCode {
    return priority.hashCode ^
        case_type.hashCode ^
        court.hashCode ^
        city.hashCode ^
        title.hashCode ^
        description.hashCode ^
        is_alloted.hashCode ^
        formSubmissionStatus.hashCode;
  }
}
