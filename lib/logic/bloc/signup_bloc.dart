import 'dart:convert';

import 'package:tip100/logic/bloc/singin_repository.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import 'form_submission.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignUpState> {
  final SigninRepository signinRepository;
  SignupBloc({required this.signinRepository}) : super(SignUpState());

  @override
  Stream<SignUpState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is SignupUserNameChanged) {
      yield state.copyWith(username: event.username);
    } else if (event is SignupPasswordChanged) {
      yield state.copyWith(password: event.password);
    } else if (event is SignupSubmitted) {
      print("Ww");
      yield state.copyWith(formSubmissionStatus: FormSubmitting());
      dynamic res =
          await signinRepository.createUser(state.username, state.password);

      // if (res is UserCredential) {
      //   yield state.copyWith(formSubmissionStatus: SubmissionSuccess());
      // } else {
      //   yield state.copyWith(
      //       formSubmissionStatus: SubmissionFailed(exception: res.toString()));
      // }

      // if (res == "success") {
      //   yield state.copyWith(formSubmissionStatus: SubmissionSuccess());
      // } else {
      //   yield state.copyWith(
      //       formSubmissionStatus: SubmissionFailed(exception: res));
      // }
    } else if (event is SignupProfileChange) {
      yield state.copyWith(profile_type: event.profile_type);
    } else if (event is SignupFailed) {
      yield state.copyWith(formSubmissionStatus: FormSubmitNow());
    } else if (event is SignupVerificationChange) {
      yield state.copyWith(verified: event.verfied);
    }
  }
}
