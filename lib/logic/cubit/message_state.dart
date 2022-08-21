part of 'message_cubit.dart';

@immutable
abstract class MessageState {}

class Inbox extends MessageState {}

class Announcements extends MessageState {}

class InnerCircle extends Inbox {}

class InboxGeneral extends Inbox {}

class InboxRequests extends Inbox {}

class PreviousEvents extends Announcements {}

class CurrentEvents extends Announcements {}

class InitialPreviousEventsState extends PreviousEvents {
  @override
  List<Object> get events => [];
}

class LoadingPreviousEventsState extends PreviousEvents {
  @override
  List<Object> get events => [];
}

class LoadedPreviousEventsState extends PreviousEvents {
  LoadedPreviousEventsState(this.previousEventsAnnouncements);

  final List<AnnouncementsModel> previousEventsAnnouncements;

  @override
  List<Object> get events => [previousEventsAnnouncements];
}

class ErrorPreviousEventsState extends PreviousEvents {
  @override
  List<Object> get events => [];
}
