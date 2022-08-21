part of 'eventuser_bloc.dart';

@immutable
abstract class UserEvent {}

class UserEventAdd extends UserEvent {
  String email;
  String profile;
  String accountProvider;

  UserEventAdd(
      {required this.email, required this.profile, this.accountProvider = ''});
}
