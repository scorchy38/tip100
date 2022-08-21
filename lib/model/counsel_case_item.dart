class CounselCaseItem {
  int? caseId;
  String? caseNo;
  String? title;
  Ndoh? ndoh;
  String? region;
  String? loanNo;
  Ndoh? pdoh;
  String? stage;
  String? client;
  String? court;
  String? city;
  String? type;
  String? courtName;
  bool? caseActive;
  int? activityStatus;
  bool? tracking;
  String? action;
  bool? ticketActive;
  int? courtData;
  String? clientSide;

  CounselCaseItem(
      {this.caseId,
      this.caseNo,
      this.title,
      this.ndoh,
      this.region,
      this.loanNo,
      this.pdoh,
      this.stage,
      this.client,
      this.court,
      this.city,
      this.type,
      this.courtName,
      this.caseActive,
      this.activityStatus,
      this.tracking,
      this.action,
      this.ticketActive,
      this.courtData,
      this.clientSide});

  CounselCaseItem.fromJson(Map<String?, dynamic> json) {
    caseId = json['case_id'];
    caseNo = json['case_no'];
    title = json['title'];
    ndoh = json['ndoh'] != null ? new Ndoh.fromJson(json['ndoh']) : null;
    region = json['region'];
    loanNo = json['loan_no'];
    pdoh = json['pdoh'] != null ? new Ndoh.fromJson(json['pdoh']) : null;
    stage = json['stage'];
    client = json['client'];
    court = json['court'];
    city = json['city'];
    type = json['type'];
    courtName = json['court_name'];
    caseActive = json['case_active'];
    activityStatus = json['activity_status'];
    tracking = json['tracking'];
    action = json['action'];
    ticketActive = json['ticket_active'];
    courtData = json['court_data'];
    clientSide = json['client_side'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['case_id'] = this.caseId;
    data['case_no'] = this.caseNo;
    data['title'] = this.title;
    if (this.ndoh != null) {
      data['ndoh'] = this.ndoh?.toJson();
    }
    data['region'] = this.region;
    data['loan_no'] = this.loanNo;
    if (this.pdoh != null) {
      data['pdoh'] = this.pdoh?.toJson();
    }
    data['stage'] = this.stage;
    data['client'] = this.client;
    data['court'] = this.court;
    data['city'] = this.city;
    data['type'] = this.type;
    data['court_name'] = this.courtName;
    data['case_active'] = this.caseActive;
    data['activity_status'] = this.activityStatus;
    data['tracking'] = this.tracking;
    data['action'] = this.action;
    data['ticket_active'] = this.ticketActive;
    data['court_data'] = this.courtData;
    data['client_side'] = this.clientSide;
    return data;
  }
}

class Ndoh {
  int? status;
  String? date;
  String? remarks;

  Ndoh({this.status, this.date, this.remarks});

  Ndoh.fromJson(Map<String?, dynamic> json) {
    status = json['status'];
    date = json['date'];
    remarks = json['remarks'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['status'] = this.status;
    data['date'] = this.date;
    data['remarks'] = this.remarks;
    return data;
  }
}
