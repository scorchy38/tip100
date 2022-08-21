class CauseListFreeText {
  int? id;
  String? created;
  String? modified;
  bool? isActive;
  bool? isDeleted;
  String? respondent;
  String? complainant;
  String? purpose;
  String? section;
  String? dateOfHearing;
  String? caseNo;
  String? cino;
  String? judgeName;
  String? year;
  String? courtName;
  String? courtType;
  String? benchName;
  int? scrapeType;
  int? scrapedStatus;
  int? courtLink;

  CauseListFreeText(
      {required this.id,
      required this.created,
      required this.modified,
      required this.isActive,
      required this.isDeleted,
      required this.respondent,
      required this.complainant,
      required this.purpose,
      required this.section,
      required this.dateOfHearing,
      required this.caseNo,
      required this.cino,
      required this.judgeName,
      required this.year,
      required this.courtName,
      required this.courtType,
      required this.benchName,
      required this.scrapeType,
      required this.scrapedStatus,
      required this.courtLink});

  CauseListFreeText.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'].toString();
    modified = json['modified'].toString();
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    respondent = json['respondent'].toString();
    complainant = json['complainant'].toString();
    purpose = json['purpose'].toString();
    section = json['section'].toString();
    dateOfHearing = json['date_of_hearing'].toString();
    caseNo = json['case_no'].toString();
    cino = json['cino'].toString();
    judgeName = json['judge_name'].toString();
    year = json['year'].toString();
    courtName = json['court_name'].toString();
    courtType = json['court_type'].toString();
    benchName = json['bench_name'].toString();
    scrapeType = json['scrape_type'];
    scrapedStatus = json['scraped_status'];
    courtLink = json['court_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['respondent'] = this.respondent;
    data['complainant'] = this.complainant;
    data['purpose'] = this.purpose;
    data['section'] = this.section;
    data['date_of_hearing'] = this.dateOfHearing;
    data['case_no'] = this.caseNo;
    data['cino'] = this.cino;
    data['judge_name'] = this.judgeName;
    data['year'] = this.year;
    data['court_name'] = this.courtName;
    data['court_type'] = this.courtType;
    data['bench_name'] = this.benchName;
    data['scrape_type'] = this.scrapeType;
    data['scraped_status'] = this.scrapedStatus;
    data['court_link'] = this.courtLink;
    return data;
  }
}
