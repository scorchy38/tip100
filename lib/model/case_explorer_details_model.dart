class CaseExplorerDetails {
  District? district;
  CourtLink? courtLink;
  List<RespondentPetitioner>? respondentPetitioner;
  int? id;
  String? respondent;
  String? complainant;
  String? complainantLawyer;
  String? respondentLawyer;
  String? dateOfFiling;
  String? dateOfHearing;
  String? cino;
  String? caseNo;
  String? typeName;
  String? courtName;
  int? scrapeType;
  int? scrapedStatus;
  String? stage;
  String? updated;
  String? created;
  String? caseNoNew;
  String? epCaseNo;
  String? hearingDate;
  CourtData? courtData;
  int? disposed;
  String? scrapeCourt;
  List<Hearings>? hearings;
  List<Orders>? orders;
  int? alloted;

  CaseExplorerDetails(
      {this.district,
      this.courtLink,
      this.respondentPetitioner,
      this.id,
      this.respondent,
      this.complainant,
      this.complainantLawyer,
      this.respondentLawyer,
      this.dateOfFiling,
      this.dateOfHearing,
      this.cino,
      this.caseNo,
      this.typeName,
      this.courtName,
      this.scrapeType,
      this.scrapedStatus,
      this.stage,
      this.updated,
      this.created,
      this.caseNoNew,
      this.epCaseNo,
      this.hearingDate,
      this.courtData,
      this.disposed,
      this.scrapeCourt,
      this.hearings,
      this.orders,
      this.alloted});

  CaseExplorerDetails.fromJson(Map<String, dynamic> json) {
    print(json['court_link']);
    if (json['district'].toString() != 'null') {
      district = json.containsKey('district')
          ? District.fromJson(json['district'])
          : null;
    }
    if (json['court_link'].toString() != 'null') {
      courtLink = json.containsKey('court_link')
          ? CourtLink.fromJson(json['court_link'])
          : null;
    }
    if (json['respondent_petitioner'] != null) {
      respondentPetitioner = <RespondentPetitioner>[];
      json['respondent_petitioner'].forEach((v) {
        respondentPetitioner?.add(new RespondentPetitioner.fromJson(v));
      });
    }
    id = json['id'];
    respondent = json['respondent'].toString();
    complainant = json['complainant'].toString();
    complainantLawyer = json['complainant_lawyer'].toString();
    respondentLawyer = json['respondent_lawyer'].toString();
    dateOfFiling = json['date_of_filing'].toString();
    dateOfHearing = json['date_of_hearing'].toString();
    cino = json['cino'].toString();
    caseNo = json['case_no'].toString();
    typeName = json['type_name'].toString();
    courtName = json['court_name'].toString();
    scrapeType = json['scrape_type'];
    scrapedStatus = json['scraped_status'];
    stage = json['stage'].toString();
    updated = json['updated'].toString();
    created = json['created'].toString();
    caseNoNew = json['case_no_new'].toString();
    epCaseNo = json['ep_case_no'].toString();
    hearingDate = json['hearing_date'].toString();
    courtData = (json['court_data'] != null
        ? new CourtData.fromJson(json['court_data'])
        : null)!;
    disposed = json['disposed'];
    scrapeCourt = json['scrape_court'].toString();
    if (json['hearings'] != null) {
      hearings = <Hearings>[];
      json['hearings'].forEach((v) {
        hearings?.add(new Hearings.fromJson(v));
      });
    }
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders?.add(Orders.fromJson(v));
      });
    }
    alloted = json['alloted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.district != null) {
      data['district'] = this.district?.toJson();
    }
    if (this.courtLink != null) {
      data['court_link'] = this.courtLink?.toJson();
    }
    if (this.respondentPetitioner != null) {
      data['respondent_petitioner'] =
          this.respondentPetitioner?.map((v) => v.toJson()).toList();
    }
    data['id'] = this.id;
    data['respondent'] = this.respondent;
    data['complainant'] = this.complainant;
    data['complainant_lawyer'] = this.complainantLawyer;
    data['respondent_lawyer'] = this.respondentLawyer;
    data['date_of_filing'] = this.dateOfFiling;
    data['date_of_hearing'] = this.dateOfHearing;
    data['cino'] = this.cino;
    data['case_no'] = this.caseNo;
    data['type_name'] = this.typeName;
    data['court_name'] = this.courtName;
    data['scrape_type'] = this.scrapeType;
    data['scraped_status'] = this.scrapedStatus;
    data['stage'] = this.stage;
    data['updated'] = this.updated;
    data['created'] = this.created;
    data['case_no_new'] = this.caseNoNew;
    data['ep_case_no'] = this.epCaseNo;
    data['hearing_date'] = this.hearingDate;
    if (this.courtData != null) {
      data['court_data'] = this.courtData?.toJson();
    }
    data['disposed'] = this.disposed;
    data['scrape_court'] = this.scrapeCourt;
    if (this.hearings != null) {
      data['hearings'] = this.hearings?.map((v) => v.toJson()).toList();
    }
    if (this.orders != null) {
      data['orders'] = this.orders?.map((v) => v.toJson()).toList();
    }
    data['alloted'] = this.alloted;
    return data;
  }
}

