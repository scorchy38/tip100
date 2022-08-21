import 'dart:convert';
import 'dart:developer';

import 'package:tip100/logic/bloc/my_counsel_details_bloc/my_counsel_details_repository.dart';
import 'package:tip100/model/activity_log_item_model.dart';
import 'package:tip100/model/all_cases_details_model.dart';
import 'package:tip100/model/case_explorer_details_model.dart';
import 'package:tip100/model/counsel_case_item.dart';
import 'package:tip100/model/counsel_details_model.dart';
import 'package:tip100/model/counsel_doc_storage_item.dart';
import 'package:tip100/model/counsel_notice_item.dart';
import 'package:tip100/model/doc_storage_item.dart';
import 'package:tip100/model/hearing_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/task_model.dart';

part 'my_counsel_details_state.dart';
part 'my_counsel_details_event.dart';

class MyCounselDetailsBloc
    extends Bloc<MyCounselDetailsEvent, MyCounselDetailsState> {
  MyCounselDetailsBloc({required this.myCounselDetailsRepository})
      : super(MyCounselDetailsState(
            counselDetails: CounselDetail(),
            loading: true,
            caseItems: [],
            casesLoading: true,
            docStorageItems: [],
            docStorageLoading: true,
            noticeItems: [],
            noticesLoading: true));
  final MyCounselDetailsRepository myCounselDetailsRepository;

  @override
  Stream<MyCounselDetailsState> mapEventToState(
    MyCounselDetailsEvent event,
  ) async* {
    if (event is RefreshingCounselDetails) {
      print('Hitting refresh with false');
      emit(MyCounselDetailsState(
          counselDetails: CounselDetail(),
          loading: true,
          caseItems: [],
          casesLoading: true,
          docStorageItems: [],
          docStorageLoading: true,
          noticeItems: [],
          noticesLoading: true));
    }
    if (event is GetMyCounselDetails) {
      await myCounselDetailsRepository
          .getCounselDetails(event.id)
          .listen((counselDetails) {
        emit(MyCounselDetailsState(
            counselDetails: counselDetails,
            loading: false,
            caseItems: state.caseItems,
            casesLoading: state.casesLoading,
            docStorageItems: state.docStorageItems,
            docStorageLoading: state.docStorageLoading,
            noticeItems: state.noticeItems,
            noticesLoading: state.noticesLoading));
        log('Case Details Updated');
        log(state.toJson().toString());
      });
    } else if (event is GetCaseItems) {
      await myCounselDetailsRepository
          .getCaseItems(event.id)
          .listen((caseItems) {
        //=====
        // allCasesDetailsRepository
        //     .getDocStorageItems(event.id)
        //     .listen((docStorage) {
        //   allCasesDetailsRepository
        //       .getManualHearings(event.id)
        //       .listen((manualHearings) {
        emit(MyCounselDetailsState(
            counselDetails: state.counselDetails,
            loading: state.loading,
            docStorageItems: state.docStorageItems,
            docStorageLoading: state.docStorageLoading,
            casesLoading: false,
            caseItems: caseItems,
            noticesLoading: state.noticesLoading,
            noticeItems: state.noticeItems));
        log('Activity Log Updated');
        log(state.toJson().toString());
        //   });
        // });
        //=====
        // emit(MyCounselDetailsState(
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
      await myCounselDetailsRepository
          .getDocStorageItems(event.id)
          .listen((docStorageItems) {
        emit(MyCounselDetailsState(
            counselDetails: state.counselDetails,
            loading: state.loading,
            docStorageItems: docStorageItems,
            docStorageLoading: false,
            caseItems: state.caseItems,
            casesLoading: state.casesLoading,
            noticeItems: state.noticeItems,
            noticesLoading: state.noticesLoading));
        log('Doc Storage Updated');
        log(docStorageItems.toString());
        log(state.docStorageItems.toString());
        log(state.toJson().toString());
      });
    } else if (event is GetNoticeItems) {
      await myCounselDetailsRepository
          .getNoticeItems(event.id)
          .listen((notices) {
        emit(MyCounselDetailsState(
            counselDetails: state.counselDetails,
            loading: state.loading,
            docStorageItems: state.docStorageItems,
            docStorageLoading: state.docStorageLoading,
            casesLoading: state.casesLoading,
            caseItems: state.caseItems,
            noticesLoading: false,
            noticeItems: notices));
      });
    }
  }
}
