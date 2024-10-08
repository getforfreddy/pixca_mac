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
    apiKey: 'AIzaSyA_1tRYQjbdoLvOXrWn7DsFwbwmO9Hj-00',
    appId: '1:557895252483:web:6ac5d4c22d4889ddd0ac36',
    messagingSenderId: '557895252483',
    projectId: 'pixca-d82c7',
    authDomain: 'pixca-d82c7.firebaseapp.com',
    storageBucket: 'pixca-d82c7.appspot.com',
    measurementId: 'G-1X8X5EFNN3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDHziXOUzIx77OWnXinmWSEEdx6Ilybmus',
    appId: '1:557895252483:android:6d6a22154fa5af9bd0ac36',
    messagingSenderId: '557895252483',
    projectId: 'pixca-d82c7',
    storageBucket: 'pixca-d82c7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqVV5_O8Y1FW_qQIST8oTRAaioRp_g1iU',
    appId: '1:557895252483:ios:bfa33807dcf20af7d0ac36',
    messagingSenderId: '557895252483',
    projectId: 'pixca-d82c7',
    storageBucket: 'pixca-d82c7.appspot.com',
    androidClientId: '557895252483-kbr0mf487d00nci471p11k41dlhtccvc.apps.googleusercontent.com',
    iosClientId: '557895252483-g8j5itiiltpcijlkml3bj19ujbmfjes0.apps.googleusercontent.com',
    iosBundleId: 'com.pixca.pixca',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqVV5_O8Y1FW_qQIST8oTRAaioRp_g1iU',
    appId: '1:557895252483:ios:bfa33807dcf20af7d0ac36',
    messagingSenderId: '557895252483',
    projectId: 'pixca-d82c7',
    storageBucket: 'pixca-d82c7.appspot.com',
    androidClientId: '557895252483-kbr0mf487d00nci471p11k41dlhtccvc.apps.googleusercontent.com',
    iosClientId: '557895252483-g8j5itiiltpcijlkml3bj19ujbmfjes0.apps.googleusercontent.com',
    iosBundleId: 'com.pixca.pixca',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA_1tRYQjbdoLvOXrWn7DsFwbwmO9Hj-00',
    appId: '1:557895252483:web:51849a8331a491f6d0ac36',
    messagingSenderId: '557895252483',
    projectId: 'pixca-d82c7',
    authDomain: 'pixca-d82c7.firebaseapp.com',
    storageBucket: 'pixca-d82c7.appspot.com',
    measurementId: 'G-XV1HEH3MER',
  );

}