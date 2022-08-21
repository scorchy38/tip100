class ManualHearing {
  bool? isUpcoming;
  int? hearingCaseId;
  String? caseNo;
  int? id;
  int? hearingStage;
  String? title;
  String? dateOfHearing;
  String? hearingStatus;
  String? hearingStatusName;
  String? hearingDescription;
  String? caseTitle;
  String? hearingUpdate;
  String? hearingStageName;
  int? hearingCase;
  bool? isDeleted;
  int? createdBy;

  ManualHearing(
      {this.isUpcoming,
      this.hearingCaseId,
      this.caseNo,
      this.id,
      this.hearingStage,
      this.title,
      this.dateOfHearing,
      this.hearingStatus,
      this.hearingStatusName,
      this.hearingDescription,
      this.caseTitle,
      this.hearingUpdate,
      this.hearingStageName,
      this.hearingCase,
      this.isDeleted,
      this.createdBy});

  ManualHearing.fromJson(Map<String?, dynamic> json) {
    isUpcoming = json['is_upcoming'];
    hearingCaseId = json['hearing_case_id'];
    caseNo = json['case_no'];
    id = json['id'];
    hearingStage = json['hearing_stage'];
    title = json['title'];
    dateOfHearing = json['date_of_hearing'];
    hearingStatus = json['hearing_status'];
    hearingStatusName = json['hearing_status_name'];
    hearingDescription = json['hearing_description'];
    caseTitle = json['case_title'];
    hearingUpdate = json['hearing_update'];
    hearingStageName = json['hearing_stage_name'];
    hearingCase = json['hearing_case'];
    isDeleted = json['is_deleted'];
    createdBy = json['created_by'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['is_upcoming'] = this.isUpcoming;
    data['hearing_case_id'] = this.hearingCaseId;
    data['case_no'] = this.caseNo;
    data['id'] = this.id;
    data['hearing_stage'] = this.hearingStage;
    data['title'] = this.title;
    data['date_of_hearing'] = this.dateOfHearing;
    data['hearing_status'] = this.hearingStatus;
    data['hearing_status_name'] = this.hearingStatusName;
    data['hearing_description'] = this.hearingDescription;
    data['case_title'] = this.caseTitle;
    data['hearing_update'] = this.hearingUpdate;
    data['hearing_stage_name'] = this.hearingStageName;
    data['hearing_case'] = this.hearingCase;
    data['is_deleted'] = this.isDeleted;
    data['created_by'] = this.createdBy;
    return data;
  }
}

class AutomaticHearing {
  String? doh;
  String? ndoh;
  String? status;
  String? judge;
  String? causeListType;
  String? proceeding;
  String? court;

  AutomaticHearing(
      {this.doh,
      this.ndoh,
      this.status,
      this.judge,
      this.causeListType,
      this.proceeding,
      this.court});

  AutomaticHearing.fromJson(Map<String, dynamic> json) {
    doh = json['doh'];
    ndoh = json['ndoh'];
    status = json['status'];
    judge = json['judge'];
    causeListType = json['cause_list_type'].toString();
    proceeding = json['proceeding'].toString();
    court = json['court'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doh'] = this.doh;
    data['ndoh'] = this.ndoh;
    data['status'] = this.status;
    data['judge'] = this.judge;
    data['cause_list_type'] = this.causeListType;
    data['proceeding'] = this.proceeding;
    data['court'] = this.court;
    return data;
  }
}
