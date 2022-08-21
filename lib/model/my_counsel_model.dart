Map m = {
  "id": 7966,
  "name": "Himanshu Bhandari",
  "email": "himanshu.bhandari@legistify.com",
  "city": {
    "id": 5021,
    "name": "Noida",
    "state_id": 34,
    "state_name": "Uttar Pradesh"
  },
  "court": [
    {"id": 79, "name": "District Consumer Forum North Delhi"},
    {"id": 869, "name": "Noida District Forum"},
    {"id": 892, "name": "Greater Noida District Court"},
    {"id": 946, "name": "District Consumer Forum South Delhi"}
  ],
  "number": "8800366374",
  "exp": 5,
  "exps": "5 Years",
  "lawyer_active": true,
  "organization": {
    "id": 19,
    "ongoing_case": 0,
    "ongoing_notice": 0,
    "disposed_case": 0,
    "disposed_notice": 0,
    "total_rating": 0,
    "total_rated_matters": 0,
    "final_rating": 0,
    "portfolio": 0.0,
    "total_cases": 0,
    "total_notices": 0,
    "total": 0
  }
};

class MyCounselModel {
  int? id;
  String? name;
  String? email;
  Map? city;
  List? court;
  String? number;
  int? exp;
  String? exps;
  bool? lawyer_active;
  Organization? organization;

  MyCounselModel({
    this.id,
    this.name,
    this.email,
    this.city,
    this.court,
    this.number,
    this.exp,
    this.exps,
    this.lawyer_active,
    this.organization,
  });

  MyCounselModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    city = json['city'];
    court = json['court'];
    number = json['number'];
    exp = json['exp'];
    exps = json['exps'].toString();
    lawyer_active = json['lawyer_active'];

    organization = Organization.fromJson(json['organization']);
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['city'] = this.city;
    data['court'] = this.court;
    data['number'] = this.number;
    data['exp'] = this.exp;
    data['exps'] = this.exps.toString();
    data['lawyer_active'] = this.lawyer_active;
    data['organization'] = this.organization?.toJson();
    return data;
  }
}

class Organization {
  int? id;
  int? ongoing_case;
  int? ongoing_notice;
  int? disposed_case;
  int? disposed_notice;
  int? total_rating;
  int? total_rated_matters;
  int? final_rating;
  double? portfolio;
  int? total_cases;
  int? total_notices;
  int? total;

  Organization(
      {this.id,
      this.ongoing_case,
      this.ongoing_notice,
      this.disposed_case,
      this.disposed_notice,
      this.total_rating,
      this.total_rated_matters,
      this.final_rating,
      this.portfolio,
      this.total,
      this.total_cases,
      this.total_notices});

  Organization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ongoing_case = json['ongoing_case'];
    ongoing_notice = json['ongoing_notice'];
    disposed_case = json['disposed_case'];
    disposed_notice = json['disposed_notice'];
    total_rating = json['total_rating'];
    total_rated_matters = json['total_rated_matters'];
    final_rating = json['final_rating'];
    portfolio = json['portfolio'];
    total_cases = json['total_cases'];
    total_notices = json['total_notices'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['ongoing_case'] = this.ongoing_case;
    data['ongoing_notice'] = this.ongoing_notice;
    data['disposed_case'] = this.disposed_case;
    data['disposed_notice'] = this.disposed_notice;
    data['total_rating'] = this.total_rating;
    data['total_rated_matters'] = this.total_rated_matters;
    data['final_rating'] = this.final_rating;
    data['portfolio'] = this.portfolio;
    data['total_cases'] = this.total_cases;
    data['total_notices'] = this.total_notices;
    data['total'] = this.total;
    return data;
  }
}
