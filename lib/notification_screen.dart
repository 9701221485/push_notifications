import 'package:flutter/material.dart';
import 'package:flutter_push_notification/main.dart';
import 'package:flutter_push_notification/pinScreen.dart';
import 'package:flutter_push_notification/secondPage.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
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

        final currentRoute = navigatorObserver.currentRouteName;
        print('Current route: $currentRoute');

        if (currentRoute != 'PinCodeVerificationScreen') {
          navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (context) => PinCodeVerificationScreen(
              phoneNumber: "9701221485",
              isSucess: (isVerified) => Navigator.of(context).pop(),
            ),
            settings: const RouteSettings(name: 'PinCodeVerificationScreen'),
          ));
        }
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
      body: Center(
        child: InkWell(
            onTap: () {
              navigatorKey.currentState?.push(MaterialPageRoute(
                builder: (context) => const Secondpage(),
              ));
            },
            child: const Text('Waiting for Testing...')),
      ),
    );
  }
}
