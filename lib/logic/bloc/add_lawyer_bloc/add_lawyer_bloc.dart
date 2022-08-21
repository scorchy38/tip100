import 'dart:async';
import 'dart:io';
import 'package:tip100/logic/bloc/form_submission.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'add_lawyer_event.dart';
part 'add_lawyer_state.dart';

class AddLawyerBloc extends Bloc<AddLawyerEvent, AddLawyerState> {
  AddLawyerBloc() : super(AddLawyerState());

  @override
  Stream<AddLawyerState> mapEventToState(
    AddLawyerEvent event,
  ) async* {
    if (event is AddLawyerInitial) {
      yield AddLawyerState(
        name: event.name,
        number: event.number,
        email: event.email,
        gender: event.gender,
        formSubmissionStatus: event.formSubmissionStatus,
      );
    } else if (event is LawyerEditInitial) {
      yield AddLawyerState.fromMap(event.lawyerToEdit.toMap());
    } else if (event is EventAddName) {
      print(event.name);
      yield state.copyWith(name: event.name);
    } else if (event is EventAddNumber) {
      print(event.number);
      yield state.copyWith(number: event.number);
    } else if (event is EventAddEmail) {
      print(event.email);
      yield state.copyWith(email: event.email);
    } else if (event is EventAddGender) {
      print(event.gender);
      yield state.copyWith(gender: event.gender);
    } else if (event is EventSubmitted) {
      yield state.copyWith(formSubmissionStatus: FormSubmitting());

      try {
        final SharedPreferences _prefs = await SharedPreferences.getInstance();
        print('Adding Lawyer');
        // FormData formData = FormData.fromMap();

        // print(formData.fields);
        Dio dio = Dio();
        dio.options.headers["Authorization"] =
            'JWT ${_prefs.getString('token')}';

        Response response = await dio.post(
            'https://corporate.legistify.com/api/lawyer/add_lawyer/',
            data: {
              'name': state.name,
              'number': state.number,
              'email': state.email,
              'gender': state.gender,
            });
        print(response.data);

        yield state.copyWith(formSubmissionStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(
            formSubmissionStatus: SubmissionFailed(exception: e.toString()));
      }
    } else if (event is EventComplete) {
      yield AddLawyerState();
    }
  }
}
