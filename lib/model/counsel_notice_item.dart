class CounselNoticeItem {
  int? id;
  String? noticeType;
  String? status;
  String? dateOfNotice;
  String? noticeNo;
  String? dateOfCompounding;
  String? opposedProduct;
  String? actualDateOfClosure;
  String? dateOfReceipt;
  String? lastDateOfReply;
  String? amountClaimed;
  String? detail;
  String? criticality;
  String? noticeTypeName;
  String? detailName;
  String? criticalityName;
  String? statusName;
  String? description;
  List<int>? followers;
  List<FollowersDetail>? followersDetail;
  Sender? sender;
  Receiver? receiver;
  int? addedBy;
  AddedByDetail? addedByDetail;
  String? created;
  bool? isDeleted;
  List<String>? linkedCases;
  List<String>? linkedNotices;
  List<String>? noticesDetail;
  List<String>? casesDetail;
  int? documentCount;
  int? docketCount;
  int? taskCount;
  int? client;
  ClientName? clientName;
  int? resourceCount;
  List<String?>? allLinkedNotices;
  List<String?>? allLinkedCases;
  LawyerDetail? lawyerDetail;
  int? lawyer;
  List<String?>? allLinkedNoticesId;
  List<String?>? allLinkedCasesId;
  String? claim;
  String? currentStage;
  String? lawyerName;
  String? serviceTag;
  String? incidentNumber;
  String? complainantName;
  String? replyFiled;
  String? evidenceFiled;
  String? state;
  String? stateName;
  String? region;
  String? branch;
  String? convertedToConsumer;
  String? regionName;
  String? branchName;
  String? convertedToConsumerName;
  String? dateOfPurchaseOfProduct;
  String? internalNoticeStatus;
  String? assignedToName;
  String? assignedTo;
  List<String>? noticeActs;
  String? noticeEstablishment;
  String? noticeEstablishmentName;
  String? noticeLocation;
  String? noticeLocationName;
  String? resolutionDate;
  String? resolvedDate;
  String? tat;
  String? title;
  List<String>? noticeActsName;
  String? customNoticeDetail;
  String? customNoticeCorporate;
  String? dateOfFollowup;
  String? interimReply;

  CounselNoticeItem(
      {this.id,
      this.noticeType,
      this.status,
      this.dateOfNotice,
      this.noticeNo,
      this.dateOfCompounding,
      this.opposedProduct,
      this.actualDateOfClosure,
      this.dateOfReceipt,
      this.lastDateOfReply,
      this.amountClaimed,
      this.detail,
      this.criticality,
      this.noticeTypeName,
      this.detailName,
      this.criticalityName,
      this.statusName,
      this.description,
      this.followers,
      this.followersDetail,
      this.sender,
      this.receiver,
      this.addedBy,
      this.addedByDetail,
      this.created,
      this.isDeleted,
      this.linkedCases,
      this.linkedNotices,
      this.noticesDetail,
      this.casesDetail,
      this.documentCount,
      this.docketCount,
      this.taskCount,
      this.client,
      this.clientName,
      this.resourceCount,
      this.allLinkedNotices,
      this.allLinkedCases,
      this.lawyerDetail,
      this.lawyer,
      this.allLinkedNoticesId,
      this.allLinkedCasesId,
      this.claim,
      this.currentStage,
      this.lawyerName,
      this.serviceTag,
      this.incidentNumber,
      this.complainantName,
      this.replyFiled,
      this.evidenceFiled,
      this.state,
      this.stateName,
      this.region,
      this.branch,
      this.convertedToConsumer,
      this.regionName,
      this.branchName,
      this.convertedToConsumerName,
      this.dateOfPurchaseOfProduct,
      this.internalNoticeStatus,
      this.assignedToName,
      this.assignedTo,
      this.noticeActs,
      this.noticeEstablishment,
      this.noticeEstablishmentName,
      this.noticeLocation,
      this.noticeLocationName,
      this.resolutionDate,
      this.resolvedDate,
      this.tat,
      this.title,
      this.noticeActsName,
      this.customNoticeDetail,
      this.customNoticeCorporate,
      this.dateOfFollowup,
      this.interimReply});

  CounselNoticeItem.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    noticeType = json['notice_type'];
    status = json['status'];
    dateOfNotice = json['date_of_notice'];
    noticeNo = json['notice_no'];
    dateOfCompounding = json['date_of_compounding'];
    opposedProduct = json['opposed_product'];
    actualDateOfClosure = json['actual_date_of_closure'];
    dateOfReceipt = json['date_of_receipt'];
    lastDateOfReply = json['last_date_of_reply'];
    amountClaimed = json['amount_claimed'].toString();
    detail = json['detail'];
    criticality = json['criticality'];
    noticeTypeName = json['notice_type_name'];
    detailName = json['detail_name'];
    criticalityName = json['criticality_name'];
    statusName = json['status_name'];
    description = json['description'];
    followers = json['followers'].cast<int>();
    if (json['followers_detail'] != null) {
      followersDetail = <FollowersDetail>[];
      json['followers_detail'].forEach((v) {
        followersDetail?.add(new FollowersDetail.fromJson(v));
      });
    }
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    receiver = json['receiver'] != null
        ? new Receiver.fromJson(json['receiver'])
        : null;
    addedBy = json['added_by'];
    addedByDetail = json['added_by_detail'] != null
        ? new AddedByDetail.fromJson(json['added_by_detail'])
        : null;
    created = json['created'];
    isDeleted = json['is_deleted'];
    if (json['linked_cases'] != null) {
      linkedCases = <String>[];
      json['linked_cases'].forEach((v) {
        linkedCases?.add(v);
      });
    }
    if (json['linked_notices'] != null) {
      linkedNotices = <String>[];
      json['linked_notices'].forEach((v) {
        linkedNotices?.add(v);
      });
    }
    if (json['notices_detail'] != null) {
      noticesDetail = <String>[];
      json['notices_detail'].forEach((v) {
        noticesDetail?.add(v);
      });
    }
    if (json['cases_detail'] != null) {
      casesDetail = <String>[];
      json['cases_detail'].forEach((v) {
        casesDetail?.add(v);
      });
    }
    documentCount = json['document_count'];
    docketCount = json['docket_count'];
    taskCount = json['task_count'];
    client = json['client'];
    clientName = json['client_name'] != null
        ? new ClientName.fromJson(json['client_name'])
        : null;
    resourceCount = json['resource_count'];
    if (json['all_linked_notices'] != null) {
      allLinkedNotices = <String>[];
      json['all_linked_notices'].forEach((v) {
        allLinkedNotices?.add(v);
      });
    }
    if (json['all_linked_cases'] != null) {
      allLinkedCases = <String>[];
      json['all_linked_cases'].forEach((v) {
        allLinkedCases?.add(v);
      });
    }
    lawyerDetail = json['lawyer_detail'] != null
        ? new LawyerDetail.fromJson(json['lawyer_detail'])
        : null;
    lawyer = json['lawyer'];
    if (json['all_linked_notices_id'] != null) {
      allLinkedNoticesId = <String>[];
      json['all_linked_notices_id'].forEach((v) {
        allLinkedNoticesId?.add(v);
      });
    }
    if (json['all_linked_cases_id'] != null) {
      allLinkedCasesId = <String>[];
      json['all_linked_cases_id'].forEach((v) {
        allLinkedCasesId?.add(v);
      });
    }
    claim = json['claim'];
    currentStage = json['current_stage'];
    lawyerName = json['lawyer_name'];
    serviceTag = json['service_tag'];
    incidentNumber = json['incident_number'];
    complainantName = json['complainant_name'];
    replyFiled = json['reply_filed'].toString();
    evidenceFiled = json['evidence_filed'];
    state = json['state'];
    stateName = json['state_name'];
    region = json['region'];
    branch = json['branch'];
    convertedToConsumer = json['converted_to_consumer'];
    regionName = json['region_name'];
    branchName = json['branch_name'];
    convertedToConsumerName = json['converted_to_consumer_name'];
    dateOfPurchaseOfProduct = json['date_of_purchase_of_product'];
    internalNoticeStatus = json['internal_notice_status'];
    assignedToName = json['assigned_to_name'];
    assignedTo = json['assigned_to'];
    if (json['notice_acts'] != null) {
      noticeActs = <String>[];
      json['notice_acts'].forEach((v) {
        noticeActs?.add(v);
      });
    }
    noticeEstablishment = json['notice_establishment'];
    noticeEstablishmentName = json['notice_establishment_name'];
    noticeLocation = json['notice_location'];
    noticeLocationName = json['notice_location_name'];
    resolutionDate = json['resolution_date'];
    resolvedDate = json['resolved_date'];
    tat = json['tat'];
    title = json['title'];
    if (json['notice_acts_name'] != null) {
      noticeActsName = <String>[];
      json['notice_acts_name'].forEach((v) {
        noticeActsName?.add(v);
      });
    }
    customNoticeDetail = json['custom_notice_detail'];
    customNoticeCorporate = json['custom_notice_corporate'];
    dateOfFollowup = json['date_of_followup'];
    interimReply = json['interim_reply'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['notice_type'] = this.noticeType;
    data['status'] = this.status;
    data['date_of_notice'] = this.dateOfNotice;
    data['notice_no'] = this.noticeNo;
    data['date_of_compounding'] = this.dateOfCompounding;
    data['opposed_product'] = this.opposedProduct;
    data['actual_date_of_closure'] = this.actualDateOfClosure;
    data['date_of_receipt'] = this.dateOfReceipt;
    data['last_date_of_reply'] = this.lastDateOfReply;
    data['amount_claimed'] = this.amountClaimed;
    data['detail'] = this.detail;
    data['criticality'] = this.criticality;
    data['notice_type_name'] = this.noticeTypeName;
    data['detail_name'] = this.detailName;
    data['criticality_name'] = this.criticalityName;
    data['status_name'] = this.statusName;
    data['description'] = this.description;
    data['followers'] = this.followers;
    if (this.followersDetail != null) {
      data['followers_detail'] =
          this.followersDetail?.map((v) => v.toJson()).toList();
    }
    if (this.sender != null) {
      data['sender'] = this.sender?.toJson();
    }
    if (this.receiver != null) {
      data['receiver'] = this.receiver?.toJson();
    }
    data['added_by'] = this.addedBy;
    if (this.addedByDetail != null) {
      data['added_by_detail'] = this.addedByDetail?.toJson();
    }
    data['created'] = this.created;
    data['is_deleted'] = this.isDeleted;
    if (this.linkedCases != null) {
      data['linked_cases'] = this.linkedCases?.toList();
    }
    if (this.linkedNotices != null) {
      data['linked_notices'] = this.linkedNotices?.toList();
    }
    if (this.noticesDetail != null) {
      data['notices_detail'] = this.noticesDetail?.toList();
    }
    if (this.casesDetail != null) {
      data['cases_detail'] = this.casesDetail?.toList();
    }
    data['document_count'] = this.documentCount;
    data['docket_count'] = this.docketCount;
    data['task_count'] = this.taskCount;
    data['client'] = this.client;
    if (this.clientName != null) {
      data['client_name'] = this.clientName?.toJson();
    }
    data['resource_count'] = this.resourceCount;
    if (this.allLinkedNotices != null) {
      data['all_linked_notices'] = this.allLinkedNotices?.toList();
    }
    if (this.allLinkedCases != null) {
      data['all_linked_cases'] = this.allLinkedCases?.toList();
    }
    if (this.lawyerDetail != null) {
      data['lawyer_detail'] = this.lawyerDetail?.toJson();
    }
    data['lawyer'] = this.lawyer;
    if (this.allLinkedNoticesId != null) {
      data['all_linked_notices_id'] = this.allLinkedNoticesId?.toList();
    }
    if (this.allLinkedCasesId != null) {
      data['all_linked_cases_id'] = this.allLinkedCasesId?.toList();
    }
    data['claim'] = this.claim;
    data['current_stage'] = this.currentStage;
    data['lawyer_name'] = this.lawyerName;
    data['service_tag'] = this.serviceTag;
    data['incident_number'] = this.incidentNumber;
    data['complainant_name'] = this.complainantName;
    data['reply_filed'] = this.replyFiled;
    data['evidence_filed'] = this.evidenceFiled;
    data['state'] = this.state;
    data['state_name'] = this.stateName;
    data['region'] = this.region;
    data['branch'] = this.branch;
    data['converted_to_consumer'] = this.convertedToConsumer;
    data['region_name'] = this.regionName;
    data['branch_name'] = this.branchName;
    data['converted_to_consumer_name'] = this.convertedToConsumerName;
    data['date_of_purchase_of_product'] = this.dateOfPurchaseOfProduct;
    data['internal_notice_status'] = this.internalNoticeStatus;
    data['assigned_to_name'] = this.assignedToName;
    data['assigned_to'] = this.assignedTo;
    if (this.noticeActs != null) {
      data['notice_acts'] = this.noticeActs?.toList();
    }
    data['notice_establishment'] = this.noticeEstablishment;
    data['notice_establishment_name'] = this.noticeEstablishmentName;
    data['notice_location'] = this.noticeLocation;
    data['notice_location_name'] = this.noticeLocationName;
    data['resolution_date'] = this.resolutionDate;
    data['resolved_date'] = this.resolvedDate;
    data['tat'] = this.tat;
    data['title'] = this.title;
    if (this.noticeActsName != null) {
      data['notice_acts_name'] = this.noticeActsName?.toList();
    }
    data['custom_notice_detail'] = this.customNoticeDetail;
    data['custom_notice_corporate'] = this.customNoticeCorporate;
    data['date_of_followup'] = this.dateOfFollowup;
    data['interim_reply'] = this.interimReply;
    return data;
  }
}

