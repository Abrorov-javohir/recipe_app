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
    apiKey: 'AIzaSyAjx7gL-220r2uqQmDkSf0HZ_Qi_AWbHgY',
    appId: '1:6650490140:web:479ebf4af7ee1f46ae1ed9',
    messagingSenderId: '6650490140',
    projectId: 'recipe-app-c26b7',
    authDomain: 'recipe-app-c26b7.firebaseapp.com',
    storageBucket: 'recipe-app-c26b7.appspot.com',
    measurementId: 'G-8WHQ2JJZ3S',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDClPiFTPx0sJKatbo3EA6wk_CgdmfMXrU',
    appId: '1:6650490140:android:9fdb063d742d7776ae1ed9',
    messagingSenderId: '6650490140',
    projectId: 'recipe-app-c26b7',
    storageBucket: 'recipe-app-c26b7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCruYfFjVHR38cr0S5_DewKGXwQ1X1zlf0',
    appId: '1:6650490140:ios:591f18e3a71a6ca7ae1ed9',
    messagingSenderId: '6650490140',
    projectId: 'recipe-app-c26b7',
    storageBucket: 'recipe-app-c26b7.appspot.com',
    iosClientId: '6650490140-rto870bh8h7c7a5iov7vr5ms3uaej618.apps.googleusercontent.com',
    iosBundleId: 'com.example.recipeApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCruYfFjVHR38cr0S5_DewKGXwQ1X1zlf0',
    appId: '1:6650490140:ios:591f18e3a71a6ca7ae1ed9',
    messagingSenderId: '6650490140',
    projectId: 'recipe-app-c26b7',
    storageBucket: 'recipe-app-c26b7.appspot.com',
    iosClientId: '6650490140-rto870bh8h7c7a5iov7vr5ms3uaej618.apps.googleusercontent.com',
    iosBundleId: 'com.example.recipeApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAjx7gL-220r2uqQmDkSf0HZ_Qi_AWbHgY',
    appId: '1:6650490140:web:3ce6ce7c89014aaeae1ed9',
    messagingSenderId: '6650490140',
    projectId: 'recipe-app-c26b7',
    authDomain: 'recipe-app-c26b7.firebaseapp.com',
    storageBucket: 'recipe-app-c26b7.appspot.com',
    measurementId: 'G-WC2MHLN0SY',
  );

}