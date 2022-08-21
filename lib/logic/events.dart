class Event {
  final String event_title;
  final String place;
  final String type;
  final String fromTime;
  final String toTime;
  final String foodAndBeverage;
  final String fromAge;
  final String toAge;
  final String comments;
  final bool paidEvent;
  final String malePrice;
  final String femalePrice;
  Event({
    required this.event_title,
    required this.place,
    required this.type,
    required this.fromTime,
    required this.toTime,
    required this.foodAndBeverage,
    required this.fromAge,
    required this.toAge,
    required this.comments,
    required this.paidEvent,
    required this.malePrice,
    required this.femalePrice,
  });

  Event copyWith({
    String? event_title,
    String? place,
    String? type,
    String? fromTime,
    String? toTime,
    String? foodAndBeverage,
    String? fromAge,
    String? toAge,
    String? comments,
    bool? paidEvent,
    String? malePrice,
    String? femalePrice,
  }) {
    return Event(
      event_title: event_title ?? this.event_title,
      place: place ?? this.place,
      type: type ?? this.type,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      foodAndBeverage: foodAndBeverage ?? this.foodAndBeverage,
      fromAge: fromAge ?? this.fromAge,
      toAge: toAge ?? this.toAge,
      comments: comments ?? this.comments,
      paidEvent: paidEvent ?? this.paidEvent,
      malePrice: malePrice ?? this.malePrice,
      femalePrice: femalePrice ?? this.femalePrice,
    );
  }
}
