import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:mediminder/app/router.gr.dart';
import '../app/locator.dart';

@lazySingleton
class NotificationService {
  NavigationService _navigationService = locator<NavigationService>();

  Future<void> initNotifications() async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    final MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future<dynamic> onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    _navigationService.navigateTo(Routes.medicineView(id: payload));
  }

  Future selectNotification(String payload) async {
    if (payload != null) {
      _navigationService.navigateTo(Routes.medicineView(id: payload));
    }
  }

  void requestIOSPermissions(FlutterLocalNotificationsPlugin notifsPlugin) {
    notifsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future<void> scheduleNotification(
      {int id,
      String title,
      String body,
      tz.TZDateTime scheduledTime,
      String payload}) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    tz.LocationDatabase();
    await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduledTime,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'medicine_reminder',
            'mediminder',
            'mediminder notification',
            ledColor: Color(0xFF3EB16F),
            ledOffMs: 1000,
            ledOnMs: 1000,
            enableLights: true,
          ),
        ),
        androidAllowWhileIdle: true,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: payload,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}
