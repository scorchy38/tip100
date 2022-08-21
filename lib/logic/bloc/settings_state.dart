part of 'settings_bloc.dart';

class SettingsState {
  String age;
  List<String> interests;
  List<String> sports;
  List<String> food;
  List<String> movies;
  List<String> music;
  List<String> personallity;
  List<Map> Current_event;
  List<Map> Previous_event;
  List<Map> Tags;
  String firstname;
  String lastname;
  String email;
  String id;
  String uid;
  String accountProvider;
  String profile;
  String imageUrl;
  String gender;
  String bio;
  String facebook;
  String twitter;
  String tiktok;
  String linkedin;
  String instagram;
  String travel;
  ImageSubmissionStatus imageSubmissionStatus;
  bool notifications;
  bool comments;

  SettingsState({
    this.age = '',
    this.interests = const [],
    this.sports = const [],
    this.food = const [],
    this.movies = const [],
    this.music = const [],
    this.personallity = const [],
    this.Current_event = const [],
    this.Previous_event = const [],
    this.Tags = const [],
    this.firstname = '',
    this.lastname = '',
    this.email = '',
    this.id = '',
    this.uid = '',
    this.accountProvider = '',
    this.profile = '',
    this.imageUrl = '',
    this.gender = 'Male',
    this.bio = '',
    this.facebook = '',
    this.twitter = '',
    this.tiktok = '',
    this.linkedin = '',
    this.instagram = '',
    this.travel = '',
    this.imageSubmissionStatus = const InitialImageStatus(),
    this.notifications = true,
    this.comments = true,
  });

  SettingsState copyWith({
    String? age,
    List<String>? interests,
    List<String>? sports,
    List<String>? food,
    List<String>? movies,
    List<String>? music,
    List<String>? personallity,
    List<Map>? Current_event,
    List<Map>? Previous_event,
    List<Map>? Tags,
    String? firstname,
    String? lastname,
    String? email,
    String? id,
    String? uid,
    String? accountProvider,
    String? profile,
    String? imageUrl,
    String? gender,
    String? bio,
    String? facebook,
    String? twitter,
    String? tiktok,
    String? linkedin,
    String? instagram,
    String? travel,
    ImageSubmissionStatus? imageSubmissionStatus,
    bool? notifications,
    bool? comments,
  }) {
    return SettingsState(
      age: age ?? this.age,
      interests: interests ?? this.interests,
      sports: sports ?? this.sports,
      food: food ?? this.food,
      music: food ?? this.music,
      movies: food ?? this.movies,
      personallity: food ?? this.personallity,
      Current_event: Current_event ?? this.Current_event,
      Previous_event: Previous_event ?? this.Previous_event,
      Tags: Tags ?? this.Tags,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      id: id ?? this.id,
      uid: uid ?? this.uid,
      accountProvider: accountProvider ?? this.accountProvider,
      profile: profile ?? this.profile,
      imageUrl: imageUrl ?? this.imageUrl,
      gender: gender ?? this.gender,
      bio: bio ?? this.bio,
      facebook: facebook ?? this.facebook,
      twitter: twitter ?? this.twitter,
      tiktok: tiktok ?? this.tiktok,
      linkedin: linkedin ?? this.linkedin,
      instagram: instagram ?? this.instagram,
      travel: travel ?? this.travel,
      imageSubmissionStatus:
          imageSubmissionStatus ?? this.imageSubmissionStatus,
      notifications: notifications ?? this.notifications,
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'age': age,
      'interest': interests,
      'sport': sports,
      'food': food,
      'music': music,
      'movie': movies,
      'personallity': personallity,
      // 'Current_event': Current_event,
      // 'Previous_event': Previous_event,
      // 'Tags': Tags,
      'first_name': firstname,
      'last_name': lastname,
      'email': email,
      // 'id': id,
      // 'uid': uid,
      'gateway': accountProvider,
      // 'profile': profile,
      'pic': imageUrl,
      'sex': gender,
      'bio': bio,
      'fb': facebook,
      // 'twitter': twitter,
      // 'tiktok': tiktok,
      'linken': linkedin,
      'insta': instagram,
      'travel': travel,
      // 'imageSubmissionStatus': imageSubmissionStatus.toMap(),
      'notifications': notifications,
      // 'comments': comments,
    };
  }

