part of 'add_case_bloc.dart';

@immutable
abstract class AddCaseEvent {}

class AddCaseInitial extends AddCaseEvent {
  String priority;
  int case_type;
  String title;
  int court;
  int city;
  String description;
  bool is_alloted;
  FormSubmissionStatus formSubmissionStatus;
  AddCaseInitial({
    required this.priority,
    required this.case_type,
    required this.title,
    required this.court,
    required this.city,
    required this.description,
    required this.is_alloted,
    required this.formSubmissionStatus,
  });
}

class CaseEditInitial extends AddCaseEvent {
  AddCaseState caseToEdit;

  CaseEditInitial({required this.caseToEdit});
}

class EventAddPriority extends AddCaseEvent {
  String priority;
  EventAddPriority({
    required this.priority,
  });
}

class EventAddCaseType extends AddCaseEvent {
  int case_type;
  EventAddCaseType({
    required this.case_type,
  });
}

class EventAddTitle extends AddCaseEvent {
  String title;
  EventAddTitle({
    required this.title,
  });
}

class EventAddCourt extends AddCaseEvent {
  int court;
  EventAddCourt({
    required this.court,
  });
}

class EventAddCity extends AddCaseEvent {
  int city;
  EventAddCity({
    required this.city,
  });
}

class EventAddDescription extends AddCaseEvent {
  String description;
  EventAddDescription({
    required this.description,
  });
}

class EventToggleIsAlloted extends AddCaseEvent {
  bool is_alloted;
  EventToggleIsAlloted({
    required this.is_alloted,
  });
}

class EventSubmitted extends AddCaseEvent {}

class EventComplete extends AddCaseEvent {}