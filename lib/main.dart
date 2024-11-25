import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_push_notification/firebase_options.dart';
import 'package:flutter_push_notification/pinScreen.dart';
import 'package:flutter_push_notification/secondPage.dart';
import 'notification_service.dart'; // Import the NotificationService class

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
      home: const NotificationScreen(),
      navigatorKey: navigatorKey,
      routes: {'/secondPage': (context) => const Secondpage()},
    );
  }
}

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    // WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        print('App is detached');
        break;
      case AppLifecycleState.resumed:
        print('App is resumed');
        break;
      case AppLifecycleState.inactive:
        print('App is inactive');
        break;
      case AppLifecycleState.hidden:
        print('App is hidden');
        break;
      case AppLifecycleState.paused:
        print('App is paused');
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Push Notifications Example'),
      ),
      body: const Center(
        child: Text('Waiting for Testing...'),
      ),
    );
  }
}
