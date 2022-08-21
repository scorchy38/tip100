import 'dart:convert';
import 'dart:developer';

import 'package:tip100/logic/bloc/case_explorer_details_bloc/case_explorer_details_repository.dart';
import 'package:tip100/model/case_explorer_details_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'case_explorer_details_state.dart';
part 'case_explorer_details_event.dart';

class CaseExplorerDetailsBloc
    extends Bloc<CaseExplorerDetailsEvent, CaseExplorerDetailsState> {
  CaseExplorerDetailsBloc({required this.caseExplorerDetailsRepository})
      : super(CaseExplorerDetailsState(
          caseDetails: CaseExplorerDetails(),
          loading: false,
        ));
  final CaseExplorerDetailsRepository caseExplorerDetailsRepository;

  @override
  Stream<CaseExplorerDetailsState> mapEventToState(
    CaseExplorerDetailsEvent event,
  ) async* {
    if (event is RefreshingCaseDetails) {
      print('Hitting refresh with false');
      emit(CaseExplorerDetailsState(
          caseDetails: CaseExplorerDetails(), loading: true));
    }
    if (event is GetCaseExplorerDetails) {
      await caseExplorerDetailsRepository
          .getCaseDetails(event.id)
          .listen((caseDetails) {
        emit(
            CaseExplorerDetailsState(caseDetails: caseDetails, loading: false));
        // log(caseDetails.toJson().toString());
      });
    }
  }
}
