import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:firestore/config/env_settings.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DefaultFirebaseOptions {
  static late FirebaseOptions android;
  static late FirebaseOptions ios;

  static void initialize() {
    android = FirebaseOptions(
      apiKey: dotenv.env[EnvSettings.androidApiKey] ?? '',
      appId: dotenv.env[EnvSettings.androidAppId] ?? '',
      messagingSenderId: dotenv.env[EnvSettings.messagingSenderId] ?? '',
      projectId: dotenv.env[EnvSettings.projectId] ?? '',
      storageBucket: dotenv.env[EnvSettings.storageBucket] ?? '',
    );

    ios = FirebaseOptions(
      apiKey: dotenv.env[EnvSettings.iosApiKey] ?? '',
      appId: dotenv.env[EnvSettings.iosAppId] ?? '',
      messagingSenderId: dotenv.env[EnvSettings.messagingSenderId] ?? '',
      projectId: dotenv.env[EnvSettings.projectId] ?? '',
      storageBucket: dotenv.env[EnvSettings.storageBucket] ?? '',
      iosBundleId: dotenv.env[EnvSettings.iosBundleId] ?? '',
    );
  }

  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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
}
