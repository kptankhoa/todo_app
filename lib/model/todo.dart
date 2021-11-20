import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:todo_app/main.dart';

class ToDo {
  int id;
  String title;
  DateTime toDoTime;
  bool isDone;

  ToDo({
    required this.id,
    required this.title,
    required this.toDoTime,
    this.isDone = false,
  });

  void setDone() {
    isDone = true;
    removeNotification();
  }

  void removeNotification() async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'toDoTime': toDoTime.toIso8601String(),
        'isDone': isDone ? 1 : 0,
      };

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'toDoTime': toDoTime.toIso8601String(),
        'isDone': isDone
      };

  ToDo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        toDoTime = DateTime.parse(json['toDoTime']),
        isDone = json['isDone'];

  void scheduleAlarm() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      channelDescription: 'Channel for Alarm notification',
      sound: RawResourceAndroidNotificationSound('noti'),
    );

    var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
      sound: 'noti.wav',
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      '10 minutes till $title time',
      tz.TZDateTime.from(toDoTime, tz.local)
          .subtract(const Duration(minutes: 10)),
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }
}
