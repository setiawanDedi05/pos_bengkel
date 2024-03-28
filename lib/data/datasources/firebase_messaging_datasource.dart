import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pos_bengkel/data/datasources/auth_local_datasource.dart';
import 'package:pos_bengkel/data/datasources/auth_remote_datasource.dart';

class FirebaseMessagingDatasource {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final flutterLocalNotificationPlugin = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission(
        alert: true, badge: true, sound: true);

    const initSettingAndroid = AndroidInitializationSettings('logo');

    const initSetting = InitializationSettings(android: initSettingAndroid);
    await flutterLocalNotificationPlugin.initialize(initSetting,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
    final fcmToken = await _firebaseMessaging.getToken();
    if(await AuthLocalDataSource().isAuth()){
      AuthRemoteDatasource().updateFCMToken(fcmToken!);
    }
    debugPrint(fcmToken.toString());
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {
      debugPrint(message.notification?.title);
      debugPrint(message.notification?.body);
    });

    FirebaseMessaging.onMessage.listen(firebaseBackgroundHandler);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(firebaseBackgroundHandler);
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    return flutterLocalNotificationPlugin.show(
      id,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'com.example.pos_bengkel',
          'app',
          importance: Importance.max
        ),
      ),
    );
  }

  Future<void> firebaseBackgroundHandler(RemoteMessage message) async {
    showNotification(title: message.notification!.title, body: message.notification!.body);
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  FirebaseMessagingDatasource().firebaseBackgroundHandler(message);
}
