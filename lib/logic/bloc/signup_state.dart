part of 'signup_bloc.dart';

class SignUpState {
  final String username;
  final String password;
  final String profile_type;
  final bool verified;
  final FormSubmissionStatus formSubmissionStatus;
  SignUpState({
    this.username = '',
    this.password = '',
    this.profile_type = 'Personal',
    this.verified = false,
    this.formSubmissionStatus = const InitialFormStatus(),
  });

  SignUpState copyWith({
    String? username,
    String? password,
    String? profile_type,
    bool? verified,
    FormSubmissionStatus? formSubmissionStatus,
  }) {
    return SignUpState(
      username: username ?? this.username,
      password: password ?? this.password,
      profile_type: profile_type ?? this.profile_type,
      verified: verified ?? this.verified,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
      'profile_type': profile_type,
      'verified': verified,
      // 'formSubmissionStatus': formSubmissionStatus.toMap(),
    };
  }

  factory SignUpState.fromMap(Map<String, dynamic> map) {
    return SignUpState(
      username: map['username'],
      password: map['password'],
      profile_type: map['profile_type'],
      verified: map['verified'],
      // formSubmissionStatus:
      //     FormSubmissionStatus.fromMap(map['formSubmissionStatus']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpState.fromJson(String source) =>
      SignUpState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SignUpState(username: $username, password: $password, profile_type: $profile_type, verified: $verified, formSubmissionStatus: $formSubmissionStatus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SignUpState &&
        other.username == username &&
        other.password == password &&
        other.profile_type == profile_type &&
        other.verified == verified &&
        other.formSubmissionStatus == formSubmissionStatus;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        profile_type.hashCode ^
        verified.hashCode ^
        formSubmissionStatus.hashCode;
  }
}
