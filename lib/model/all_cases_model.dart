import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tip100/model/counsel_case_item.dart';

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
  int? view;

  String? case_no;
  String? title;
  DOH? ndoh;
  String? region;
  String? loan_no;
  DOH? pdoh;
  String? stage;
  String? client;
  String? court;
  int? city;
  String? type;
  String? court_name;
  bool? case_active;
  int? activity_status;
  bool? tracking;
  String? action;
  bool? ticket_active;
  int? court_data;
  String? client_side;
  Timestamp? dateOfIncident;
  List? mediaURL;

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
      this.mediaURL,
      this.dateOfIncident,
      this.tracking,
      this.view});

  AllCasesModel.fromJson(Map<String, dynamic> json) {
    case_id = json['index'];
    case_no = json['crimeType'].toString();
    title = json['address'].toString();
    ndoh = DOH(status: 10, date: "", remarks: "");
    region = "null";
    loan_no = "null";
    pdoh = DOH(status: 10, date: "", remarks: "");
    stage = json['crimeTime'].toString();
    client = "null";
    court = json['description'].toString();
    city = json['isAlert'];
    type = "null";
    court_name = json['description'].toString();
    mediaURL = json['mediaURL'];
    view = json['view'];
    dateOfIncident =
        Timestamp.fromMillisecondsSinceEpoch(int.parse(json['dateOfIncident']));
    case_active = true;
    activity_status = 10;
    tracking = true;
    action = "null";
    ticket_active = true;
    court_data = 20;
    client_side = "null";
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['case_id'] = this.case_id;
    data['case_no'] = this.case_no;
    data['title'] = this.title;
    data['view'] = this.view;

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
    data['dateOfIncident'] =
        this.dateOfIncident!.millisecondsSinceEpoch.toString();
    data['case_active'] = this.case_active;
    data['activity_status'] = this.activity_status;
    data['tracking'] = this.tracking;
    data['action'] = this.action;
    data['ticket_active'] = this.ticket_active;
    data['court_data'] = this.court_data;
    data['client_side'] = this.client_side;
    data['mediaURL'] = this.mediaURL;
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
