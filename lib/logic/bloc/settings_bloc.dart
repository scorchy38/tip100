import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:tip100/logic/bloc/settings_repository.dart';
import 'package:dio/dio.dart';

import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'image_status.dart';
part 'settings_state.dart';
part 'settings_event.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository settingsRepository;
  SettingsBloc({required this.settingsRepository})
      : super(SettingsState(age: "20")) {}
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    print(_prefs.getString("user_obj"));
    Response response =
        await Dio().get('https://nextopay.com/uploop/settings?user_id=4');
    print(response.data);
    Map<String, dynamic> userData =
        json.decode(response.data)['data'].toList()[0];

    // final CollectionReference _mainCollection = _firestore.collection('users');

    // var snapshot = await _mainCollection
    //     .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
    //     .get();
    // print(snapshot.docs);

    if (event is SettingsInitial) {
      if (userData != null) {
        print(userData);
        yield SettingsState.fromMap(userData);
      }
    } else if (event is SettingsAgeChange) {
      // if (snapshot.docs.first.exists) {
      //   SettingsState settingsState = SettingsState.fromMap(
      //       snapshot.docs.first.data() as Map<String, dynamic>);
      //   await _mainCollection
      //       .doc(settingsState.id)
      //       .update(state.copyWith(age: event.age).toMap());
      // }
      yield state.copyWith(age: event.age);
    } else if (event is SettingsGenderChange) {
      // if (snapshot.docs.first.exists) {
      //   SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      //   await _mainCollection.doc(settingsState.id).update(state.copyWith(gender: event.gender).toMap());
      // }
      yield state.copyWith(gender: event.gender);
    } else if (event is SettingsAddImage) {
      yield state.copyWith(imageSubmissionStatus: ImageSubmitting());
      // print(event.image);
      // final _firebaseStorage = FirebaseStorage.instance;

      // String fileName = "";
      // var file = File(event.image);

      // var snapshot_img = await _firebaseStorage.ref().child('images/${FirebaseAuth.instance.currentUser?.uid}').putFile(file);

      // var downloadUrl = await snapshot_img.ref.getDownloadURL();
      // print(downloadUrl);

      // SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      // await _mainCollection.doc(settingsState.id).update(state.copyWith(imageUrl: downloadUrl).toMap());
      // await FirebaseAuth.instance.currentUser!.updatePhotoURL(downloadUrl);
      yield state.copyWith(imageUrl: event.image);
      yield state.copyWith(imageSubmissionStatus: ImageSubmissionSuccess());
    } else if (event is SettingsFirstNameChange) {
      // if (snapshot.docs.first.exists) {
      //   SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      //   await _mainCollection.doc(settingsState.id).update(state.copyWith(firstname: event.name).toMap());
      // }

      yield state.copyWith(firstname: event.name);
    } else if (event is SettingsInterestsChange) {
      print(event.interest);
      Set<String> interests = state.interests.toSet();
      interests.add(event.interest);
      // if (snapshot.docs.first.exists) {
      //   SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      //   await _mainCollection.doc(settingsState.id).update(state.copyWith(interests: interests.toList()).toMap());
      // }
      yield state.copyWith(interests: interests.toList());
    } else if (event is SettingsInterestDelete) {
      print(event.interest);
      List<String> interests = state.interests.toList();
      interests.remove(event.interest);
      // if (snapshot.docs.first.exists) {
      //   SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      //   await _mainCollection.doc(settingsState.id).update(state.copyWith(interests: interests.toList()).toMap());
      // }
      yield state.copyWith(interests: interests);
    } else if (event is SettingsAddSports) {
      print(event.sport);
      Set<String> sports = state.sports.toSet();
      print(sports);
      sports.add(event.sport);
      // if (snapshot.docs.first.exists) {
      //   SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      //   await _mainCollection.doc(settingsState.id).update(state.copyWith(sports: sports.toList()).toMap());
      // }
      yield state.copyWith(sports: sports.toList());
    } else if (event is SettingsDeleteSports) {
      print(event.sport);
      List<String> sports = state.sports.toList();
      sports.remove(event.sport);
      // if (snapshot.docs.first.exists) {
      //   SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      //   await _mainCollection.doc(settingsState.id).update(state.copyWith(sports: sports.toList()).toMap());
      // }
      yield state.copyWith(sports: sports);
    } else if (event is SettingsAddFood) {
      print(event.food);
      Set<String> foods = state.food.toSet();
      foods.add(event.food);
      print(foods);
      // if (snapshot.docs.first.exists) {
      //   SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      //   await _mainCollection.doc(settingsState.id).update(state.copyWith(food: foods.toList()).toMap());
      // }
      yield state.copyWith(food: foods.toList());
    } else if (event is SettingsDeleteFood) {
      print(event.food);
      List<String> foods = state.food.toList();
      foods.remove(event.food);
      // if (snapshot.docs.first.exists) {
      //   SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      //   await _mainCollection.doc(settingsState.id).update(state.copyWith(food: foods.toList()).toMap());
      // }
      yield state.copyWith(food: foods);
    } else if (event is SettingsAddCurrentEvent) {
      print(event.currEvent);
      Set<Map> movies = state.Current_event.toSet();
      movies.add(event.currEvent);
      print(movies);
      // if (snapshot.docs.first.exists) {
      //   SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      //   await _mainCollection.doc(settingsState.id).update(state.copyWith(moviePreferences: movies.toList()).toMap());
      // }
      yield state.copyWith(Current_event: movies.toList());
    } else if (event is SettingsDeleteCurrentEvent) {
      print(event.currEvent);
      List<Map> movies = state.Current_event.toList();
      print(movies);
      // if (snapshot.docs.first.exists) {
      //   SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      //   await _mainCollection.doc(settingsState.id).update(state.copyWith(moviePreferences: movies.toList()).toMap());
      // }
      movies.remove(event.currEvent);
      yield state.copyWith(Current_event: movies);
    } else if (event is SettingsAddPreviousEvent) {
      print(event.previousEvent);
      Set<Map> types = state.Previous_event.toSet();
      types.add(event.previousEvent);
      // if (snapshot.docs.first.exists) {
      //   SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      //   await _mainCollection.doc(settingsState.id).update(state.copyWith(moviePreferences: types.toList()).toMap());
      // }
      print(types);
      yield state.copyWith(Previous_event: types.toList());
    } else if (event is SettingsDeletePreviousEvent) {
      print(event.previousEvent);
      List<Map> types = state.Previous_event.toList();

      types.remove(event.previousEvent);
      // if (snapshot.docs.first.exists) {
      //   SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      //   await _mainCollection.doc(settingsState.id).update(state.copyWith(moviePreferences: types.toList()).toMap());
      // }
      yield state.copyWith(Previous_event: types);
    } else if (event is SettingsUpdateBio) {
      Map newState = state.toMap();
      log('New Settings');

      // log(newState.toMap().toString());
      final SharedPreferences _prefs = await SharedPreferences.getInstance();
      if (!state.imageUrl.toString().contains('http')) {
        var file2 = File(state.imageUrl);
        String fileName2 = file2.path.split('/').last;
        FormData formData = FormData.fromMap({
          'user_id': _prefs.getString('user_id'),
          "file": await MultipartFile.fromFile(file2.path, filename: fileName2),
          'first_name': state.firstname,
          'last_name': state.lastname,
          'email': state.email,
          'sex': state.gender,
          'bio': state.bio,
          'age': state.age,
          'travel': state.travel,
          'insta': state.instagram,
          'linken': state.linkedin,
          'gateway': state.accountProvider,
          'interest': state.interests
              .toString()
              .substring(1, state.interests.toString().length - 1),
          'food': state.food
              .toString()
              .substring(1, state.food.toString().length - 1),
          'music': state.music
              .toString()
              .substring(1, state.music.toString().length - 1),
          'sport': state.sports
              .toString()
              .substring(1, state.sports.toString().length - 1),
          'movie': state.movies
              .toString()
              .substring(1, state.movies.toString().length - 1),
          'personallity': state.personallity
              .toString()
              .substring(1, state.personallity.toString().length - 1),
          'noti_status': state.notifications == false ? 0 : 1,
//tocken:33210
//event_date:12-10-2022
//event_id:1
//         "file": await MultipartFile.fromFile(pic.path, filename: fileName),
//         'user_id': json.decode(_prefs.getString("user_obj")!)['user_id'],
//         'tocken': json.decode(_prefs.getString("user_obj")!)['tocken'],
//         'event_date': state.event_date
        });
        print(formData.fields);
        Response response = await Dio().post(
            'https://nextopay.com/uploop/update_settings',
            data: formData);
        print(response.data);
      } else {
        FormData formData = FormData.fromMap({
          'user_id': _prefs.getString('user_id'),

          'first_name': state.firstname,
          'last_name': state.lastname,
          'email': state.email,
          'sex': state.gender,
          'bio': state.bio,
          'age': state.age,
          'travel': state.travel,
          'insta': state.instagram,

          'linken': state.linkedin,
          'gateway': state.accountProvider,
          'interest': state.interests
              .toString()
              .substring(1, state.interests.toString().length - 1),
          'food': state.food
              .toString()
              .substring(1, state.food.toString().length - 1),
          'music': state.music
              .toString()
              .substring(1, state.music.toString().length - 1),
          'sport': state.sports
              .toString()
              .substring(1, state.sports.toString().length - 1),
          'movie': state.movies
              .toString()
              .substring(1, state.movies.toString().length - 1),
          'personallity': state.personallity
              .toString()
              .substring(1, state.personallity.toString().length - 1),
          'noti_status': state.notifications == true ? 0 : 1,
//tocken:33210
//event_date:12-10-2022
//event_id:1
//         "file": await MultipartFile.fromFile(pic.path, filename: fileName),
//         'user_id': json.decode(_prefs.getString("user_obj")!)['user_id'],
//         'tocken': json.decode(_prefs.getString("user_obj")!)['tocken'],
//         'event_date': state.event_date
        });
        print(formData.fields);
        Response response = await Dio().post(
            'https://nextopay.com/uploop/update_settings',
            data: formData);
        print(response.data);
      }

      // final SharedPreferences _prefs = await SharedPreferences.getInstance();
//--------
      // print(_prefs.getString("user_obj"));
      // Response response =
      //     await Dio().post('https://nextopay.com/uploop/settings');
      // print(response.data);
      // Map<String, dynamic> userData =
      //     json.decode(response.data)['data'].toList()[0];

      // if (snapshot.docs.first.exists) {
      //   SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      //   await _mainCollection.doc(settingsState.id).update(state.copyWith(moviePreferences: types.toList()).toMap());
      // }
      // yield state.copyWith(Previous_event: types);
    } else if (event is SettingsEventAdd) {
      // print("xyz " + FirebaseAuth.instance.currentUser!.uid);
      // final CollectionReference _mainCollection = _firestore.collection('users');

      // var snapshot = await _mainCollection.where('email', isEqualTo: event.email).get();
      // print(event.profile);

      // if (snapshot.docs.isEmpty) {
      //   String id = _mainCollection.doc().id;

      //   await _mainCollection.doc(id).set(SettingsState(
      //           email: event.email,
      //           profile: event.profile,
      //           id: id,
      //           uid: FirebaseAuth.instance.currentUser!.uid,
      //           accountProvider: event.accountProvider)
      //       .toMap());
      //   print("xyz" + id.toString());
      //   yield SettingsState(
      //       email: event.email, profile: event.profile, id: id, uid: FirebaseAuth.instance.currentUser!.uid, accountProvider: event.accountProvider);
      // }
    } else if (event is SettingsLastNameChange) {
      // SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      // await _mainCollection.doc(settingsState.id).update(state.copyWith(lastname: event.name).toMap());

      yield state.copyWith(lastname: event.name);
    } else if (event is SettingsEmailChange) {
      // SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      // await _mainCollection.doc(settingsState.id).update(state.copyWith(email: event.email).toMap());
      // FirebaseAuth.instance.currentUser!.updateEmail(event.email);
      yield state.copyWith(email: event.email);
    } else if (event is SettingsFacebookChange) {
      // SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      // await _mainCollection.doc(settingsState.id).update(state.copyWith(facebook: event.facebook).toMap());
      yield state.copyWith(facebook: event.facebook);
    } else if (event is SettingsInstagramChange) {
      // SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      // await _mainCollection.doc(settingsState.id).update(state.copyWith(instagram: event.instagtam).toMap());
      yield state.copyWith(instagram: event.instagtam);
    } else if (event is SettingsTwitterChange) {
      // SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      // await _mainCollection.doc(settingsState.id).update(state.copyWith(twitter: event.twitter).toMap());
      yield state.copyWith(twitter: event.twitter);
    } else if (event is SettingsTikTokChange) {
      // SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      // await _mainCollection.doc(settingsState.id).update(state.copyWith(tiktok: event.tiktok).toMap());
      yield state.copyWith(tiktok: event.tiktok);
    } else if (event is SettingsLinkedinChange) {
      // SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      // await _mainCollection.doc(settingsState.id).update(state.copyWith(linkedin: event.linkedin).toMap());
      yield state.copyWith(linkedin: event.linkedin);
    } else if (event is SettingsBioChange) {
      // SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      // await _mainCollection.doc(settingsState.id).update(state.copyWith(bio: event.bio).toMap());
      yield state.copyWith(bio: event.bio, firstname: 'Test First Name');
    } else if (event is SettingsTravelChange) {
      // SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      // await _mainCollection.doc(settingsState.id).set(state.copyWith(travel: event.times).toMap());
      yield state.copyWith(travel: event.times);
    } else if (event is SettingsToggleNotifications) {
      FormData formData = FormData.fromMap({
        'user_id': _prefs.getString('user_id'),
        "notifiaction": event.enabled == true ? 1 : 0,
      });
      print(formData.fields);
      Response response = await Dio()
          .post('https://nextopay.com/uploop/app_setting', data: formData);
      print(response.data);
      yield state.copyWith(notifications: event.enabled);

      // SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      // await _mainCollection.doc(settingsState.id).set(state.copyWith().toMap());
    } else if (event is SettingsToggleComments) {
      FormData formData = FormData.fromMap({
        'user_id': _prefs.getString('user_id'),
        "comments": event.enabled == true ? 1 : 0,
      });
      print(formData.fields);
      Response response = await Dio()
          .post('https://nextopay.com/uploop/app_setting', data: formData);
      print(response.data);
      yield state.copyWith(comments: event.enabled);
      // SettingsState settingsState = SettingsState.fromMap(snapshot.docs.first.data() as Map<String, dynamic>);
      // await _mainCollection.doc(settingsState.id).set(state.copyWith().toMap());
      yield state.copyWith(comments: event.enabled);
    }
  }
}
