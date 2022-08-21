class Task {
  int? activityCaseId;
  String? activityType;
  bool? isUpcoming;
  String? caseNo;
  int? id;
  String? documentFile;
  String? filename;
  String? lawyerEmail;
  String? title;
  int? activityCase;
  String? caseTitle;
  String? activityTypeName;
  String? createdByName;
  int? createdBy;
  String? deadline;
  String? statusName;
  int? assignedTo;
  String? assignedToName;
  String? summary;
  String? status;
  bool? isDeleted;
  int? visible;

  Task(
      {this.activityCaseId,
      this.activityType,
      this.isUpcoming,
      this.caseNo,
      this.id,
      this.documentFile,
      this.filename,
      this.lawyerEmail,
      this.title,
      this.activityCase,
      this.caseTitle,
      this.activityTypeName,
      this.createdByName,
      this.createdBy,
      this.deadline,
      this.statusName,
      this.assignedTo,
      this.assignedToName,
      this.summary,
      this.status,
      this.isDeleted,
      this.visible});

  Task.fromJson(Map<String?, dynamic> json) {
    activityCaseId = json['activity_case_id'];
    activityType = json['activity_type'];
    isUpcoming = json['is_upcoming'];
    caseNo = json['case_no'];
    id = json['id'];
    documentFile = json['document_file'];
    filename = json['filename'];
    lawyerEmail = json['lawyer_email'];
    title = json['title'];
    activityCase = json['activity_case'];
    caseTitle = json['case_title'];
    activityTypeName = json['activity_type_name'];
    createdByName = json['created_by_name'];
    createdBy = json['created_by'];
    deadline = json['deadline'];
    statusName = json['status_name'];
    assignedTo = json['assigned_to'];
    assignedToName = json['assigned_to_name'];
    summary = json['summary'];
    status = json['status'];
    isDeleted = json['is_deleted'];
    visible = json['visible'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['activity_case_id'] = this.activityCaseId;
    data['activity_type'] = this.activityType;
    data['is_upcoming'] = this.isUpcoming;
    data['case_no'] = this.caseNo;
    data['id'] = this.id;
    data['document_file'] = this.documentFile;
    data['filename'] = this.filename;
    data['lawyer_email'] = this.lawyerEmail;
    data['title'] = this.title;
    data['activity_case'] = this.activityCase;
    data['case_title'] = this.caseTitle;
    data['activity_type_name'] = this.activityTypeName;
    data['created_by_name'] = this.createdByName;
    data['created_by'] = this.createdBy;
    data['deadline'] = this.deadline;
    data['status_name'] = this.statusName;
    data['assigned_to'] = this.assignedTo;
    data['assigned_to_name'] = this.assignedToName;
    data['summary'] = this.summary;
    data['status'] = this.status;
    data['is_deleted'] = this.isDeleted;
    data['visible'] = this.visible;
    return data;
  }
}
