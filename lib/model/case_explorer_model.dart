Map m = {
  "id": 202183304,
  "respondent": "DARSHANA DEVI",
  "complainant": "ICICI LOMBARD GENERAL INSURANCE COMPANY LIMITED",
  "date_of_filing": "15 Jun 2022",
  "hearing_date": null,
  "case_no": "203000078912022",
  "scrape_type": 2,
  "scrape_court": "High Court",
  "disposed": 0,
  "stage": "Ongoing",
  "cino": "HPHC010179912022",
  "court_name": "Himachal Pradesh High Court",
  "city": null,
  "state": null,
  "case_type_name1": "CMP - Civil Misc. Petition",
  "court_data": {
    "name": "Himachal Pradesh High Court",
    "district": null,
    "state": null
  },
  "type_name": "CMP",
  "client_type": true,
  "case_status": 0
};

class CaseExplorerModel {
  int? id;
  String? respondent;
  String? complainant;
  String? dateOfFiling;
  String? hearingDate;
  String? caseNo;
  int? scrapeType;
  String? scrapeCourt;
  int? disposed;
  String? stage;
  String? cino;
  String? courtName;
  String? city;
  String? state;
  String? caseTypeName1;
  CourtData? courtData;
  String? typeName;
  bool? clientType;
  int? caseStatus;

  CaseExplorerModel(
      {this.id,
      this.respondent,
      this.complainant,
      this.dateOfFiling,
      this.hearingDate,
      this.caseNo,
      this.scrapeType,
      this.scrapeCourt,
      this.disposed,
      this.stage,
      this.cino,
      this.courtName,
      this.city,
      this.state,
      this.caseTypeName1,
      this.courtData,
      this.typeName,
      this.clientType,
      this.caseStatus});

  CaseExplorerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    respondent = json['respondent'];
    complainant = json['complainant'];
    dateOfFiling = json['date_of_filing'];
    hearingDate = json['hearing_date'];
    caseNo = json['case_no'];
    scrapeType = json['scrape_type'];
    scrapeCourt = json['scrape_court'];
    disposed = json['disposed'];
    stage = json['stage'];
    cino = json['cino'];
    courtName = json['court_name'];
    city = json['city'];
    state = json['state'];
    caseTypeName1 = json['case_type_name1'];
    courtData = json['court_data'] != null
        ? new CourtData.fromJson(json['court_data'])
        : null;
    typeName = json['type_name'];
    clientType = json['client_type'];
    caseStatus = json['case_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['respondent'] = this.respondent;
    data['complainant'] = this.complainant;
    data['date_of_filing'] = this.dateOfFiling;
    data['hearing_date'] = this.hearingDate;
    data['case_no'] = this.caseNo;
    data['scrape_type'] = this.scrapeType;
    data['scrape_court'] = this.scrapeCourt;
    data['disposed'] = this.disposed;
    data['stage'] = this.stage;
    data['cino'] = this.cino;
    data['court_name'] = this.courtName;
    data['city'] = this.city;
    data['state'] = this.state;
    data['case_type_name1'] = this.caseTypeName1;
    if (this.courtData != null) {
      data['court_data'] = this.courtData!.toJson();
    }
    data['type_name'] = this.typeName;
    data['client_type'] = this.clientType;
    data['case_status'] = this.caseStatus;
    return data;
  }
}

class CourtData {
  String? name;
  String? district;
  String? state;

  CourtData({this.name, this.district, this.state});

  CourtData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    district = json['district'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['district'] = this.district;
    data['state'] = this.state;
    return data;
  }
}
