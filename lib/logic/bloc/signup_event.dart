part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class SignupUserNameChanged extends SignupEvent {
  final String username;
  SignupUserNameChanged({required this.username});
}

class SignupPasswordChanged extends SignupEvent {
  final String password;
  SignupPasswordChanged({required this.password});
}

class SignupSubmitted extends SignupEvent {}

class SignupProfileChange extends SignupEvent {
  final String profile_type;
  SignupProfileChange({required this.profile_type});
}

class SignupFailed extends SignupEvent {}

class SignupVerificationChange extends SignupEvent {
  final bool verfied;
  SignupVerificationChange({
    required this.verfied,
  });
}
