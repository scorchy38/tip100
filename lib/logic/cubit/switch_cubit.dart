import 'package:bloc/bloc.dart';

part 'switch_state.dart';

class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(SwitchState(noOfFilters: 0, filtersSelected: []));

  void increase(String filterName) {
    int number = state.noOfFilters + 1;
    List<String> filters = state.filtersSelected;
    filters.add(filterName);
    print(filters);
    emit(SwitchState(noOfFilters: number, filtersSelected: filters));
  }

  void toggleFilter(String filterName, bool remove) {
    List<String> filters = state.filtersSelected;
    int number = 0;
    if (remove) {
      filters.remove(filterName);
      number = state.noOfFilters - 1;
    } else {
      if (!filters.contains(filterName)) {
        filters.add(filterName);
        number = state.noOfFilters + 1;
      }
    }

    print(filters);
    emit(SwitchState(noOfFilters: number, filtersSelected: filters));
  }

  void decrease(String filterName) {
    int number = state.noOfFilters - 1;
    List<String> filters = state.filtersSelected;
    filters.removeWhere((element) => element == filterName);
    print(filters);
    emit(SwitchState(noOfFilters: number, filtersSelected: filters));
  }
}
