import 'package:alarm/model/alarm_settings.dart';

class NotificationSoundController{

  AlarmSettings notificationSound(){
    return AlarmSettings(
      id: 42,
      dateTime: DateTime.now(),
      assetAudioPath: 'assets/alarm.mp3',
      loopAudio: true,
      vibrate: true,
      volume: 0.8,
      fadeDuration: 3.0,
      notificationTitle: 'This is the title',
      notificationBody: 'This is the body',
      enableNotificationOnKill: true,
    );
  }

}