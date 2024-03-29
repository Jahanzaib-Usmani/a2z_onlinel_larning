// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members

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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD5hgaHbhns3zwK5QLhu7_lLfQVL-tF_vo',
    appId: '1:1076029723300:web:0da0753a3db4cc1c35cc31',
    messagingSenderId: '1076029723300',
    projectId: 'a2zonlinelearning-dc309',
    authDomain: 'a2zonlinelearning-dc309.firebaseapp.com',
    storageBucket: 'a2zonlinelearning-dc309.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAdx9dOPRxaM1ii19pUHaAZ4jNfcuvZ-w',
    appId: '1:1076029723300:android:6dd9ee0d9a00368e35cc31',
    messagingSenderId: '1076029723300',
    projectId: 'a2zonlinelearning-dc309',
    storageBucket: 'a2zonlinelearning-dc309.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOKsF4vkvWLSpy5qjU-vHF79x3FbKTQUQ',
    appId: '1:1076029723300:ios:cbdc2e7b0ad5802335cc31',
    messagingSenderId: '1076029723300',
    projectId: 'a2zonlinelearning-dc309',
    storageBucket: 'a2zonlinelearning-dc309.appspot.com',
    iosClientId:
        '1076029723300-539jp68gl244aef2rdii0d34qql3ojv0.apps.googleusercontent.com',
    iosBundleId: 'com.example.a2zOnlineLearning',
  );
}
