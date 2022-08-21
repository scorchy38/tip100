class CounselDetail {
  int? id;
  String? name;
  String? email;
  String? barId;
  String? address;
  String? link;
  int? city;
  String? organisationName;
  int? addedBy;
  bool? lawyerActive;
  int? organisation;
  int? pinCode;
  String? practiceSince;
  List<String?>? legalArea;
  List<int?>? courts;
  String? number;
  String? gender;
  String? expYear;
  String? region;
  String? pref;
  String? secondaryNumber;
  String? slug;
  String? genderName;
  String? verify;
  BankDetails? bankDetails;
  List<KycDetails?>? kycDetails;
  int? editCheck;
  int? editCheckBank;
  List<El?>? el;
  String? urlIframe;

  CounselDetail(
      {this.id,
      this.name,
      this.email,
      this.barId,
      this.address,
      this.link,
      this.city,
      this.organisationName,
      this.addedBy,
      this.lawyerActive,
      this.organisation,
      this.pinCode,
      this.practiceSince,
      this.legalArea,
      this.courts,
      this.number,
      this.gender,
      this.expYear,
      this.region,
      this.pref,
      this.secondaryNumber,
      this.slug,
      this.genderName,
      this.verify,
      this.bankDetails,
      this.kycDetails,
      this.editCheck,
      this.editCheckBank,
      this.el,
      this.urlIframe});

  CounselDetail.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    barId = json['bar_id'];
    address = json['address'];
    link = json['link'];
    city = json['city'];
    organisationName = json['organisation_name'];
    addedBy = json['added_by'];
    lawyerActive = json['lawyer_active'];
    organisation = json['organisation'];
    pinCode = json['pin_code'];
    practiceSince = json['practice_since'];
    legalArea = json['legal_area'].cast<String?>();
    courts = json['courts'].cast<int?>();
    number = json['number'];
    gender = json['gender'];
    expYear = json['exp_year'];
    region = json['region'];
    pref = json['pref'];
    secondaryNumber = json['secondary_number'];
    slug = json['slug'];
    genderName = json['gender_name'];
    verify = json['verify'];
    bankDetails = json['bank_details'] != null
        ? new BankDetails.fromJson(json['bank_details'])
        : null;
    if (json['kyc_details'] != null) {
      kycDetails = <KycDetails>[];
      json['kyc_details'].forEach((v) {
        kycDetails?.add(new KycDetails.fromJson(v));
      });
    }
    editCheck = json['edit_check'];
    editCheckBank = json['edit_check_bank'];
    if (json['el'] != null) {
      el = <El>[];
      json['el'].forEach((v) {
        el?.add(new El.fromJson(v));
      });
    }
    urlIframe = json['url_iframe'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['bar_id'] = this.barId;
    data['address'] = this.address;
    data['link'] = this.link;
    data['city'] = this.city;
    data['organisation_name'] = this.organisationName;
    data['added_by'] = this.addedBy;
    data['lawyer_active'] = this.lawyerActive;
    data['organisation'] = this.organisation;
    data['pin_code'] = this.pinCode;
    data['practice_since'] = this.practiceSince;
    data['legal_area'] = this.legalArea;
    data['courts'] = this.courts;
    data['number'] = this.number;
    data['gender'] = this.gender;
    data['exp_year'] = this.expYear;
    data['region'] = this.region;
    data['pref'] = this.pref;
    data['secondary_number'] = this.secondaryNumber;
    data['slug'] = this.slug;
    data['gender_name'] = this.genderName;
    data['verify'] = this.verify;
    if (this.bankDetails != null) {
      data['bank_details'] = this.bankDetails?.toJson();
    }
    if (this.kycDetails != null) {
      data['kyc_details'] = this.kycDetails?.map((v) => v?.toJson()).toList();
    }
    data['edit_check'] = this.editCheck;
    data['edit_check_bank'] = this.editCheckBank;
    if (this.el != null) {
      data['el'] = this.el?.map((v) => v?.toJson()).toList();
    }
    data['url_iframe'] = this.urlIframe;
    return data;
  }
}

class BankDetails {
  int? id;
  String? created;
  String? modified;
  bool? isActive;
  bool? isDeleted;
  String? beneficiaryName;
  int? accountNumber;
  String? branchName;
  String? bankName;
  String? ifsc;
  String? micr;
  int? lawyer;

  BankDetails(
      {this.id,
      this.created,
      this.modified,
      this.isActive,
      this.isDeleted,
      this.beneficiaryName,
      this.accountNumber,
      this.branchName,
      this.bankName,
      this.ifsc,
      this.micr,
      this.lawyer});

