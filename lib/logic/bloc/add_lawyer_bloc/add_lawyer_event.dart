part of 'add_lawyer_bloc.dart';

@immutable
abstract class AddLawyerEvent {}

class AddLawyerInitial extends AddLawyerEvent {
  String name;
  String gender;
  String number;
  String email;

  FormSubmissionStatus formSubmissionStatus;
  AddLawyerInitial({
    required this.name,
    required this.gender,
    required this.number,
    required this.email,
    required this.formSubmissionStatus,
  });
}

class LawyerEditInitial extends AddLawyerEvent {
  AddLawyerState lawyerToEdit;

  LawyerEditInitial({required this.lawyerToEdit});
}

class EventAddName extends AddLawyerEvent {
  String name;
  EventAddName({
    required this.name,
  });
}

class EventAddGender extends AddLawyerEvent {
  String gender;
  EventAddGender({
    required this.gender,
  });
}

class EventAddNumber extends AddLawyerEvent {
  String number;
  EventAddNumber({
    required this.number,
  });
}

class EventAddEmail extends AddLawyerEvent {
  String email;
  EventAddEmail({
    required this.email,
  });
}

class EventSubmitted extends AddLawyerEvent {}

class EventComplete extends AddLawyerEvent {}
