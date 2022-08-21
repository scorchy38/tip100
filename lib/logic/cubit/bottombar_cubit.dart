import 'package:bloc/bloc.dart';

part 'bottombar_state.dart';

class BottombarCubit extends Cubit<BottombarState> {
  BottombarCubit() : super(BottombarState(index: 0));
  void change(int index) {
    emit(BottombarState(index: index));
  }
}
