import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'event_images_state.dart';

class EventImagesCubit extends Cubit<EventImagesState> {
  EventImagesCubit() : super(EventImagesInitial());
}
