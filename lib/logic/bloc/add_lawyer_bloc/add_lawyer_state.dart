part of 'add_lawyer_bloc.dart';


class AddLawyerState {
  String name;
  String gender;
  String number;
  String email;
  FormSubmissionStatus formSubmissionStatus;
  AddLawyerState({
    this.name = '',
    this.gender = '',
    this.number = '',
    this.email = '',

    this.formSubmissionStatus = const InitialFormStatus(),
  });
  AddLawyerState copyWith({
    String? name,
    String? gender,
    String? email,
    String? number,
    FormSubmissionStatus? formSubmissionStatus,
  }) {
    return AddLawyerState(
      name: name ?? this.name,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      number: number ?? this.number,

      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'email': email,
      'number': number,
      'formSubmissionStatus': formSubmissionStatus,
    };
  }

  factory AddLawyerState.fromMap(Map<String, dynamic> map) {
    return AddLawyerState(
      name: map['name'].toString(),
      gender: map['gender'].toString(),
      email: map['email'].toString(),
      number: map['number'].toString(),
      formSubmissionStatus: map['formSubmissionStatus'],
    );
  }
  String toJson() => json.encode(toMap());
  factory AddLawyerState.fromJson(String source) =>
      AddLawyerState.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddLawyerState(name: $name, gender: $gender, email: $email, number: $number, formSubmissionStatus: $formSubmissionStatus)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddLawyerState &&
        other.name == name &&
        other.gender == gender &&
        other.email == email &&
        other.number == number &&
        other.formSubmissionStatus == formSubmissionStatus;
  }

  @override
  int get hashCode {
    return name.hashCode ^
    gender.hashCode ^
    email.hashCode ^
    number.hashCode ^
        formSubmissionStatus.hashCode;
  }
}
