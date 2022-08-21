part of 'signin_bloc.dart';

class SigninState {
  final String username;
  final String password;
  final String profile_type;
  final FormSubmissionStatus formSubmissionStatus;
  SigninState({
    this.username = '',
    this.password = '',
    this.profile_type = 'Personal',
    this.formSubmissionStatus = const InitialFormStatus(),
  });

  SigninState copyWith({
    String? username,
    String? password,
    String? profile_type,
    FormSubmissionStatus? formSubmissionStatus,
  }) {
    return SigninState(
      username: username ?? this.username,
      password: password ?? this.password,
      profile_type: profile_type ?? this.profile_type,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
