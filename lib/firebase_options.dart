// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDv4z4tMgkGVpRBztHaxntLJtXobSdZgDc',
    appId: '1:802219666712:web:ade3b65c0be71815ac426d',
    messagingSenderId: '802219666712',
    projectId: 'flutterpndemo',
    authDomain: 'flutterpndemo.firebaseapp.com',
    storageBucket: 'flutterpndemo.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGC5UDMUY32Lc0fAlBd_92HNxgikzdVVc',
    appId: '1:802219666712:android:e5c2fef1c3582134ac426d',
    messagingSenderId: '802219666712',
    projectId: 'flutterpndemo',
    storageBucket: 'flutterpndemo.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDVddkoFAQYkKQiaxdUc_AHR0cPuyS14zg',
    appId: '1:802219666712:ios:9a338d157780bd5aac426d',
    messagingSenderId: '802219666712',
    projectId: 'flutterpndemo',
    storageBucket: 'flutterpndemo.firebasestorage.app',
    iosBundleId: 'com.example.flutterPushNotification',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDVddkoFAQYkKQiaxdUc_AHR0cPuyS14zg',
    appId: '1:802219666712:ios:9a338d157780bd5aac426d',
    messagingSenderId: '802219666712',
    projectId: 'flutterpndemo',
    storageBucket: 'flutterpndemo.firebasestorage.app',
    iosBundleId: 'com.example.flutterPushNotification',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDv4z4tMgkGVpRBztHaxntLJtXobSdZgDc',
    appId: '1:802219666712:web:623b510cbf927783ac426d',
    messagingSenderId: '802219666712',
    projectId: 'flutterpndemo',
    authDomain: 'flutterpndemo.firebaseapp.com',
    storageBucket: 'flutterpndemo.firebasestorage.app',
  );
}