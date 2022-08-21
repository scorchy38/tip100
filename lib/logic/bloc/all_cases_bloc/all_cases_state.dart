part of 'all_cases_bloc.dart';

// class AllCasesState {
//   int? case_id;
//   String? case_no;
//   String? title;
//   DOH? ndoh;
//   String? region;
//   String? loan_no;
//   DOH? pdoh;
//   String? stage;
//   String? client;
//   String? court;
//   String? city;
//   String? type;
//   String? court_name;
//   bool? case_active;
//   int? activity_status;
//   bool? tracking;
//   String? action;
//   bool? ticket_active;
//   int? court_data;
//   String? client_side;
//   AllCasesState({
//     this.case_id = 0,
//     this.case_no = '',
//     this.title = '',
//     this.region = '',
//     this.loan_no = '',
//     this.stage = '',
//     this.client = '',
//     this.type = '',
//     this.court = '',
//     this.city = '',
//     this.court_name = '',
//     this.case_active = false,
//     this.activity_status = 0,
//     this.tracking = false,
//     this.action = '',
//     this.ticket_active = false,
//     this.court_data = 0,
//     this.client_side = '',
//     this.ndoh,
//     this.pdoh,
//   });
//   Map<String, dynamic> toMap() {
//     return {
//       'case_id': case_id,
//       'case_no': case_no,
//       'title': title,
//       'ndoh': ndoh?.toJson(),
//       'region': region,
//       'loan_no': loan_no,
//       'pdoh': pdoh?.toJson(),
//       'stage': stage,
//       'client': client,
//       'court': court,
//       'city': city,
//       'type': type,
//       'court_name': court_name,
//       'case_active': case_active,
//       'activity_status': activity_status,
//       'tracking': tracking,
//       'action': action,
//       'ticket_active': ticket_active,
//       'court_data': court_data,
//       'client_side': client_side,
//     };
//   }
//
//   factory AllCasesState.fromMap(Map<String, dynamic> map) {
//     return AllCasesState(
//       case_id: map['case_id'],
//       case_no: map['case_no'].toString(),
//       title: map['title'].toString(),
//       ndoh: DOH.fromJson(map['ndoh']),
//       region: map['region'].toString(),
//       loan_no: map['loan_no'].toString(),
//       pdoh: DOH.fromJson(map['pdoh']),
//       stage: map['stage'].toString(),
//       client: map['client'].toString(),
//       court: map['court'].toString(),
//       city: map['city'].toString(),
//       type: map['type'].toString(),
//       court_name: map['court_name'].toString(),
//       tracking: map['tracking'],
//       action: map['action'].toString(),
//       ticket_active: map['ticket_active'],
//       court_data: map['court_data'],
//       client_side: map['client_side'].toString(),
//     );
//   }
//
//   String toJson() => json.encode(toMap());
//
//   factory AllCasesState.fromJson(String source) =>
//       AllCasesState.fromMap(json.decode(source));
//
//   // @override
//   // String toString() {
//   //   return 'EventState(event_main_pic: $img1, Request_Status: $Request_Status, event_map: $event_map, img2: $img2, img3: $img3, event_date: $event_date, img4: $img4, event_name: $title, food_bev: $food_bev, event_address: $place, video_url: $video_url, offering_option: $offering_option, type: $type, event_date: $from_time, to_time: $to_time, event_tags: $event_tags, age_from: $from_age, age_to: $to_age, Comments: $comments, paid_event: $paid_event, male_price: $male_price, female_price: $female_price, created_date: $created_date, female_no: $female_no, virtual_event: $virtual_event, event_id: $uid, photo_url: $photo_url, total_ticket_volume: $total_ticket_volume, formSubmissionStatus: $formSubmissionStatus)';
//   // }
//
// }
//
// class DOH {
//   int? status;
//   String? date;
//   String? remarks;
//
//   DOH({this.status, this.date, this.remarks});
//
//   DOH.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     date = json['date'];
//     remarks = json['remarks'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//
//     data['status'] = this.status;
//     data['date'] = this.date;
//     data['remarks'] = this.remarks;
//     return data;
//   }
// }

class AllCasesState {
  List<AllCasesModel>? all_cases;
  int? currPage;
  int? currSkip;
  int? currLimit;
  int? totalCases;
  bool? noCasesFound;

  AllCasesState(
      {this.all_cases = const [],
      this.currPage = 0,
      this.currSkip = 0,
      this.totalCases = 0,
      this.currLimit = 50,
      this.noCasesFound = false});

  AllCasesState copyWith({
    List<AllCasesModel>? all_cases,
    int? currPage,
    int? currSkip,
    int? currLimit,
    int? totalCases,
    bool? noCasesFound,
  }) {
    return AllCasesState(
      all_cases: all_cases ?? this.all_cases,
      currPage: currPage ?? this.currPage,
      currSkip: currSkip ?? this.currSkip,
      currLimit: currLimit ?? this.currLimit,
      totalCases: totalCases ?? this.totalCases,
      noCasesFound: noCasesFound ?? this.noCasesFound,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'all_cases': all_cases?.map((x) => x.toJson()).toList(),
      'currPage': currPage,
      'currSkip': currSkip,
      'currLimit': currLimit,
      'totalCases': totalCases,
      'noCasesFound': noCasesFound,
    };
  }

  factory AllCasesState.fromMap(Map<String, dynamic> map) {
    return AllCasesState(
      all_cases: List<AllCasesModel>.from(
          map['all_cases']?.map((x) => AllCasesModel.fromJson(x))),
      currLimit: map['currLimit'],
      currPage: map['currPage'],
      currSkip: map['currSkip'],
      totalCases: map['totalCases'],
      noCasesFound: map['noCasesFound'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AllCasesState.fromJson(String source) =>
      AllCasesState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventDisplayState(all_cases: $all_cases, currLimit: $currLimit, currPage: $currPage, currSkip: $currSkip, totalCases: $totalCases)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AllCasesState &&
        listEquals(other.all_cases, all_cases) &&
        other.currSkip == currSkip &&
        other.currPage == currPage &&
        other.totalCases == totalCases &&
        other.noCasesFound == noCasesFound &&
        other.currLimit == currLimit;
  }

  @override
  int get hashCode {
    return all_cases.hashCode ^
        currSkip.hashCode ^
        currPage.hashCode ^
        totalCases.hashCode ^
        noCasesFound.hashCode ^
        currLimit.hashCode;
  }
}
