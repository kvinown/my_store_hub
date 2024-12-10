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
    apiKey: 'AIzaSyD7s0g3efG4SKwJLtkyxZXMNtEDCo2_l30',
    appId: '1:111770954310:web:575309fe4e843bccf53847',
    messagingSenderId: '111770954310',
    projectId: 'mystorehub-3fc20',
    authDomain: 'mystorehub-3fc20.firebaseapp.com',
    storageBucket: 'mystorehub-3fc20.firebasestorage.app',
    measurementId: 'G-ZJH9C542EE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAArQ2b9SAxt7cq0NaOhbKxbbN11rkr9nc',
    appId: '1:111770954310:android:9eeeeac0dc28c95cf53847',
    messagingSenderId: '111770954310',
    projectId: 'mystorehub-3fc20',
    storageBucket: 'mystorehub-3fc20.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBxsOuBg0kJ86A2XVJDFjDth3Hsfq4p5s4',
    appId: '1:111770954310:ios:584f27f8bf383ca2f53847',
    messagingSenderId: '111770954310',
    projectId: 'mystorehub-3fc20',
    storageBucket: 'mystorehub-3fc20.firebasestorage.app',
    iosClientId: '111770954310-r07vj6r61u96rln00f27lrtf5j2fbn3c.apps.googleusercontent.com',
    iosBundleId: 'com.example.myStoreHub',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBxsOuBg0kJ86A2XVJDFjDth3Hsfq4p5s4',
    appId: '1:111770954310:ios:584f27f8bf383ca2f53847',
    messagingSenderId: '111770954310',
    projectId: 'mystorehub-3fc20',
    storageBucket: 'mystorehub-3fc20.firebasestorage.app',
    iosClientId: '111770954310-r07vj6r61u96rln00f27lrtf5j2fbn3c.apps.googleusercontent.com',
    iosBundleId: 'com.example.myStoreHub',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD7s0g3efG4SKwJLtkyxZXMNtEDCo2_l30',
    appId: '1:111770954310:web:b9d508c30f4a4789f53847',
    messagingSenderId: '111770954310',
    projectId: 'mystorehub-3fc20',
    authDomain: 'mystorehub-3fc20.firebaseapp.com',
    storageBucket: 'mystorehub-3fc20.firebasestorage.app',
    measurementId: 'G-8FJ8Z0KWX8',
  );
}