class District {
  int? id;
  String? state;
  String? districtCourt;

  District({this.id, this.state, this.districtCourt});

  District.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    state = json['state'];
    districtCourt = json['district_court'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['state'] = this.state;
    data['district_court'] = this.districtCourt;
    return data;
  }
}

class CourtLink {
  int? id;
  String? name;
  City? city;

  CourtLink({this.id, this.name, this.city});

  CourtLink.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.city != null) {
      data['city'] = this.city?.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  State? state;

  City({this.id, this.name, this.state});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    state = (json['state'] != null ? new State.fromJson(json['state']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.state != null) {
      data['state'] = this.state?.toJson();
    }
    return data;
  }
}

class State {
  int? id;
  String? name;
  String? region;

  State({this.id, this.name, this.region});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    region = json['region'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['region'] = this.region;
    return data;
  }
}

class RespondentPetitioner {
  String? name;
  bool? respondent;
  String? advocate;
  bool? petitioner;

  RespondentPetitioner(
      {this.name, this.respondent, this.advocate, this.petitioner});

  RespondentPetitioner.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    respondent = json['respondent'];
    advocate = json['advocate'];
    petitioner = json['petitioner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['respondent'] = this.respondent;
    data['advocate'] = this.advocate;
    data['petitioner'] = this.petitioner;
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

class Hearings {
  String? doh;
  String? ndoh;
  String? status;
  String? judge;
  String? causeListType;
  String? proceeding;
  String? court;

  Hearings(
      {this.doh,
      this.ndoh,
      this.status,
      this.judge,
      this.causeListType,
      this.proceeding,
      this.court});

  Hearings.fromJson(Map<String, dynamic> json) {
    doh = json['doh'].toString();
    ndoh = json['ndoh'].toString();
    status = json['status'].toString();
    judge = json['judge'].toString();
    causeListType = json['cause_list_type'].toString();
    proceeding = json['proceeding'].toString();
    court = json['court'].toString();
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

class Orders {
  int? isDeleted;
  int? id;
  String? uploadedBy;
  String? title;
  String? created;
  String? description;
  String? uploadedByName;
  int? docCase;
  String? documentFile;
  int? isPublic;

  Orders(
      {this.isDeleted,
      this.id,
      this.uploadedBy,
      this.title,
      this.created,
      this.description,
      this.uploadedByName,
      this.docCase,
      this.documentFile,
      this.isPublic});

  Orders.fromJson(Map<String, dynamic> json) {
    isDeleted = json['is_deleted'];
    id = json['id'];
    uploadedBy = json['uploaded_by'];
    title = json['title'];
    created = json['created'];
    description = json['description'];
    uploadedByName = json['uploaded_by_name'];
    docCase = json['doc_case'];
    documentFile = json['document_file'];
    isPublic = json['is_public'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_deleted'] = this.isDeleted;
    data['id'] = this.id;
    data['uploaded_by'] = this.uploadedBy;
    data['title'] = this.title;
    data['created'] = this.created;
    data['description'] = this.description;
    data['uploaded_by_name'] = this.uploadedByName;
    data['doc_case'] = this.docCase;
    data['document_file'] = this.documentFile;
    data['is_public'] = this.isPublic;
    return data;
  }
}