class FollowersDetail {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? file;

  FollowersDetail({this.id, this.name, this.email, this.phone, this.file});

  FollowersDetail.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    file = json['file'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['file'] = this.file;
    return data;
  }
}

class Sender {
  int? id;
  String? entityTypeName;
  String? created;
  String? modified;
  bool? isActive;
  bool? isDeleted;
  String? name;
  String? entity;
  String? entityName;
  String? unitVertical;
  String? sentAddress;
  String? email;
  String? phoneNumber;
  String? receiverName;
  bool? isSender;
  int? notice;

  Sender(
      {this.id,
      this.entityTypeName,
      this.created,
      this.modified,
      this.isActive,
      this.isDeleted,
      this.name,
      this.entity,
      this.entityName,
      this.unitVertical,
      this.sentAddress,
      this.email,
      this.phoneNumber,
      this.receiverName,
      this.isSender,
      this.notice});

  Sender.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    entityTypeName = json['entity_type_name'];
    created = json['created'];
    modified = json['modified'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    name = json['name'];
    entity = json['entity'];
    entityName = json['entity_name'];
    unitVertical = json['unit_vertical'];
    sentAddress = json['sent_address'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    receiverName = json['receiver_name'];
    isSender = json['is_sender'];
    notice = json['notice'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['entity_type_name'] = this.entityTypeName;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['name'] = this.name;
    data['entity'] = this.entity;
    data['entity_name'] = this.entityName;
    data['unit_vertical'] = this.unitVertical;
    data['sent_address'] = this.sentAddress;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['receiver_name'] = this.receiverName;
    data['is_sender'] = this.isSender;
    data['notice'] = this.notice;
    return data;
  }
}

class Receiver {
  int? id;
  String? entityTypeName;
  String? created;
  String? modified;
  bool? isActive;
  bool? isDeleted;
  String? name;
  String? entity;
  String? entityName;
  String? unitVertical;
  String? sentAddress;
  String? email;
  String? phoneNumber;
  String? receiverName;
  bool? isSender;
  int? notice;

  Receiver(
      {this.id,
      this.entityTypeName,
      this.created,
      this.modified,
      this.isActive,
      this.isDeleted,
      this.name,
      this.entity,
      this.entityName,
      this.unitVertical,
      this.sentAddress,
      this.email,
      this.phoneNumber,
      this.receiverName,
      this.isSender,
      this.notice});

  Receiver.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    entityTypeName = json['entity_type_name'];
    created = json['created'];
    modified = json['modified'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    name = json['name'];
    entity = json['entity'];
    entityName = json['entity_name'];
    unitVertical = json['unit_vertical'];
    sentAddress = json['sent_address'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    receiverName = json['receiver_name'];
    isSender = json['is_sender'];
    notice = json['notice'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['entity_type_name'] = this.entityTypeName;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['name'] = this.name;
    data['entity'] = this.entity;
    data['entity_name'] = this.entityName;
    data['unit_vertical'] = this.unitVertical;
    data['sent_address'] = this.sentAddress;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['receiver_name'] = this.receiverName;
    data['is_sender'] = this.isSender;
    data['notice'] = this.notice;
    return data;
  }
}

class AddedByDetail {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? file;

  AddedByDetail({this.id, this.name, this.email, this.phone, this.file});

  AddedByDetail.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    file = json['file'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['file'] = this.file;
    return data;
  }
}

class ClientName {
  int? id;
  String? name;
  String? file;

  ClientName({this.id, this.name, this.file});

  ClientName.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    file = json['file'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['file'] = this.file;
    return data;
  }
}

class LawyerDetail {
  int? id;
  String? name;
  String? email;
  String? barId;
  String? number;
  String? address;
  String? city;
  int? totalCases;
  int? ongoingNotice;
  int? ongoingCase;
  String? link;
  int? organisation;

  LawyerDetail(
      {this.id,
      this.name,
      this.email,
      this.barId,
      this.number,
      this.address,
      this.city,
      this.totalCases,
      this.ongoingNotice,
      this.ongoingCase,
      this.link,
      this.organisation});

  LawyerDetail.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    barId = json['bar_id'];
    number = json['number'];
    address = json['address'];
    city = json['city'];
    totalCases = json['total_cases'];
    ongoingNotice = json['ongoing_notice'];
    ongoingCase = json['ongoing_case'];
    link = json['link'];
    organisation = json['organisation'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['bar_id'] = this.barId;
    data['number'] = this.number;
    data['address'] = this.address;
    data['city'] = this.city;
    data['total_cases'] = this.totalCases;
    data['ongoing_notice'] = this.ongoingNotice;
    data['ongoing_case'] = this.ongoingCase;
    data['link'] = this.link;
    data['organisation'] = this.organisation;
    return data;
  }
}
