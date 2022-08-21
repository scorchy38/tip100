part of 'eventuser_bloc.dart';

class EventuserState {
  String email;
  String accountProvider;
  String profile;
  String id;
  String uid;

  EventuserState({
    this.email = '',
    this.accountProvider = '',
    this.profile = '',
    this.id = '',
    this.uid = '',
  });

  EventuserState copyWith({
    String? email,
    String? accountProvider,
    String? profile,
    String? id,
    String? uid,
  }) {
    return EventuserState(
      email: email ?? this.email,
      accountProvider: accountProvider ?? this.accountProvider,
      profile: profile ?? this.profile,
      id: id ?? this.id,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'accountProvider': accountProvider,
      'profile': profile,
      'id': id,
      'uid': uid,
    };
  }

  factory EventuserState.fromMap(Map<String, dynamic> map) {
    return EventuserState(
      email: map['email'],
      accountProvider: map['accountProvider'],
      profile: map['profile'],
      id: map['id'],
      uid: map['uid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EventuserState.fromJson(String source) =>
      EventuserState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EventuserState(email: $email, accountProvider: $accountProvider, profile: $profile, id: $id, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventuserState &&
        other.email == email &&
        other.accountProvider == accountProvider &&
        other.profile == profile &&
        other.id == id &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        accountProvider.hashCode ^
        profile.hashCode ^
        id.hashCode ^
        uid.hashCode;
  }
}
