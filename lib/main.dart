import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_push_notification/currentNavigationObserver.dart';
import 'package:flutter_push_notification/firebase_options.dart';
import 'package:flutter_push_notification/notification_screen.dart';
import 'package:flutter_push_notification/pinScreen.dart';
import 'package:flutter_push_notification/secondPage.dart';
import 'notification_service.dart'; // Import the NotificationService class

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final navigatorObserver = CustomNavigatorObserver();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize NotificationService to set up Firebase Messaging
  NotificationService().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Push Notifications',
      home: PinCodeVerificationScreen(
        isSucess: (bool isVerified) {
          if (isVerified) {
            navigatorKey.currentState?.push(MaterialPageRoute(
              builder: (context) => const NotificationScreen(),
              settings: const RouteSettings(name: 'NotificationScreen'),
            ));
          }
        },
      ),
      navigatorKey: navigatorKey,
      navigatorObservers: [navigatorObserver],
      routes: {
        '/secondPage': (context) => const Secondpage(),
        '/pinScreen': (context) => PinCodeVerificationScreen(
              isSucess: (bool isVerified) {},
            )
      },
    );
  }
}
