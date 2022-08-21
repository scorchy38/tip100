import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_event_state.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  CreateEventCubit()
      : super(CreateEventState(
          event_title: "",
          paidEvent: false,
          place: "",
          fromTime: "",
          toTime: "",
          toAge: "",
          fromAge: "",
          comments: "",
          malePrice: "",
          femalePrice: "",
          foodAndBeverage: "",
          type: "",
        ));
}

// void addTitle(String title) {
//   emit(state.copyWith(event_title: title));
// }
//   void addTitle(String title) {
//   emit(state.copyWith(event_title: title));
// }
//   void addTitle(String title) {
//   emit(state.copyWith(event_title: title));
// }
//   void addTitle(String title) {
//   emit(state.copyWith(event_title: title));
// }
//   void addTitle(String title) {
//   emit(state.copyWith(event_title: title));
// }
