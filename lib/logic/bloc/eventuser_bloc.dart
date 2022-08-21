import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'eventuser_event.dart';
part 'eventuser_state.dart';

class EventuserBloc extends Bloc<UserEvent, EventuserState> {
  EventuserBloc() : super(EventuserState());
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<EventuserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserEventAdd) {
      // final CollectionReference _mainCollection =
      //     _firestore.collection('users');

      // var snapshot =
      //     await _mainCollection.where('email', isEqualTo: event.email).get();
      // if (snapshot.docs.isEmpty) {
      //   String id = _mainCollection.doc().id;

      //   await _mainCollection.doc(id).set(state
      //       .copyWith(
      //           email: event.email,
      //           profile: event.profile,
      //           id: id,
      //           uid: FirebaseAuth.instance.currentUser!.uid,
      //           accountProvider: event.accountProvider)
      //       .toMap());

      //   print("xyz" + id.toString());
      // }

      yield state.copyWith(
        email: event.email,
        profile: event.profile,
      );
    }
  }
}
