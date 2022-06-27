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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAPggvgvBpBWaaStoHq1PFffvLIwwlp1Pc',
    appId: '1:822462004287:web:5a89977da58486a814cc8a',
    messagingSenderId: '822462004287',
    projectId: 'sayhelloapp',
    authDomain: 'sayhelloapp.firebaseapp.com',
    storageBucket: 'sayhelloapp.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5EdFHzCwZbrMbr6dRAJkgEdWaXQmcG-o',
    appId: '1:822462004287:android:5310883f951c4d1c14cc8a',
    messagingSenderId: '822462004287',
    projectId: 'sayhelloapp',
    storageBucket: 'sayhelloapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBMEdtS4CqveIYM274Zf6a0wkI790aQdbY',
    appId: '1:822462004287:ios:66940c0373ecb93714cc8a',
    messagingSenderId: '822462004287',
    projectId: 'sayhelloapp',
    storageBucket: 'sayhelloapp.appspot.com',
    iosClientId: '822462004287-o4m6hnsvqr4085fqnrk3l84bhtk46tm4.apps.googleusercontent.com',
    iosBundleId: 'com.example.sayHelloChat',
  );
}