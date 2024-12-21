import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'No Web options have been provided yet - configure Firebase for Web',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.android:
        throw UnsupportedError(
          'Android platform not configured yet.',
        );
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'iOS platform not configured yet.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyClE5t2i3pFpg5vzc0RDmrVJQreD4cgzvI',
    appId: '1:845084220808:ios:256647e78dd93c24096e3d',
    messagingSenderId: '845084220808',
    projectId: 'recco-59d89',
    storageBucket: 'recco-59d89.firebasestorage.app',
  );

  // Add other platform configurations as needed
} 