  BankDetails.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    created = json['created'];
    modified = json['modified'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    beneficiaryName = json['beneficiary_name'];
    accountNumber = json['account_number'];
    branchName = json['branch_name'];
    bankName = json['bank_name'];
    ifsc = json['ifsc'];
    micr = json['micr'];
    lawyer = json['lawyer'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['beneficiary_name'] = this.beneficiaryName;
    data['account_number'] = this.accountNumber;
    data['branch_name'] = this.branchName;
    data['bank_name'] = this.bankName;
    data['ifsc'] = this.ifsc;
    data['micr'] = this.micr;
    data['lawyer'] = this.lawyer;
    return data;
  }
}

class KycDetails {
  int? id;
  String? created;
  int? lawyer;
  String? type;
  String? file;
  String? docLink;
  String? filename;

  KycDetails(
      {this.id,
      this.created,
      this.lawyer,
      this.type,
      this.file,
      this.docLink,
      this.filename});

  KycDetails.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    created = json['created'];
    lawyer = json['lawyer'];
    type = json['type'];
    file = json['file'];
    docLink = json['doc_link'];
    filename = json['filename'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['created'] = this.created;
    data['lawyer'] = this.lawyer;
    data['type'] = this.type;
    data['file'] = this.file;
    data['doc_link'] = this.docLink;
    data['filename'] = this.filename;
    return data;
  }
}

class El {
  int? id;
  String? name;
  String? email;
  City? city;
  List<Court>? court;
  String? number;
  int? exp;
  String? exps;
  bool? lawyerActive;
  Organization? organization;

  El(
      {this.id,
      this.name,
      this.email,
      this.city,
      this.court,
      this.number,
      this.exp,
      this.exps,
      this.lawyerActive,
      this.organization});

  El.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    if (json['court'] != null) {
      court = <Court>[];
      json['court'].forEach((v) {
        court?.add(new Court.fromJson(v));
      });
    }
    number = json['number'];
    exp = json['exp'];
    exps = json['exps'];
    lawyerActive = json['lawyer_active'];
    organization = json['organization'] != null
        ? new Organization.fromJson(json['organization'])
        : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.city != null) {
      data['city'] = this.city?.toJson();
    }
    if (this.court != null) {
      data['court'] = this.court?.map((v) => v.toJson()).toList();
    }
    data['number'] = this.number;
    data['exp'] = this.exp;
    data['exps'] = this.exps;
    data['lawyer_active'] = this.lawyerActive;
    if (this.organization != null) {
      data['organization'] = this.organization?.toJson();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  int? stateId;
  String? stateName;

  City({this.id, this.name, this.stateId, this.stateName});

  City.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
    stateName = json['state_name'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    return data;
  }
}

class Court {
  int? id;
  String? name;

  Court({this.id, this.name});

  Court.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Organization {
  int? id;
  int? ongoingCase;
  int? ongoingNotice;
  int? disposedCase;
  int? disposedNotice;
  int? totalRating;
  int? totalRatedMatters;
  int? finalRating;
  double? portfolio;
  int? totalCases;
  int? totalNotices;
  int? total;

  Organization(
      {this.id,
      this.ongoingCase,
      this.ongoingNotice,
      this.disposedCase,
      this.disposedNotice,
      this.totalRating,
      this.totalRatedMatters,
      this.finalRating,
      this.portfolio,
      this.totalCases,
      this.totalNotices,
      this.total});

  Organization.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    ongoingCase = json['ongoing_case'];
    ongoingNotice = json['ongoing_notice'];
    disposedCase = json['disposed_case'];
    disposedNotice = json['disposed_notice'];
    totalRating = json['total_rating'];
    totalRatedMatters = json['total_rated_matters'];
    finalRating = json['final_rating'];
    portfolio = json['portfolio'];
    totalCases = json['total_cases'];
    totalNotices = json['total_notices'];
    total = json['total'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['ongoing_case'] = this.ongoingCase;
    data['ongoing_notice'] = this.ongoingNotice;
    data['disposed_case'] = this.disposedCase;
    data['disposed_notice'] = this.disposedNotice;
    data['total_rating'] = this.totalRating;
    data['total_rated_matters'] = this.totalRatedMatters;
    data['final_rating'] = this.finalRating;
    data['portfolio'] = this.portfolio;
    data['total_cases'] = this.totalCases;
    data['total_notices'] = this.totalNotices;
    data['total'] = this.total;
    return data;
  }
}
