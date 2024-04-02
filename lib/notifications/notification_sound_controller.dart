import 'package:alarm/model/alarm_settings.dart';

class NotificationSoundController{

  AlarmSettings notificationSound(){
    return AlarmSettings(
      id: 1,
      dateTime: DateTime.now(),
      assetAudioPath: 'assets/notification-sound.mp3',
      loopAudio: true,
      vibrate: true,
      volume: 1,
      fadeDuration: 3.0,
      notificationTitle: '',
      notificationBody: '',
      enableNotificationOnKill: false,
    );
  }



}