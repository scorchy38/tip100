import 'package:bloc/bloc.dart';

part 'indicator_state.dart';

class IndicatorCubit extends Cubit<IndicatorState> {
  IndicatorCubit() : super(IndicatorState(counter: 0));

  void change(index) {
    print(index);
    emit(IndicatorState(counter: index));
  }
}
