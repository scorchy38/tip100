class AllCasesDetails {
  String? status;
  String? dateOfFiling;
  String? statusName;
  String? stageName;
  String? courtName;
  int? caseType;
  String? caseTypeName;
  int? id;
  String? cityName;
  int? caseId;
  String? caseNo;
  int? caseStage;
  Client? client;
  int? court;
  String? title;
  String? dateOfAllotment;
  int? city;
  String? state;
  CaseManager? caseManager;
  Lawyer? lawyer;
  String? productModel;
  String? description;
  List<String?>? caseLawyersSuggested;
  String? otherRespondentParties;
  String? amountClaimed;
  String? complianceRemarks;
  String? productBrand;
  String? winEstimate;
  String? clientInstructions;
  String? productValue;
  List<int>? followers;
  List<FollowersDetail>? followersDetail;
  String? priority;
  List<CompleteFollowerList>? completeFollowerList;
  String? priorityName;
  int? courtData;
  CaseExplorerDetail? caseExplorerDetail;
  bool? tracking;
  List<String?>? lawyersTerms;
  int? documentCount;
  int? scrapeType;
  LawyerGrid? lawyerGrid;
  String? ndoh;
  String? dCaseType;
  String? dCaseTypeName;
  int? docketCount;
  int? taskCount;
  int? hearingCount;
  int? noteCount;
  int? ticketCount;
  List<int>? allLinkedNoticesId;
  List<int>? allLinkedCasesId;
  List<AllLinkedNotices>? allLinkedNotices;
  List<AllLinkedCases>? allLinkedCases;
  int? resourceCount;
  List<Parties>? parties;
  bool? isLitigation;
  bool? sendLawyerUpdate;
  List<String?>? caseSend;
  List<String?>? caseAdditionalDetails;
  CasePolicyDetails? casePolicyDetails;
  String? branch;
  String? dateOfReceiptOfComplaint;
  String? entity;
  String? entityName;
  String? loanNo;
  bool? isDeleted;
  String? orderType;
  String? orderReason;
  String? orderDate;
  String? action;
  String? orderReceiptDate;
  String? complianceDueDate;
  String? complianceDoneDate;
  String? orderTypeName;
  String? actionName;
  String? caseBy;
  String? caseByName;
  String? contingentLiability;
  String? contingentLiabilityAmount;
  String? amountPaidAsPerOrder;
  String? contingentLiabilityName;
  String? productCategory;
  String? deficiency;
  String? deficiencyName;
  String? purchaseDate;
  String? natureOfComplaint;
  String? budgetRemark;
  String? principalAmountPaid;
  String? interestAwardPaid;
  String? otherHeadsPaid;
  String? penaltyPaid;
  String? totalAmountPaid;
  String? disputeCategory;
  String? disputeCategoryName;
  String? disputeSubCategory;
  List<CasePerformanceCost>? casePerformanceCost;
  String? complainantPhoneNumber;
  String? complainantAddress;
  String? claimAmount;
  String? claimAmountName;
  String? provisions;
  String? provisioningRational;
  String? riskRating;
  String? riskRatingName;
  String? natureOfClaim;
  String? natureOfClaim2;
  String? natureOfClaimName;
  String? natureOfClaim2Name;
  String? rmName;
  String? wsFillingDate;
  String? lob;
  String? insuredName;
  String? policyStartDate;
  String? policyEndDate;
  String? coverType;
  String? dateOfLoss;
  String? actualLossAmountAsPerSurvey;
  String? companyType;
  String? courtFindings;
  String? awardDate;
  String? awardReceiptDate;
  String? savings;
  String? finalStatus;
  String? productCode;
  String? principalAwardAmount;
  String? dateOfCompliance;
  String? finalStatusName;
  String? claimNo;
  String? typeOfClaim;
  String? clientSide;
  bool? nonIndiamart;
  String? handeledCaseSummary;
  String? clientCustomId;
  String? field1;
  String? field2;
  String? field3;
  bool? deleteCheck;
  MetaData? metaData;

  AllCasesDetails(
      {this.status,
      this.dateOfFiling,
      this.statusName,
      this.stageName,
      this.courtName,
      this.caseType,
      this.caseTypeName,
      this.id,
      this.cityName,
      this.caseId,
      this.caseNo,
      this.caseStage,
      this.client,
      this.court,
      this.title,
      this.dateOfAllotment,
      this.city,
      this.state,
      this.caseManager,
      this.lawyer,
      this.productModel,
      this.description,
      this.caseLawyersSuggested,
      this.otherRespondentParties,
      this.amountClaimed,
      this.complianceRemarks,
      this.productBrand,
      this.winEstimate,
      this.clientInstructions,
      this.productValue,
      this.followers,
      this.followersDetail,
      this.priority,
      this.completeFollowerList,
      this.priorityName,
      this.courtData,
      this.caseExplorerDetail,
      this.tracking,
      this.lawyersTerms,
      this.documentCount,
      this.scrapeType,
      this.lawyerGrid,
      this.ndoh,
      this.dCaseType,
      this.dCaseTypeName,
      this.docketCount,
      this.taskCount,
      this.hearingCount,
      this.noteCount,
      this.ticketCount,
      this.allLinkedNoticesId,
      this.allLinkedCasesId,
      this.allLinkedNotices,
      this.allLinkedCases,
      this.resourceCount,
      this.parties,
      this.isLitigation,
      this.sendLawyerUpdate,
      this.caseSend,
      this.caseAdditionalDetails,
      this.casePolicyDetails,
      this.branch,
      this.dateOfReceiptOfComplaint,
      this.entity,
      this.entityName,
      this.loanNo,
      this.isDeleted,
      this.orderType,
      this.orderReason,
      this.orderDate,
      this.action,
      this.orderReceiptDate,
      this.complianceDueDate,
      this.complianceDoneDate,
      this.orderTypeName,
      this.actionName,
      this.caseBy,
      this.caseByName,
      this.contingentLiability,
      this.contingentLiabilityAmount,
      this.amountPaidAsPerOrder,
      this.contingentLiabilityName,
      this.productCategory,
      this.deficiency,
      this.deficiencyName,
      this.purchaseDate,
      this.natureOfComplaint,
      this.budgetRemark,
      this.principalAmountPaid,
      this.interestAwardPaid,
      this.otherHeadsPaid,
      this.penaltyPaid,
      this.totalAmountPaid,
      this.disputeCategory,
      this.disputeCategoryName,
      this.disputeSubCategory,
      this.casePerformanceCost,
      this.complainantPhoneNumber,
      this.complainantAddress,
      this.claimAmount,
      this.claimAmountName,
      this.provisions,
      this.provisioningRational,
      this.riskRating,
      this.riskRatingName,
      this.natureOfClaim,
      this.natureOfClaim2,
      this.natureOfClaimName,
      this.natureOfClaim2Name,
      this.rmName,
      this.wsFillingDate,
      this.lob,
      this.insuredName,
      this.policyStartDate,
      this.policyEndDate,
      this.coverType,
      this.dateOfLoss,
      this.actualLossAmountAsPerSurvey,
      this.companyType,
      this.courtFindings,
      this.awardDate,
      this.awardReceiptDate,
      this.savings,
      this.finalStatus,
      this.productCode,
      this.principalAwardAmount,
      this.dateOfCompliance,
      this.finalStatusName,
      this.claimNo,
      this.typeOfClaim,
      this.clientSide,
      this.nonIndiamart,
      this.handeledCaseSummary,
      this.clientCustomId,
      this.field1,
      this.field2,
      this.field3,
      this.deleteCheck,
      this.metaData});

  AllCasesDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    dateOfFiling = json['date_of_filing'];
    statusName = json['status_name'];
    stageName = json['stage_name'];
    courtName = json['court_name'];
    caseType = json['case_type'];
    caseTypeName = json['case_type_name'];
    id = json['id'];
    cityName = json['city_name'];
    caseId = json['case_id'];
    caseNo = json['case_no'];
    caseStage = json['case_stage'];
    client =
        (json['client'] != null ? new Client.fromJson(json['client']) : null)!;
    court = json['court'];
    title = json['title'];
    dateOfAllotment = json['date_of_allotment'];
    city = json['city'];
    state = json['state'];
    caseManager = json['case_manager'] != null
        ? new CaseManager.fromJson(json['case_manager'])
        : null;
    lawyer =
        json['lawyer'] != null ? new Lawyer.fromJson(json['lawyer']) : null;
    productModel = json['product_model'];
    description = json['description'];
    if (json['case_lawyers_suggested'] != null) {
      caseLawyersSuggested = <String?>[];
      // json['case_lawyers_suggested'].forEach((v) {
      //   caseLawyersSuggested.add(CaseLa?.fromJson(v));
      // });
    }
    otherRespondentParties = json['other_respondent_parties'];
    amountClaimed = json['amount_claimed'];
    complianceRemarks = json['compliance_remarks'];
    productBrand = json['product_brand'];
    winEstimate = json['win_estimate'];
    clientInstructions = json['client_instructions'];
    productValue = json['product_value'];
    followers = json['followers'].cast<int>();
    if (json['followers_detail'] != null) {
      // ignore: deprecated_member_use
      followersDetail = <FollowersDetail>[];
      json['followers_detail'].forEach((v) {
        followersDetail?.add(new FollowersDetail.fromJson(v));
      });
    }
    priority = json['priority'];
    if (json['complete_follower_list'] != null) {
      completeFollowerList = <CompleteFollowerList>[];
      json['complete_follower_list'].forEach((v) {
        completeFollowerList?.add(new CompleteFollowerList.fromJson(v));
      });
    }
    priorityName = json['priority_name'];
    courtData = json['court_data'];
    caseExplorerDetail = (json['case_explorer_detail'] != null
        ? new CaseExplorerDetail.fromJson(json['case_explorer_detail'])
        : null)!;
    tracking = json['tracking'];
    if (json['lawyers_terms'] != null) {
      lawyersTerms = <String?>[];
      // json['lawyers_terms'].forEach((v) { lawyersTerms.add(new String?.fromJson(v)); });
    }
    documentCount = json['document_count'];
    scrapeType = json['scrape_type'];
    lawyerGrid = (json['lawyer_grid'] != null
        ? new LawyerGrid.fromJson(json['lawyer_grid'])
        : null)!;
    ndoh = json['ndoh'];
    dCaseType = json['d_case_type'];
    dCaseTypeName = json['d_case_type_name'];
    docketCount = json['docket_count'];
    taskCount = json['task_count'];
    hearingCount = json['hearing_count'];
    noteCount = json['note_count'];
    ticketCount = json['ticket_count'];
    allLinkedNoticesId = json['all_linked_notices_id'].cast<int>();
    allLinkedCasesId = json['all_linked_cases_id'].cast<int>();
    if (json['all_linked_notices'] != null) {
      allLinkedNotices = <AllLinkedNotices>[];
      json['all_linked_notices'].forEach((v) {
        allLinkedNotices?.add(new AllLinkedNotices.fromJson(v));
      });
    }
    if (json['all_linked_cases'] != null) {
      allLinkedCases = <AllLinkedCases>[];
      json['all_linked_cases'].forEach((v) {
        allLinkedCases?.add(new AllLinkedCases.fromJson(v));
      });
    }
    resourceCount = json['resource_count'];
    if (json['parties'] != null) {
      parties = <Parties>[];
      json['parties'].forEach((v) {
        parties?.add(new Parties.fromJson(v));
      });
    }
    isLitigation = json['is_litigation'];
    sendLawyerUpdate = json['send_lawyer_update'];
    if (json['case_send'] != null) {
      caseSend = <String?>[];
      // json['case_send'].forEach((v) { caseSend.add(new String?.fromJson(v)); });
    }
    if (json['case_additional_details'] != null) {
      caseAdditionalDetails = <String?>[];
      // json['case_additional_details'].forEach((v) { caseAdditionalDetails.add(new String?.fromJson(v)); });
    }
    casePolicyDetails = (json['case_policy_details'] != null
        ? new CasePolicyDetails.fromJson(json['case_policy_details'])
        : null)!;
    branch = json['branch'];
    dateOfReceiptOfComplaint = json['date_of_receipt_of_complaint'];
    entity = json['entity'];
    entityName = json['entity_name'];
    loanNo = json['loan_no'];
    isDeleted = json['is_deleted'];
    orderType = json['order_type'];
    orderReason = json['order_reason'];
    orderDate = json['order_date'];
    action = json['action'];
    orderReceiptDate = json['order_receipt_date'];
    complianceDueDate = json['compliance_due_date'];
    complianceDoneDate = json['compliance_done_date'];
    orderTypeName = json['order_type_name'];
    actionName = json['action_name'];
    caseBy = json['case_by'];
    caseByName = json['case_by_name'];
    contingentLiability = json['contingent_liability'];
    contingentLiabilityAmount = json['contingent_liability_amount'];
    amountPaidAsPerOrder = json['amount_paid_as_per_order'];
    contingentLiabilityName = json['contingent_liability_name'];
    productCategory = json['product_category'];
    deficiency = json['deficiency'];
    deficiencyName = json['deficiency_name'];
    purchaseDate = json['purchase_date'];
    natureOfComplaint = json['nature_of_complaint'];
    budgetRemark = json['budget_remark'];
    principalAmountPaid = json['principal_amount_paid'];
    interestAwardPaid = json['interest_award_paid'];
    otherHeadsPaid = json['other_heads_paid'];
    penaltyPaid = json['penalty_paid'];
    totalAmountPaid = json['total_amount_paid'];
    disputeCategory = json['dispute_category'];
    disputeCategoryName = json['dispute_category_name'];
    disputeSubCategory = json['dispute_sub_category'];
    if (json['case_performance_cost'] != null) {
      print(json['case_performance_cost'].runtimeType.toString());
      if (json['case_performance_cost'].runtimeType.toString() ==
          '_InternalLinkedHashMap<String, dynamic>') {
        if (!Map.from(json['case_performance_cost']).isEmpty) {
          casePerformanceCost = <CasePerformanceCost>[];
          json['case_performance_cost'].forEach((v) {
            casePerformanceCost?.add(new CasePerformanceCost.fromJson(v));
          });
        }
      } else {
        casePerformanceCost = <CasePerformanceCost>[];
        json['case_performance_cost'].forEach((v) {
          casePerformanceCost?.add(new CasePerformanceCost.fromJson(v));
        });
      }
    }
    complainantPhoneNumber = json['complainant_phone_number'];
    complainantAddress = json['complainant_address'];
    claimAmount = json['claim_amount'];
    claimAmountName = json['claim_amount_name'];
    provisions = json['provisions'];
    provisioningRational = json['provisioning_rational'];
    riskRating = json['risk_rating'];
    riskRatingName = json['risk_rating_name'];
    natureOfClaim = json['nature_of_claim'];
    natureOfClaim2 = json['nature_of_claim2'];
    natureOfClaimName = json['nature_of_claim_name'];
    natureOfClaim2Name = json['nature_of_claim2_name'];
    rmName = json['rm_name'];
    wsFillingDate = json['ws_filling_date'];
    lob = json['lob'];
    insuredName = json['insured_name'];
    policyStartDate = json['policy_start_date'];
    policyEndDate = json['policy_end_date'];
    coverType = json['cover_type'];
    dateOfLoss = json['date_of_loss'];
    actualLossAmountAsPerSurvey = json['actual_loss_amount_as_per_survey'];
    companyType = json['company_type'];
    courtFindings = json['court_findings'];
    awardDate = json['award_date'];
    awardReceiptDate = json['award_receipt_date'];
    savings = json['savings'];
    finalStatus = json['final_status'];
    productCode = json['product_code'];
    principalAwardAmount = json['principal_award_amount'];
    dateOfCompliance = json['date_of_compliance'];
    finalStatusName = json['final_status_name'];
    claimNo = json['claim_no'];
    typeOfClaim = json['type_of_claim'];
    clientSide = json['client_side'];
    nonIndiamart = json['non_indiamart'];
    handeledCaseSummary = json['handeled_case_summary'];
    clientCustomId = json['client_custom_id'];
    field1 = json['field1'];
    field2 = json['field2'];
    field3 = json['field3'];
    deleteCheck = json['delete_check'];
    metaData = (json['meta_data'] != null
        ? MetaData.fromJson(json['meta_data'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['date_of_filing'] = this.dateOfFiling;
    data['status_name'] = this.statusName;
    data['stage_name'] = this.stageName;
    data['court_name'] = this.courtName;
    data['case_type'] = this.caseType;
    data['case_type_name'] = this.caseTypeName;
    data['id'] = this.id;
    data['city_name'] = this.cityName;
    data['case_id'] = this.caseId;
    data['case_no'] = this.caseNo;
    data['case_stage'] = this.caseStage;
    if (this.client != null) {
      data['client'] = this.client?.toJson();
    }
    data['court'] = this.court;
    data['title'] = this.title;
    data['date_of_allotment'] = this.dateOfAllotment;
    data['city'] = this.city;
    data['state'] = this.state;
    if (this.caseManager != null) {
      data['case_manager'] = this.caseManager?.toJson();
    }
    if (this.lawyer != null) {
      data['lawyer'] = this.lawyer?.toJson();
    }
    data['product_model'] = this.productModel;
    data['description'] = this.description;
    if (this.caseLawyersSuggested != null) {
      data['case_lawyers_suggested'] = this.caseLawyersSuggested;
    }
    data['other_respondent_parties'] = this.otherRespondentParties;
    data['amount_claimed'] = this.amountClaimed;
    data['compliance_remarks'] = this.complianceRemarks;
    data['product_brand'] = this.productBrand;
    data['win_estimate'] = this.winEstimate;
    data['client_instructions'] = this.clientInstructions;
    data['product_value'] = this.productValue;
    data['followers'] = this.followers;
    if (this.followersDetail != null) {
      data['followers_detail'] =
          this.followersDetail?.map((v) => v.toJson()).toList();
    }
    data['priority'] = this.priority;
    if (this.completeFollowerList != null) {
      data['complete_follower_list'] =
          this.completeFollowerList?.map((v) => v.toJson()).toList();
    }
    data['priority_name'] = this.priorityName;
    data['court_data'] = this.courtData;
    if (this.caseExplorerDetail != null) {
      data['case_explorer_detail'] = this.caseExplorerDetail?.toJson();
    }
    data['tracking'] = this.tracking;
    if (this.lawyersTerms != null) {
      data['lawyers_terms'] = this.lawyersTerms;
    }
    data['document_count'] = this.documentCount;
    data['scrape_type'] = this.scrapeType;
    if (this.lawyerGrid != null) {
      data['lawyer_grid'] = this.lawyerGrid?.toJson();
    }
    data['ndoh'] = this.ndoh;
    data['d_case_type'] = this.dCaseType;
    data['d_case_type_name'] = this.dCaseTypeName;
    data['docket_count'] = this.docketCount;
    data['task_count'] = this.taskCount;
    data['hearing_count'] = this.hearingCount;
    data['note_count'] = this.noteCount;
    data['ticket_count'] = this.ticketCount;
    data['all_linked_notices_id'] = this.allLinkedNoticesId;
    data['all_linked_cases_id'] = this.allLinkedCasesId;
    if (this.allLinkedNotices != null) {
      data['all_linked_notices'] =
          this.allLinkedNotices?.map((v) => v.toJson()).toList();
    }
    if (this.allLinkedCases != null) {
      data['all_linked_cases'] =
          this.allLinkedCases?.map((v) => v.toJson()).toList();
    }
    data['resource_count'] = this.resourceCount;
    if (this.parties != null) {
      data['parties'] = this.parties?.map((v) => v.toJson()).toList();
    }
    data['is_litigation'] = this.isLitigation;
    data['send_lawyer_update'] = this.sendLawyerUpdate;
    if (this.caseSend != null) {
      data['case_send'] = this.caseSend;
    }
    if (this.caseAdditionalDetails != null) {
      data['case_additional_details'] = this.caseAdditionalDetails;
    }
    if (this.casePolicyDetails != null) {
      data['case_policy_details'] = this.casePolicyDetails?.toJson();
    }
    data['branch'] = this.branch;
    data['date_of_receipt_of_complaint'] = this.dateOfReceiptOfComplaint;
    data['entity'] = this.entity;
    data['entity_name'] = this.entityName;
    data['loan_no'] = this.loanNo;
    data['is_deleted'] = this.isDeleted;
    data['order_type'] = this.orderType;
    data['order_reason'] = this.orderReason;
    data['order_date'] = this.orderDate;
    data['action'] = this.action;
    data['order_receipt_date'] = this.orderReceiptDate;
    data['compliance_due_date'] = this.complianceDueDate;
    data['compliance_done_date'] = this.complianceDoneDate;
    data['order_type_name'] = this.orderTypeName;
    data['action_name'] = this.actionName;
    data['case_by'] = this.caseBy;
    data['case_by_name'] = this.caseByName;
    data['contingent_liability'] = this.contingentLiability;
    data['contingent_liability_amount'] = this.contingentLiabilityAmount;
    data['amount_paid_as_per_order'] = this.amountPaidAsPerOrder;
    data['contingent_liability_name'] = this.contingentLiabilityName;
    data['product_category'] = this.productCategory;
    data['deficiency'] = this.deficiency;
    data['deficiency_name'] = this.deficiencyName;
    data['purchase_date'] = this.purchaseDate;
    data['nature_of_complaint'] = this.natureOfComplaint;
    data['budget_remark'] = this.budgetRemark;
    data['principal_amount_paid'] = this.principalAmountPaid;
    data['interest_award_paid'] = this.interestAwardPaid;
    data['other_heads_paid'] = this.otherHeadsPaid;
    data['penalty_paid'] = this.penaltyPaid;
    data['total_amount_paid'] = this.totalAmountPaid;
    data['dispute_category'] = this.disputeCategory;
    data['dispute_category_name'] = this.disputeCategoryName;
    data['dispute_sub_category'] = this.disputeSubCategory;
    if (this.casePerformanceCost != null) {
      data['case_performance_cost'] =
          this.casePerformanceCost?.map((v) => v.toJson()).toList();
    }
    data['complainant_phone_number'] = this.complainantPhoneNumber;
    data['complainant_address'] = this.complainantAddress;
    data['claim_amount'] = this.claimAmount;
    data['claim_amount_name'] = this.claimAmountName;
    data['provisions'] = this.provisions;
    data['provisioning_rational'] = this.provisioningRational;
    data['risk_rating'] = this.riskRating;
    data['risk_rating_name'] = this.riskRatingName;
    data['nature_of_claim'] = this.natureOfClaim;
    data['nature_of_claim2'] = this.natureOfClaim2;
    data['nature_of_claim_name'] = this.natureOfClaimName;
    data['nature_of_claim2_name'] = this.natureOfClaim2Name;
    data['rm_name'] = this.rmName;
    data['ws_filling_date'] = this.wsFillingDate;
    data['lob'] = this.lob;
    data['insured_name'] = this.insuredName;
    data['policy_start_date'] = this.policyStartDate;
    data['policy_end_date'] = this.policyEndDate;
    data['cover_type'] = this.coverType;
    data['date_of_loss'] = this.dateOfLoss;
    data['actual_loss_amount_as_per_survey'] = this.actualLossAmountAsPerSurvey;
    data['company_type'] = this.companyType;
    data['court_findings'] = this.courtFindings;
    data['award_date'] = this.awardDate;
    data['award_receipt_date'] = this.awardReceiptDate;
    data['savings'] = this.savings;
    data['final_status'] = this.finalStatus;
    data['product_code'] = this.productCode;
    data['principal_award_amount'] = this.principalAwardAmount;
    data['date_of_compliance'] = this.dateOfCompliance;
    data['final_status_name'] = this.finalStatusName;
    data['claim_no'] = this.claimNo;
    data['type_of_claim'] = this.typeOfClaim;
    data['client_side'] = this.clientSide;
    data['non_indiamart'] = this.nonIndiamart;
    data['handeled_case_summary'] = this.handeledCaseSummary;
    data['client_custom_id'] = this.clientCustomId;
    data['field1'] = this.field1;
    data['field2'] = this.field2;
    data['field3'] = this.field3;
    data['delete_check'] = this.deleteCheck;
    if (this.metaData != null) {
      data['meta_data'] = this.metaData?.toJson();
    }
    return data;
  }
}

class Client {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? pocName;

  Client(
      {this.id, this.name, this.email, this.phone, this.address, this.pocName});

  Client.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    pocName = json['poc_name'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['poc_name'] = this.pocName;
    return data;
  }
}

class CaseManager {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? file;

  CaseManager({this.id, this.name, this.email, this.phone, this.file});

  CaseManager.fromJson(Map<String?, dynamic> json) {
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

class Lawyer {
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

  Lawyer(
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

  Lawyer.fromJson(Map<String?, dynamic> json) {
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

class CaseExplorerDetail {
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
  String? clientType;

  CaseExplorerDetail(
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
      this.clientType});

  CaseExplorerDetail.fromJson(Map<String?, dynamic> json) {
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
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
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
      data['court_data'] = this.courtData?.toJson();
    }
    data['type_name'] = this.typeName;
    data['client_type'] = this.clientType;
    return data;
  }
}

class CourtData {
  String? name;
  String? district;
  String? state;

  CourtData({this.name, this.district, this.state});

  CourtData.fromJson(Map<String?, dynamic> json) {
    name = json['name'];
    district = json['district'];
    state = json['state'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['name'] = this.name;
    data['district'] = this.district;
    data['state'] = this.state;
    return data;
  }
}

class LawyerGrid {
  bool? favourableOrder;
  String? orderType;
  int? responsiveness;
  String? expenditure;
  int? workQuality;
  String? subjectMatterExpert;
  String? date;
  String? orderTypeData;
  String? expenditureData;
  String? subjectMatterExpertData;
  int? casE;
  String? invoiceDetails;

  LawyerGrid(
      {this.favourableOrder,
      this.orderType,
      this.responsiveness,
      this.expenditure,
      this.workQuality,
      this.subjectMatterExpert,
      this.date,
      this.orderTypeData,
      this.expenditureData,
      this.subjectMatterExpertData,
      this.casE,
      this.invoiceDetails});

  LawyerGrid.fromJson(Map<String?, dynamic> json) {
    favourableOrder = json['favourable_order'];
    orderType = json['order_type'];
    responsiveness = json['responsiveness'];
    expenditure = json['expenditure'];
    workQuality = json['work_quality'];
    subjectMatterExpert = json['subject_matter_expert'];
    date = json['date'];
    orderTypeData = json['order_type_data'];
    expenditureData = json['expenditure_data'];
    subjectMatterExpertData = json['subject_matter_expert_data'];
    casE = json['case'];
    invoiceDetails = json['invoice_details'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['favourable_order'] = this.favourableOrder;
    data['order_type'] = this.orderType;
    data['responsiveness'] = this.responsiveness;
    data['expenditure'] = this.expenditure;
    data['work_quality'] = this.workQuality;
    data['subject_matter_expert'] = this.subjectMatterExpert;
    data['date'] = this.date;
    data['order_type_data'] = this.orderTypeData;
    data['expenditure_data'] = this.expenditureData;
    data['subject_matter_expert_data'] = this.subjectMatterExpertData;
    data['case'] = this.casE;
    data['invoice_details'] = this.invoiceDetails;
    return data;
  }
}

class AllLinkedNotices {
  int? id;
  String? detailName;
  String? dateOfNotice;
  Sender? sender;
  Receiver? receiver;
  String? name;
  String? amountClaimed;

  AllLinkedNotices(
      {this.id,
      this.detailName,
      this.dateOfNotice,
      this.sender,
      this.receiver,
      this.name,
      this.amountClaimed});

  AllLinkedNotices.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    detailName = json['detail_name'];
    dateOfNotice = json['date_of_notice'];
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
    receiver = json['receiver'] != null
        ? new Receiver.fromJson(json['receiver'])
        : null;
    name = json['name'];
    amountClaimed = json['amount_claimed'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['detail_name'] = this.detailName;
    data['date_of_notice'] = this.dateOfNotice;
    if (this.sender != null) {
      data['sender'] = this.sender?.toJson();
    }
    if (this.receiver != null) {
      data['receiver'] = this.receiver?.toJson();
    }
    data['name'] = this.name;
    data['amount_claimed'] = this.amountClaimed;
    return data;
  }
}

class Sender {
  int? id;
  String? entityName;
  String? created;
  String? modified;
  bool? isActive;
  bool? isDeleted;
  String? name;
  String? entity;
  String? unitVertical;
  String? sentAddress;
  String? email;
  String? phoneNumber;
  String? receiverName;
  bool? isSender;
  int? notice;

  Sender(
      {this.id,
      this.entityName,
      this.created,
      this.modified,
      this.isActive,
      this.isDeleted,
      this.name,
      this.entity,
      this.unitVertical,
      this.sentAddress,
      this.email,
      this.phoneNumber,
      this.receiverName,
      this.isSender,
      this.notice});

  Sender.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    entityName = json['entity_name'];
    created = json['created'];
    modified = json['modified'];
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    name = json['name'];
    entity = json['entity'];
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
    data['entity_name'] = this.entityName;
    data['created'] = this.created;
    data['modified'] = this.modified;
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['name'] = this.name;
    data['entity'] = this.entity;
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
  bool? isActive;
  bool? isDeleted;
  String? name;
  String? entity;
  String? unitVertical;
  String? sentAddress;
  String? email;
  String? phoneNumber;
  String? receiverName;
  bool? isSender;
  String? notice;

  Receiver(
      {this.isActive,
      this.isDeleted,
      this.name,
      this.entity,
      this.unitVertical,
      this.sentAddress,
      this.email,
      this.phoneNumber,
      this.receiverName,
      this.isSender,
      this.notice});

  Receiver.fromJson(Map<String?, dynamic> json) {
    isActive = json['is_active'];
    isDeleted = json['is_deleted'];
    name = json['name'];
    entity = json['entity'];
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
    data['is_active'] = this.isActive;
    data['is_deleted'] = this.isDeleted;
    data['name'] = this.name;
    data['entity'] = this.entity;
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

class AllLinkedCases {
  int? id;
  String? caseNo;
  String? titleCase;
  int? caseId;
  String? stageName;
  OtherData? otherData;

  AllLinkedCases(
      {this.id,
      this.caseNo,
      this.titleCase,
      this.caseId,
      this.stageName,
      this.otherData});

  AllLinkedCases.fromJson(Map<String?, dynamic> json) {
    id = json['id'];
    caseNo = json['case_no'];
    titleCase = json['title_case'];
    caseId = json['case_id'];
    stageName = json['stage_name'];
    otherData = json['other_data'] != null
        ? new OtherData.fromJson(json['other_data'])
        : null;
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['id'] = this.id;
    data['case_no'] = this.caseNo;
    data['title_case'] = this.titleCase;
    data['case_id'] = this.caseId;
    data['stage_name'] = this.stageName;
    if (this.otherData != null) {
      data['other_data'] = this.otherData?.toJson();
    }
    return data;
  }
}

class OtherData {
  String? ndoh;
  String? ndohr;
  String? pdoh;
  String? pdohr;

  OtherData({this.ndoh, this.ndohr, this.pdoh, this.pdohr});

  OtherData.fromJson(Map<String?, dynamic> json) {
    ndoh = json['ndoh'];
    ndohr = json['ndohr'];
    pdoh = json['pdoh'];
    pdohr = json['pdohr'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['ndoh'] = this.ndoh;
    data['ndohr'] = this.ndohr;
    data['pdoh'] = this.pdoh;
    data['pdohr'] = this.pdohr;
    return data;
  }
}

class Parties {
  String? name;
  bool? respondent;
  String? advocate;
  bool? petitioner;

  Parties({this.name, this.respondent, this.advocate, this.petitioner});

  Parties.fromJson(Map<String?, dynamic> json) {
    name = json['name'];
    respondent = json['respondent'];
    advocate = json['advocate'];
    petitioner = json['petitioner'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['name'] = this.name;
    data['respondent'] = this.respondent;
    data['advocate'] = this.advocate;
    data['petitioner'] = this.petitioner;
    return data;
  }
}

class CasePolicyDetails {
  String? customerName;
  String? claimNumber;
  String? policyNumber;

  CasePolicyDetails({this.customerName, this.claimNumber, this.policyNumber});

  CasePolicyDetails.fromJson(Map<String?, dynamic> json) {
    customerName = json['customer_name'];
    claimNumber = json['claim_number'];
    policyNumber = json['policy_number'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['customer_name'] = this.customerName;
    data['claim_number'] = this.claimNumber;
    data['policy_number'] = this.policyNumber;
    return data;
  }
}

class CasePerformanceCost {
  String? reason;
  double? cost;

  CasePerformanceCost({this.reason, this.cost});

  CasePerformanceCost.fromJson(Map<String?, dynamic> json) {
    reason = json['reason'];
    cost = json['cost'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    data['reason'] = this.reason;
    data['cost'] = this.cost;
    return data;
  }
}

class MetaData {
  MetaData.fromJson(Map<String?, dynamic> json) {}

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = new Map<String?, dynamic>();
    return data;
  }
}

class CompleteFollowerList {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? file;

  CompleteFollowerList({this.id, this.name, this.email, this.phone, this.file});

  CompleteFollowerList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['file'] = this.file;
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

  FollowersDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['file'] = this.file;
    return data;
  }
}
