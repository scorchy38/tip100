import 'package:tip100/logic/bloc/messages_repository.dart';
import 'package:tip100/model/announcements_model.dart';
import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit({required this.repository}) : super(InnerCircle()) {
    getTrendingMovies();
  }
  final AnnouncementsRepository repository;

  void getTrendingMovies() async {
    try {
      emit(LoadingPreviousEventsState());
      final movies = await repository.getPreviousEventsAnnouncements();
      print('Announcements- $movies');
      emit(LoadedPreviousEventsState(movies));
    } catch (e) {
      emit(ErrorPreviousEventsState());
    }
  }

  void changeStatetoInbox() => emit(Inbox());
  void changeStatetoAnnouncements() => emit(Announcements());
  void changeStatetoInnerCircle() => emit(InnerCircle());
  void changeStatetoGeneral() => emit(InboxGeneral());
  void changeStatetoRequests() => emit(InboxRequests());
  void changeStatetoPreviousEvents() => emit(PreviousEvents());
  void changeStatetoCurrentEvents() => emit(CurrentEvents());
}
