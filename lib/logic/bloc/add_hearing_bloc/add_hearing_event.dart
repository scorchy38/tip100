part of 'add_hearing_bloc.dart';

@immutable
abstract class AddHearingEvent {}

class AddHearingInitial extends AddHearingEvent {
  String title;
  String date_of_hearing;
  String hearing_status;
  int hearing_stage;
  String hearing_description;
  int caseId;
  FormSubmissionStatus formSubmissionStatus;
  AddHearingInitial({
    required this.title,
    required this.date_of_hearing,
    required this.hearing_status,
    required this.hearing_stage,
    required this.hearing_description,
    required this.caseId,
    required this.formSubmissionStatus,
  });
}

class HearingEditInitial extends AddHearingEvent {
  AddHearingState caseToEdit;

  HearingEditInitial({required this.caseToEdit});
}

class EventAddDateOfHearing extends AddHearingEvent {
  String date_of_hearing;
  EventAddDateOfHearing({
    required this.date_of_hearing,
  });
}

class EventAddHearingStatus extends AddHearingEvent {
  String hearing_status;
  EventAddHearingStatus({
    required this.hearing_status,
  });
}

class EventAddTitle extends AddHearingEvent {
  String title;
  EventAddTitle({
    required this.title,
  });
}

class EventAddHearingDescription extends AddHearingEvent {
  String hearing_description;
  EventAddHearingDescription({
    required this.hearing_description,
  });
}

class EventAddHearingStage extends AddHearingEvent {
  int hearing_stage;
  EventAddHearingStage({
    required this.hearing_stage,
  });
}

class EventAddCaseId extends AddHearingEvent {
  int caseId;
  EventAddCaseId({
    required this.caseId,
  });
}

class EventSubmitted extends AddHearingEvent {}

class EventComplete extends AddHearingEvent {}
