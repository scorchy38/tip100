class CauseListPDF {
  int? id;
  String? created;
  String? modified;
  bool? isActive;
  bool? isDeleted;
  String? description;
  String? causeDate;
  String? courtName;
  String? benchName;
  String? judgeName;
  String? courtType;
  String? pdfLink;
  String? year;
  int? scrapeType;
  int? scrapedStatus;
  int? courtLink;

  CauseListPDF(
      {required this.id,
      required this.created,
      required this.modified,
      required this.isActive,
      required this.isDeleted,
      required this.description,
      required this.causeDate,
      required this.courtName,
      required this.benchName,
      required this.judgeName,
      required this.courtType,
      required this.pdfLink,
      required this.year,
      required this.scrapeType,
      required this.scrapedStatus,
      required this.courtLink});

  CauseListPDF.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'].toString();
    modified = json['modified'].toString();
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    description = json['description'].toString();
    causeDate = json['cause_date'].toString();
    courtName = json['court_name'].toString();
    benchName = json['bench_name'].toString();
    judgeName = json['judge_name'].toString();
    courtType = json['court_type'].toString();
    pdfLink = json['pdf_link'].toString();
    year = json['year'].toString();
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
    data['description'] = this.description;
    data['cause_date'] = this.causeDate;
    data['court_name'] = this.courtName;
    data['bench_name'] = this.benchName;
    data['judge_name'] = this.judgeName;
    data['court_type'] = this.courtType;
    data['pdf_link'] = this.pdfLink;
    data['year'] = this.year;
    data['scrape_type'] = this.scrapeType;
    data['scraped_status'] = this.scrapedStatus;
    data['court_link'] = this.courtLink;
    return data;
  }
}
