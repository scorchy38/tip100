part of 'my_counsel_details_bloc.dart';

@immutable
abstract class MyCounselDetailsEvent {}

class GetMyCounselDetails extends MyCounselDetailsEvent {
  int id;
  GetMyCounselDetails(this.id);
}

class GetCaseItems extends MyCounselDetailsEvent {
  int id;
  GetCaseItems(this.id);
}

class GetDocStorageItems extends MyCounselDetailsEvent {
  int id;
  GetDocStorageItems(this.id);
}

class GetNoticeItems extends MyCounselDetailsEvent {
  int id;
  GetNoticeItems(this.id);
}

class RefreshingCounselDetails extends MyCounselDetailsEvent {}
