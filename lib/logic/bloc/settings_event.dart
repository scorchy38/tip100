part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent {}

class SettingsInitial extends SettingsEvent {}

class SettingsAgeChange extends SettingsEvent {
  String age;
  SettingsAgeChange({
    required this.age,
  });
}

class SettingsUpdateBio extends SettingsEvent {
  // SettingsState newSettings;
  SettingsUpdateBio(
      // {
      // required this.newSettings,
      // }
      );
}

class SettingsFirstNameChange extends SettingsEvent {
  String name;
  SettingsFirstNameChange({
    required this.name,
  });
}

class SettingsLastNameChange extends SettingsEvent {
  String name;
  SettingsLastNameChange({
    required this.name,
  });
}

class SettingsEmailChange extends SettingsEvent {
  String email;
  SettingsEmailChange({
    required this.email,
  });
}

class SettingsGenderChange extends SettingsEvent {
  String gender;
  SettingsGenderChange({
    required this.gender,
  });
}

class SettingsBioChange extends SettingsEvent {
  String bio;
  SettingsBioChange({
    required this.bio,
  });
}

class SettingsFacebookChange extends SettingsEvent {
  String facebook;
  SettingsFacebookChange({
    required this.facebook,
  });
}

class SettingsInstagramChange extends SettingsEvent {
  String instagtam;
  SettingsInstagramChange({
    required this.instagtam,
  });
}

class SettingsTwitterChange extends SettingsEvent {
  String twitter;
  SettingsTwitterChange({
    required this.twitter,
  });
}

class SettingsTikTokChange extends SettingsEvent {
  String tiktok;
  SettingsTikTokChange({
    required this.tiktok,
  });
}

class SettingsLinkedinChange extends SettingsEvent {
  String linkedin;
  SettingsLinkedinChange({
    required this.linkedin,
  });
}

class SettingsInterestsChange extends SettingsEvent {
  String interest;
  SettingsInterestsChange({
    required this.interest,
  });
}

class SettingsInterestDelete extends SettingsEvent {
  String interest;
  SettingsInterestDelete({
    required this.interest,
  });
}

class SettingsAddSports extends SettingsEvent {
  String sport;
  SettingsAddSports({
    required this.sport,
  });
}

class SettingsDeleteSports extends SettingsEvent {
  String sport;
  SettingsDeleteSports({
    required this.sport,
  });
}

class SettingsAddFood extends SettingsEvent {
  String food;
  SettingsAddFood({
    required this.food,
  });
}

class SettingsDeleteFood extends SettingsEvent {
  String food;
  SettingsDeleteFood({
    required this.food,
  });
}

class SettingsAddCurrentEvent extends SettingsEvent {
  Map currEvent;
  SettingsAddCurrentEvent({
    required this.currEvent,
  });
}

class SettingsDeleteCurrentEvent extends SettingsEvent {
  Map currEvent;
  SettingsDeleteCurrentEvent({
    required this.currEvent,
  });
}

class SettingsAddTag extends SettingsEvent {
  String tag;
  SettingsAddTag({
    required this.tag,
  });
}

class SettingsDeleteTag extends SettingsEvent {
  String tag;
  SettingsDeleteTag({
    required this.tag,
  });
}

class SettingsAddPreviousEvent extends SettingsEvent {
  Map previousEvent;
  SettingsAddPreviousEvent({
    required this.previousEvent,
  });
}

class SettingsDeletePreviousEvent extends SettingsEvent {
  Map previousEvent;
  SettingsDeletePreviousEvent({
    required this.previousEvent,
  });
}

class SettingsAddPersonality extends SettingsEvent {
  String type;
  SettingsAddPersonality({
    required this.type,
  });
}

class SettingsDeletePersonality extends SettingsEvent {
  String type;
  SettingsDeletePersonality({
    required this.type,
  });
}

class SettingsTravelChange extends SettingsEvent {
  String times;
  SettingsTravelChange({
    required this.times,
  });
}

class SettingsEventAdd extends SettingsEvent {
  String email;
  String profile;
  String accountProvider;

  SettingsEventAdd(
      {required this.email, required this.profile, this.accountProvider = ''});
}

class SettingsAddImage extends SettingsEvent {
  String image;
  SettingsAddImage({
    required this.image,
  });
}

class SettingsToggleNotifications extends SettingsEvent {
  bool enabled;
  SettingsToggleNotifications({
    required this.enabled,
  });
}

class SettingsToggleComments extends SettingsEvent {
  bool enabled;
  SettingsToggleComments({
    required this.enabled,
  });
}
