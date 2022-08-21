import 'dart:convert';
import 'dart:developer';

import 'package:tip100/model/activity_log_item_model.dart';
import 'package:tip100/model/all_cases_details_model.dart';
import 'package:tip100/model/case_explorer_details_model.dart';
import 'package:tip100/model/doc_storage_item.dart';
import 'package:tip100/model/hearing_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/task_model.dart';
import 'all_cases_details_repository.dart';

part 'all_cases_details_state.dart';
part 'all_cases_details_event.dart';

class AllCasesDetailsBloc
    extends Bloc<AllCasesDetailsEvent, AllCasesDetailsState> {
  AllCasesDetailsBloc({required this.allCasesDetailsRepository})
      : super(AllCasesDetailsState(
            caseDetails: AllCasesDetails(),
            loading: true,
            activityLog: [],
            activityLogLoading: true,
            docStorageItems: [],
            docStorageLoading: true,
            manualHearings: [],
            manualHearingsLoading: true,
            automaticHearings: [],
            automaticHearingsLoading: true,
            tasks: [],
            tasksLoading: true));
  final AllCasesDetailsRepository allCasesDetailsRepository;

  @override
  Stream<AllCasesDetailsState> mapEventToState(
    AllCasesDetailsEvent event,
  ) async* {
    if (event is RefreshingCaseDetails) {
      print('Hitting refresh with false');
      emit(AllCasesDetailsState(
          caseDetails: AllCasesDetails(),
          loading: true,
          activityLog: [],
          activityLogLoading: true,
          docStorageItems: [],
          docStorageLoading: true,
          manualHearings: [],
          manualHearingsLoading: true,
          automaticHearings: [],
          automaticHearingsLoading: true,
          tasks: [],
          tasksLoading: true));
    }
    if (event is GetAllCasesDetails) {
      await allCasesDetailsRepository
          .getCaseDetails(event.id)
          .listen((caseDetails) {
        emit(AllCasesDetailsState(
            caseDetails: caseDetails,
            loading: false,
            activityLog: state.activityLog,
            activityLogLoading: state.activityLogLoading,
            docStorageItems: state.docStorageItems,
            docStorageLoading: state.docStorageLoading,
            manualHearings: state.manualHearings,
            manualHearingsLoading: state.manualHearingsLoading,
            automaticHearings: state.automaticHearings,
            automaticHearingsLoading: state.automaticHearingsLoading,
            tasks: state.tasks,
            tasksLoading: state.tasksLoading));
        log('Case Details Updated');
        log(state.toJson().toString());
      });
    } else if (event is GetCaseActivityLog) {
      await allCasesDetailsRepository
          .getActivityLog(event.id)
          .listen((activityLog) {
        //=====
        // allCasesDetailsRepository
        //     .getDocStorageItems(event.id)
        //     .listen((docStorage) {
        //   allCasesDetailsRepository
        //       .getManualHearings(event.id)
        //       .listen((manualHearings) {
        emit(AllCasesDetailsState(
            caseDetails: state.caseDetails,
            loading: state.loading,
            docStorageItems: state.docStorageItems,
            docStorageLoading: state.docStorageLoading,
            activityLogLoading: false,
            activityLog: activityLog,
            manualHearings: state.manualHearings,
            manualHearingsLoading: state.manualHearingsLoading,
            automaticHearings: state.automaticHearings,
            automaticHearingsLoading: state.automaticHearingsLoading,
            tasks: state.tasks,
            tasksLoading: state.tasksLoading));
        log('Activity Log Updated');
        log(state.toJson().toString());
        //   });
        // });
        //=====
        // emit(AllCasesDetailsState(
        //     caseDetails: state.caseDetails,
        //     loading: state.loading,
        //     docStorageItems: state.docStorageItems,
        //     docStorageLoading: state.docStorageLoading,
        //     activityLogLoading: false,
        //     activityLog: activityLog));
        // log('Activity Log Updated');
        // log(state.toJson().toString());
      });
    } else if (event is GetDocStorageItems) {
      await allCasesDetailsRepository
          .getDocStorageItems(event.id)
          .listen((docStorageItems) {
        emit(AllCasesDetailsState(
            caseDetails: state.caseDetails,
            loading: state.loading,
            docStorageItems: docStorageItems,
            docStorageLoading: false,
            activityLogLoading: state.activityLogLoading,
            activityLog: state.activityLog,
            manualHearingsLoading: state.manualHearingsLoading,
            manualHearings: state.manualHearings,
            automaticHearings: state.automaticHearings,
            automaticHearingsLoading: state.automaticHearingsLoading,
            tasks: state.tasks,
            tasksLoading: state.tasksLoading));
        log('Doc Storage Updated');
        log(docStorageItems.toString());
        log(state.docStorageItems.toString());
        log(state.toJson().toString());
      });
    } else if (event is GetManualHearings) {
      await allCasesDetailsRepository
          .getManualHearings(event.id)
          .listen((manualHearings) {
        emit(AllCasesDetailsState(
            caseDetails: state.caseDetails,
            loading: state.loading,
            docStorageItems: state.docStorageItems,
            docStorageLoading: state.docStorageLoading,
            activityLogLoading: state.activityLogLoading,
            activityLog: state.activityLog,
            manualHearingsLoading: false,
            manualHearings: manualHearings,
            automaticHearings: state.automaticHearings,
            automaticHearingsLoading: state.automaticHearingsLoading,
            tasks: state.tasks,
            tasksLoading: state.tasksLoading));
      });
    } else if (event is GetAutomaticHearings) {
      await allCasesDetailsRepository
          .getAutomaticHearings(event.id)
          .listen((automaticHearings) {
        emit(AllCasesDetailsState(
            caseDetails: state.caseDetails,
            loading: state.loading,
            docStorageItems: state.docStorageItems,
            docStorageLoading: state.docStorageLoading,
            activityLogLoading: state.activityLogLoading,
            activityLog: state.activityLog,
            manualHearingsLoading: state.manualHearingsLoading,
            manualHearings: state.manualHearings,
            automaticHearings: automaticHearings,
            automaticHearingsLoading: false,
            tasks: state.tasks,
            tasksLoading: state.tasksLoading));
      });
    } else if (event is GetTasks) {
      await allCasesDetailsRepository.getTasks(event.id).listen((tasks) {
        emit(AllCasesDetailsState(
            caseDetails: state.caseDetails,
            loading: state.loading,
            docStorageItems: state.docStorageItems,
            docStorageLoading: state.docStorageLoading,
            activityLogLoading: state.activityLogLoading,
            activityLog: state.activityLog,
            manualHearingsLoading: state.manualHearingsLoading,
            manualHearings: state.manualHearings,
            automaticHearings: state.automaticHearings,
            automaticHearingsLoading: state.automaticHearingsLoading,
            tasks: tasks,
            tasksLoading: false));
      });
    }
  }
}
