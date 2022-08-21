part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SigninUserNameChanged extends SigninEvent {
  final String username;
  SigninUserNameChanged({required this.username});
}

class SigninPasswordChanged extends SigninEvent {
  final String password;
  SigninPasswordChanged({required this.password});
}

class SigninSubmitted extends SigninEvent {}

class SigninSubmittedGoogle extends SigninEvent {}

class SigninSubmittedFacebook extends SigninEvent {}

class SigninSubmittedLinkedin extends SigninEvent {}

class SigninProfileChange extends SigninEvent {
  final String profile_type;
  SigninProfileChange({required this.profile_type});
}

class SigninFailed extends SigninEvent {}
