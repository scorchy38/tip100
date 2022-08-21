part of 'announcements_cubit.dart';

// @immutable
abstract class AnnouncementState {}

class AnnouncementInitial extends AnnouncementState {}

class AnnouncementLoaded extends AnnouncementState {}

class AnnouncementError extends AnnouncementState {}
