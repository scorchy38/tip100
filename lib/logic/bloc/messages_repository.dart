import 'dart:convert';

import 'package:tip100/model/announcements_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AnnouncementsRepository {
  const AnnouncementsRepository(this.client);

  final Dio client;

  Future<List<AnnouncementsModel>> getPreviousEventsAnnouncements() async {
    try {
      final SharedPreferences _prefs = await SharedPreferences.getInstance();

      String userId = _prefs.getString("user_id")!;
      Map userData = json.decode(_prefs.getString("user_obj")!);
      final url =
          'https://nextopay.com/uploop/announcement.php?userid=${_prefs.getString("user_id")}&token=1234'
          // 'https://nextopay.com/uploop/announcement.php?userid=$userId&token=${userData['tocken']}'
          ;

      final response = await client.get(url);
      print(response);
      List<AnnouncementsModel> previousEvents = [];
      print('Previous Events $previousEvents');
      List events = response.data['data'].toList();
      print(events[0]);
      // events.forEach((element) {
      //   print('element $element');
      //   previousEvents.add(AnnouncementsModel.fromJson(element));
      // });
      print('Previous Events $previousEvents');
      return previousEvents;
    } catch (e) {
      throw e;
    }
  }
}
