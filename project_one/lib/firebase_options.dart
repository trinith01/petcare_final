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
    apiKey: 'AIzaSyB9HBTpY_JKm_TUNdUSfE50D14n_Lruhjg',
    appId: '1:915399402938:web:d0afcb017f560b8a5c6983',
    messagingSenderId: '915399402938',
    projectId: 'users-7fb0c',
    authDomain: 'users-7fb0c.firebaseapp.com',
    storageBucket: 'users-7fb0c.firebasestorage.app',
    measurementId: 'G-28CV3G97N8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZGS4_qkPMzW92t6-3YDGQRmdY6r2dlLM',
    appId: '1:915399402938:android:e2cf74a5f7d82a6c5c6983',
    messagingSenderId: '915399402938',
    projectId: 'users-7fb0c',
    storageBucket: 'users-7fb0c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2r1KyYTIqLQvUdzIPG1dst70AhemR7GE',
    appId: '1:915399402938:ios:94510c2c18b51e3a5c6983',
    messagingSenderId: '915399402938',
    projectId: 'users-7fb0c',
    storageBucket: 'users-7fb0c.firebasestorage.app',
    iosBundleId: 'com.example.projectOne',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2r1KyYTIqLQvUdzIPG1dst70AhemR7GE',
    appId: '1:915399402938:ios:94510c2c18b51e3a5c6983',
    messagingSenderId: '915399402938',
    projectId: 'users-7fb0c',
    storageBucket: 'users-7fb0c.firebasestorage.app',
    iosBundleId: 'com.example.projectOne',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB9HBTpY_JKm_TUNdUSfE50D14n_Lruhjg',
    appId: '1:915399402938:web:f46fa7fb5102c0515c6983',
    messagingSenderId: '915399402938',
    projectId: 'users-7fb0c',
    authDomain: 'users-7fb0c.firebaseapp.com',
    storageBucket: 'users-7fb0c.firebasestorage.app',
    measurementId: 'G-SPWRYK2EBB',
  );
}
