class Judgements {
  String? orderUniqueId;
  String? complainant;
  String? regYear;
  String? courtEstablishmentName;
  String? caseType;
  String? created;
  String? orderYear;
  int? courtLinkId;
  String? modified;
  int? courtId;
  String? orderPdfS3Url;
  int? orderNo;
  String? dateOfOrder;
  String? courtName;
  String? caseNo;
  int? scrapeType;
  String? diaryNo;
  String? documentName;
  int? scrapedStatus;
  String? respondent;
  String? orderType;
  int? courtEstablishmentCode;
  String? courtOrderLink;
  int? id;
  String? regNo;
  String? orderTextS3Url;
  String? courtOrderTextLink;
  String? complainantLawyer;
  String? respondentLawyer;
  String? courtDataId;
  String? benchId;
  String? benchName;
  String? judgeName;

  Judgements(
      {this.orderUniqueId,
      this.complainant,
      this.regYear,
      this.courtEstablishmentName,
      this.caseType,
      this.created,
      this.orderYear,
      this.courtLinkId,
      this.modified,
      this.courtId,
      this.orderPdfS3Url,
      this.orderNo,
      this.dateOfOrder,
      this.courtName,
      this.caseNo,
      this.scrapeType,
      this.diaryNo,
      this.documentName,
      this.scrapedStatus,
      this.respondent,
      this.orderType,
      this.courtEstablishmentCode,
      this.courtOrderLink,
      this.id,
      this.regNo,
      this.orderTextS3Url,
      this.courtOrderTextLink,
      this.complainantLawyer,
      this.respondentLawyer,
      this.courtDataId,
      this.benchId,
      this.benchName,
      this.judgeName});

  Judgements.fromJson(Map<String, dynamic> json) {
    orderUniqueId = json['order_unique_id'];
    complainant = json['complainant'];
    regYear = json['reg_year'];
    courtEstablishmentName = json['court_establishment_name'];
    caseType = json['case_type'];
    created = json['created'];
    orderYear = json['order_year'];
    courtLinkId = json['court_link_id'];
    modified = json['modified'];
    courtId = json['court_id'];
    orderPdfS3Url = json['order_pdf_s3_url'];
    orderNo = json['order_no'];
    dateOfOrder = json['date_of_order'];
    courtName = json['court_name'];
    caseNo = json['case_no'];
    scrapeType = json['scrape_type'];
    diaryNo = json['diary_no'];
    documentName = json['document_name'];
    scrapedStatus = json['scraped_status'];
    respondent = json['respondent'];
    orderType = json['order_type'];
    courtEstablishmentCode = json['court_establishment_code'];
    courtOrderLink = json['court_order_link'];
    id = json['id'];
    regNo = json['reg_no'];
    orderTextS3Url = json['order_text_s3_url'];
    courtOrderTextLink = json['court_order_text_link'];
    complainantLawyer = json['complainant_lawyer'];
    respondentLawyer = json['respondent_lawyer'];
    courtDataId = json['court_data_id'];
    benchId = json['bench_id'];
    benchName = json['bench_name'];
    judgeName = json['judge_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_unique_id'] = this.orderUniqueId;
    data['complainant'] = this.complainant;
    data['reg_year'] = this.regYear;
    data['court_establishment_name'] = this.courtEstablishmentName;
    data['case_type'] = this.caseType;
    data['created'] = this.created;
    data['order_year'] = this.orderYear;
    data['court_link_id'] = this.courtLinkId;
    data['modified'] = this.modified;
    data['court_id'] = this.courtId;
    data['order_pdf_s3_url'] = this.orderPdfS3Url;
    data['order_no'] = this.orderNo;
    data['date_of_order'] = this.dateOfOrder;
    data['court_name'] = this.courtName;
    data['case_no'] = this.caseNo;
    data['scrape_type'] = this.scrapeType;
    data['diary_no'] = this.diaryNo;
    data['document_name'] = this.documentName;
    data['scraped_status'] = this.scrapedStatus;
    data['respondent'] = this.respondent;
    data['order_type'] = this.orderType;
    data['court_establishment_code'] = this.courtEstablishmentCode;
    data['court_order_link'] = this.courtOrderLink;
    data['id'] = this.id;
    data['reg_no'] = this.regNo;
    data['order_text_s3_url'] = this.orderTextS3Url;
    data['court_order_text_link'] = this.courtOrderTextLink;
    data['complainant_lawyer'] = this.complainantLawyer;
    data['respondent_lawyer'] = this.respondentLawyer;
    data['court_data_id'] = this.courtDataId;
    data['bench_id'] = this.benchId;
    data['bench_name'] = this.benchName;
    data['judge_name'] = this.judgeName;
    return data;
  }
}
