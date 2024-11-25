import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_push_notification/main.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize the NotificationService and setup Firebase Messaging
  Future<void> initialize() async {
    // Request for permissions (required for iOS)
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Set up Firebase Messaging
    setupFirebaseMessaging();

    // Optionally: Get the device token to send notifications
    String? token = await _firebaseMessaging.getToken();
    print("Device Token: $token");
  }

  // Setup the Firebase Messaging listeners for foreground and background
  void setupFirebaseMessaging() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            defaultPresentAlert: true,
            defaultPresentBadge: true,
            defaultPresentBanner: true);
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {
        //foreground push notification handler
        navigateToSecondPage();
      },
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Message received: ${message.notification?.title}");
      if (message.notification != null) {
        showNotification(message);
      }
      // Handle foreground notification (display alert, show message, etc.)
    });

    // Handle when the app is opened from a notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //background notification handler
      print("Message onMessageOpenedApp: ${message.notification?.title}");
      navigateToSecondPage();
      // Handle notification tap (navigate to a specific screen, etc.)
    });

    FirebaseMessaging.onBackgroundMessage(backgroundHandler);

    FirebaseMessaging.instance.getInitialMessage().then(
      (RemoteMessage? value) {
        if (value != null) {
          //Terminated Message handler
          navigateToSecondPage();
        }
      },
    );
  }

  Future<void> showNotification(RemoteMessage message) async {
    var androidDetails = const AndroidNotificationDetails(
        'your_channel_id', 'your_channel_name',
        importance: Importance.high, channelShowBadge: true);

    var iosDetails = const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentBanner: true,
        presentList: true,
        presentSound: true);

    // Handle foreground notifications

    var platformDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      platformDetails,
    );
  }

  // Background message handler
  static Future<void> backgroundHandler(RemoteMessage message) async {
    print(
        "Handling background message or Terminated: ${message.notification?.title}");
    navigateToSecondPage();
    // Handle background notification (like updating the UI, logging, etc.)
  }

  static void navigateToSecondPage() {
    navigatorKey.currentState?.pushNamed('/secondPage');
  }
}
