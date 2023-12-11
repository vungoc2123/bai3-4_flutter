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
        return macos;
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
    apiKey: 'AIzaSyDSgJECCUJ2bIWc5C8qAoOa5bVK9WD-g3k',
    appId: '1:1093044046017:web:61e083562816897043ac40',
    messagingSenderId: '1093044046017',
    projectId: 'ban-hang-ec7a0',
    authDomain: 'ban-hang-ec7a0.firebaseapp.com',
    storageBucket: 'ban-hang-ec7a0.appspot.com',
    measurementId: 'G-E4T7GKJY68',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAMxqyjTR1jB_TCoX60GxTwrGhAjLf5Npc',
    appId: '1:1093044046017:android:b5a5f49502ef83c743ac40',
    messagingSenderId: '1093044046017',
    projectId: 'ban-hang-ec7a0',
    storageBucket: 'ban-hang-ec7a0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEj6oPAUkT-isTwg_YWiRJJJ0tMyiuKr4',
    appId: '1:1093044046017:ios:25e2164f47ac9dda43ac40',
    messagingSenderId: '1093044046017',
    projectId: 'ban-hang-ec7a0',
    storageBucket: 'ban-hang-ec7a0.appspot.com',
    iosBundleId: 'com.example.bai3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEj6oPAUkT-isTwg_YWiRJJJ0tMyiuKr4',
    appId: '1:1093044046017:ios:25e2164f47ac9dda43ac40',
    messagingSenderId: '1093044046017',
    projectId: 'ban-hang-ec7a0',
    storageBucket: 'ban-hang-ec7a0.appspot.com',
    iosBundleId: 'com.example.bai3',
  );
}
