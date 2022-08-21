class ActivityLogItem {
  int? id;
  String? memberName;
  String? created;
  String? modified;
  bool? isActive;
  bool? isDeleted;
  String? changedField;
  String? message;
  String? lastUpdated;
  String? actionType;
  String? activityType;
  int? casE;
  int? client;
  int? changedBy;

  ActivityLogItem(
      {this.id,
      this.memberName,
      this.created,
      this.modified,
      this.isActive,
      this.isDeleted,
      this.changedField,
      this.message,
      this.lastUpdated,
      this.actionType,
      this.activityType,
      this.casE,
      this.client,
      this.changedBy});

  ActivityLogItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberName = json['member_name'];
    created = json['created'];
    modified = json['modified'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    changedField = json['changed_field'].toString();
    message = json['message'];
    lastUpdated = json['last_updated'];
    actionType = json['action_type'];
    activityType = json['activity_type'];
    casE = json['case'];
    client = json['client'];
    changedBy = json['changed_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['member_name'] = this.memberName;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['changed_field'] = this.changedField;
    data['message'] = this.message;
    data['last_updated'] = this.lastUpdated;
    data['action_type'] = this.actionType;
    data['activity_type'] = this.activityType;
    data['case'] = this.casE;
    data['client'] = this.client;
    data['changed_by'] = this.changedBy;
    return data;
  }
}
