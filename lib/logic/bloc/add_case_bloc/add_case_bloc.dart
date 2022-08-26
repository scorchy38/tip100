import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:tip100/logic/bloc/form_submission.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'add_case_event.dart';
part 'add_case_state.dart';

class AddCaseBloc extends Bloc<AddCaseEvent, AddCaseState> {
  AddCaseBloc() : super(AddCaseState());

  @override
  Stream<AddCaseState> mapEventToState(
    AddCaseEvent event,
  ) async* {
    if (event is AddCaseInitial) {
      yield AddCaseState(
        priority: event.priority,
        case_type: event.case_type,
        title: event.title,
        court: event.court,
        city: event.city,
        description: event.description,
        is_alloted: event.is_alloted,
        formSubmissionStatus: event.formSubmissionStatus,
      );
    } else if (event is CaseEditInitial) {
      yield AddCaseState.fromMap(event.caseToEdit.toMap());
    } else if (event is EventAddPriority) {
      print(event.priority);
      yield state.copyWith(priority: event.priority);
    } else if (event is EventAddCaseType) {
      print(event.case_type);
      yield state.copyWith(case_type: event.case_type);
    } else if (event is EventAddTitle) {
      print(event.title);
      yield state.copyWith(title: event.title);
    } else if (event is EventAddCourt) {
      print(event.court);
      yield state.copyWith(court: event.court);
    } else if (event is EventAddCity) {
      print(event.city);
      yield state.copyWith(city: event.city);
    } else if (event is EventAddCrimeType) {
      print(event.crimeType);
      yield state.copyWith(crimeType: event.crimeType);
    } else if (event is EventAddDescription) {
      print(event.description);
      yield state.copyWith(description: event.description);
    } else if (event is EventToggleIsAlloted) {
      print(event.is_alloted);
      yield state.copyWith(is_alloted: event.is_alloted);
    } else if (event is EventSubmitted) {
      yield state.copyWith(formSubmissionStatus: FormSubmitting());

      try {
        final SharedPreferences _prefs = await SharedPreferences.getInstance();
        print('Adding Case');
        log(state.priority);
        log(state.case_type.toString());
        log(state.city.toString());
        log(state.court.toString());

        // print(formData.fields);
        Dio dio = Dio();
        // dio.options.headers["Authorization"] =
        //     'JWT ${_prefs.getString('token')}';
        print({
          "crimeType": state.description,
          "description": event.description,
          "mediaURL": [event.fileRef],
          "urgency": state.priority,
          "crimeTime": state.title,
          "dateOfIncident": event.dateOfIncident,
          "score": "0",
          "uid": "${_prefs.getString('token')}",
          "address": event.location
        });
        Response response =
            await dio.post('https://tip100.herokuapp.com/addTip', data: {
          "crimeType": state.description,
          "description": event.description,
          "mediaURL": [event.fileRef],
          "urgency": state.priority,
          "crimeTime": state.title,
          "dateOfIncident": event.dateOfIncident,
          "score": "0",
          "uid": "${_prefs.getString('token')}",
          "address": event.location
        });
        print(response.data);

        yield state.copyWith(formSubmissionStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(
            formSubmissionStatus: SubmissionFailed(exception: e.toString()));
      }
    } else if (event is EventComplete) {
      yield AddCaseState();
    }
  }
}
