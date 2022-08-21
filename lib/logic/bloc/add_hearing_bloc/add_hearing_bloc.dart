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
import 'package:http/http.dart' as http;

part 'add_hearing_event.dart';
part 'add_hearing_state.dart';

class AddHearingBloc extends Bloc<AddHearingEvent, AddHearingState> {
  AddHearingBloc() : super(AddHearingState());

  @override
  Stream<AddHearingState> mapHearingToState(
    AddHearingEvent event,
  ) async* {
    if (event is AddHearingInitial) {
      yield AddHearingState(
        date_of_hearing: event.date_of_hearing,
        hearing_status: event.hearing_status,
        title: event.title,
        hearing_stage: event.hearing_stage,
        caseId: event.caseId,
        hearing_description: event.hearing_description,
        formSubmissionStatus: event.formSubmissionStatus,
      );
    } else if (event is HearingEditInitial) {
      yield AddHearingState.fromMap(event.caseToEdit.toMap());
    } else if (event is EventAddDateOfHearing) {
      print(event.date_of_hearing);
      yield state.copyWith(date_of_hearing: event.date_of_hearing);
    } else if (event is EventAddCaseId) {
      print(event.caseId);
      yield state.copyWith(caseId: event.caseId);
    } else if (event is EventAddHearingStatus) {
      print(event.hearing_status);
      yield state.copyWith(hearing_status: event.hearing_status);
    } else if (event is EventAddTitle) {
      print(event.title);
      yield state.copyWith(title: event.title);
    } else if (event is EventAddHearingStage) {
      print(event.hearing_stage);
      yield state.copyWith(hearing_stage: event.hearing_stage);
    } else if (event is EventAddHearingDescription) {
      print(event.hearing_description);
      yield state.copyWith(hearing_description: event.hearing_description);
    } else if (event is EventSubmitted) {
      yield state.copyWith(formSubmissionStatus: FormSubmitting());

      try {
        final SharedPreferences _prefs = await SharedPreferences.getInstance();

        print(state.date_of_hearing);
        print(state.title);
        print(state.hearing_status);
        print(state.hearing_stage);
        print(state.hearing_description);
        var headers = {
          'Accept': 'application/json, text/plain, */*',
          'Authorization': 'JWT ${_prefs.getString('token')}',
          'Connection': 'keep-alive',
          'Content-Type': 'application/json',
          'Accept-Encoding': 'gzip',
        };

        print(
            '{"title":${state.title},"date_of_hearing":${state.date_of_hearing},"hearing_status":${state.hearing_status},"hearing_stage":${state.hearing_stage},"hearing_description":${state.hearing_description}}');
        var data =
            '{"title":"${state.title}","date_of_hearing":"${state.date_of_hearing}","hearing_status":"${state.hearing_status}","hearing_stage":${state.hearing_stage},"hearing_description":"${state.hearing_description}"}';

        var url = Uri.parse(
            'https://corporate.legistify.com/api/case/${state.caseId}/hearings/');
        var res = await http.post(url, headers: headers, body: data);
        if (res.statusCode != 201)
          throw Exception('http.post error: statusCode= ${res.statusCode}');
        print(res.body);
        print('Adding Hearing');
        print(res.body);

        yield state.copyWith(formSubmissionStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(
            formSubmissionStatus: SubmissionFailed(exception: e.toString()));
      }
    } else if (event is EventComplete) {
      yield AddHearingState();
    }
  }
}
