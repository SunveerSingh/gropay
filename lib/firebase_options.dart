// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

// / Default [FirebaseOptions] for use with your Firebase apps.
// /
// / Example:
// / ```dart
// / import 'firebase_options.dart';
// / // ...
// / await Firebase.initializeApp(
// /   options: DefaultFirebaseOptions.currentPlatform,
// / );
// / ```

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
    apiKey: 'AIzaSyAel30ZeN_DEVL4K73GlSMs1ZtgiIXZEmU',
    appId: '1:546798052504:web:8175fbaafa5cc52fa25ced',
    messagingSenderId: '546798052504',
    projectId: 'growpayapp',
    authDomain: 'growpayapp.firebaseapp.com',
    storageBucket: 'growpayapp.appspot.com',
    measurementId: 'G-XN6J3ET8FD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDPniGirEPinGI0zNoRdFYvB578Pv8F3DE',
    appId: '1:546798052504:android:7a5e54df60c938cba25ced',
    messagingSenderId: '546798052504',
    projectId: 'growpayapp',
    storageBucket: 'growpayapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDabGhyLBfAd3UxOb5fF372CMkKM0Q0WIo',
    appId: '1:546798052504:ios:92cba27234bd459fa25ced',
    messagingSenderId: '546798052504',
    projectId: 'growpayapp',
    storageBucket: 'growpayapp.appspot.com',
    iosClientId:
        '546798052504-jg3htoomsdvgevq8nrvhtu1r6sfvbc54.apps.googleusercontent.com',
    iosBundleId: 'com.example.growpay',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDabGhyLBfAd3UxOb5fF372CMkKM0Q0WIo',
    appId: '1:546798052504:ios:92cba27234bd459fa25ced',
    messagingSenderId: '546798052504',
    projectId: 'growpayapp',
    storageBucket: 'growpayapp.appspot.com',
    iosClientId:
        '546798052504-jg3htoomsdvgevq8nrvhtu1r6sfvbc54.apps.googleusercontent.com',
    iosBundleId: 'com.example.growpay',
  );
}
