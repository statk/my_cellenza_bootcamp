import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Notification {
  FlutterLocalNotificationsPlugin? _flutterLocalNotificationsPlugin;

  Future configureNotifications() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(onDidReceiveLocalNotification: (id, title, body, payload) async {});
    const MacOSInitializationSettings initializationSettingsMacOS = MacOSInitializationSettings();
    final InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS, macOS: initializationSettingsMacOS);
    await _flutterLocalNotificationsPlugin!
        .initialize(initializationSettings, onSelectNotification: (payload) async {});

    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Europe/Paris'));
  }

  Future scheduleNotification(String notificationTitle, String notificationBody) async {
    await _flutterLocalNotificationsPlugin?.zonedSchedule(
        0,
        notificationTitle,
        notificationBody,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 15)),
        const NotificationDetails(
            android: AndroidNotificationDetails('your channel id', 'your channel name',
                channelDescription: 'your channel description')),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
  }
}