  factory SettingsState.fromMap(Map<String, dynamic> map) {
    return SettingsState(
      age: map['age'],
      interests: List<String>.from(map['interest'].toString().split(',')),
      sports: List<String>.from(map['sport'].toString().split(',')),
      food: List<String>.from(map['food'].toString().split(',')),
      music: List<String>.from(map['music'].toString().split(',')),
      movies: List<String>.from(map['movie'].toString().split(',')),
      personallity:
          List<String>.from(map['personallity'].toString().split(',')),
      // Current_event: List<Map>.from(map['Current_event']),
      // Tags: List<Map>.from(map['Tags']),
      // Previous_event: map['Previous_event'] != null
      //     ? List<Map>.from(map['Previous_event'])
      //     : [],
      firstname: map['first_name'],
      lastname: map['last_name'],
      email: map['email'].toString(),
      // id: map['id'],
      // uid: map['uid'],
      accountProvider: map['gateway'],
      // profile: map['profile'],
      imageUrl: map['pic'],
      gender: map['sex'],
      bio: map['bio'],
      facebook: map['fb'],
      // twitter: map['twitter'],
      // tiktok: map['tiktok'],
      linkedin: map['linken'],
      instagram: map['insta'],
      travel: map['travel'],
      // imageSubmissionStatus:
      //     ImageSubmissionStatus.fromMap(map['imageSubmissionStatus']),
      notifications: map['noti_status'] == 'YES' ? true : false,
      // comments: map['comments'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingsState.fromJson(String source) =>
      SettingsState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SettingsState(age: $age, interests: $interests, sports: $sports, food: $food, Current_event: $Current_event, Previous_event: $Previous_event, Tags: $Tags, name: $firstname, l_name: $lastname, email: $email, id: $id, uid: $uid, accountProvider: $accountProvider, profile: $profile, imageUrl: $imageUrl, sex: $gender, info: $bio, fb: $facebook, twitter: $twitter, tiktok: $tiktok, linken: $linkedin, insta: $instagram, travel: $travel, imageSubmissionStatus: $imageSubmissionStatus, notifications: $notifications, comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SettingsState &&
        other.age == age &&
        listEquals(other.interests, interests) &&
        listEquals(other.sports, sports) &&
        listEquals(other.food, food) &&
        listEquals(other.Tags, Tags) &&
        listEquals(other.Current_event, Current_event) &&
        listEquals(other.Previous_event, Previous_event) &&
        other.firstname == firstname &&
        other.lastname == lastname &&
        other.email == email &&
        other.id == id &&
        other.uid == uid &&
        other.accountProvider == accountProvider &&
        other.profile == profile &&
        other.imageUrl == imageUrl &&
        other.gender == gender &&
        other.bio == bio &&
        other.facebook == facebook &&
        other.twitter == twitter &&
        other.tiktok == tiktok &&
        other.linkedin == linkedin &&
        other.instagram == instagram &&
        other.travel == travel &&
        other.imageSubmissionStatus == imageSubmissionStatus &&
        other.notifications == notifications &&
        other.comments == comments;
  }

  @override
  int get hashCode {
    return age.hashCode ^
        interests.hashCode ^
        sports.hashCode ^
        food.hashCode ^
        Current_event.hashCode ^
        Previous_event.hashCode ^
        Tags.hashCode ^
        firstname.hashCode ^
        lastname.hashCode ^
        email.hashCode ^
        id.hashCode ^
        uid.hashCode ^
        accountProvider.hashCode ^
        profile.hashCode ^
        imageUrl.hashCode ^
        gender.hashCode ^
        bio.hashCode ^
        facebook.hashCode ^
        twitter.hashCode ^
        tiktok.hashCode ^
        linkedin.hashCode ^
        instagram.hashCode ^
        travel.hashCode ^
        imageSubmissionStatus.hashCode ^
        notifications.hashCode ^
        comments.hashCode;
  }
}
