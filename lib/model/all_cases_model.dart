Map m = {
  "case_id": 2143513,
  "case_no": "CC/23/2020",
  "title": "test",
  "ndoh": {"status": 1, "date": "2022-06-01", "remarks": "Ongoing"},
  "region": "N",
  "loan_no": null,
  "pdoh": {"status": 2, "date": "2022-05-23", "remarks": "Ongoing"},
  "stage": "Written Statement/ CC - CRIMINAL CASE",
  "client": null,
  "court": "District Consumer Forum Alwar Rajasthan",
  "city": "Delhi",
  "type": "CC - CRIMINAL CASE",
  "court_name": "District Consumer Forum Alwar Rajasthan/ Delhi",
  "case_active": true,
  "activity_status": 2,
  "tracking": true,
  "action": "NA",
  "ticket_active": false,
  "court_data": 0,
  "client_side": null
};

class AllCasesModel {
  int? case_id;
  String? case_no;
  String? title;
  DOH? ndoh;
  String? region;
  String? loan_no;
  DOH? pdoh;
  String? stage;
  String? client;
  String? court;
  String? city;
  String? type;
  String? court_name;
  bool? case_active;
  int? activity_status;
  bool? tracking;
  String? action;
  bool? ticket_active;
  int? court_data;
  String? client_side;

  AllCasesModel(
      {this.title,
      this.court,
      this.ndoh,
      this.pdoh,
      this.type,
      this.city,
      this.action,
      this.activity_status,
      this.case_active,
      this.case_id,
      this.case_no,
      this.client,
      this.client_side,
      this.court_data,
      this.court_name,
      this.loan_no,
      this.region,
      this.stage,
      this.ticket_active,
      this.tracking});

  AllCasesModel.fromJson(Map<String, dynamic> json) {
    case_id = json['case_id'];
    case_no = json['case_no'].toString();
    title = json['title'].toString();
    ndoh = DOH.fromJson(json['ndoh']);
    region = json['region'].toString();
    loan_no = json['loan_no'].toString();
    pdoh = DOH.fromJson(json['pdoh']);
    stage = json['stage'].toString();
    client = json['client'].toString();
    court = json['court'].toString();
    city = json['city'].toString();
    type = json['type'].toString();
    court_name = json['court_name'].toString();
    case_active = json['case_active'];
    activity_status = json['activity_status'];
    tracking = json['tracking'];
    action = json['action'].toString();
    ticket_active = json['ticket_active'];
    court_data = json['court_data'];
    client_side = json['client_side'].toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['case_id'] = this.case_id;
    data['case_no'] = this.case_no;
    data['title'] = this.title;
    data['ndoh'] = this.ndoh?.toJson();
    data['region'] = this.region;
    data['loan_no'] = this.loan_no;
    data['pdoh'] = this.pdoh?.toJson();
    data['stage'] = this.stage;
    data['client'] = this.client;
    data['court'] = this.court;
    data['city'] = this.city;
    data['type'] = this.type;
    data['court_name'] = this.court_name;
    data['case_active'] = this.case_active;
    data['activity_status'] = this.activity_status;
    data['tracking'] = this.tracking;
    data['action'] = this.action;
    data['ticket_active'] = this.ticket_active;
    data['court_data'] = this.court_data;
    data['client_side'] = this.client_side;
    return data;
  }
}

class DOH {
  int? status;
  String? date;
  String? remarks;

  DOH({this.status, this.date, this.remarks});

  DOH.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    date = json['date'].toString();
    remarks = json['remarks'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['status'] = this.status;
    data['date'] = this.date;
    data['remarks'] = this.remarks;
    return data;
  }
}
