import 'package:bet_it/utils/debug_logger.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseDatabase {
  static Future<FirebaseApp> initialize() async {
    DebugLogger.debugLog("firebase_database", "initialize", "Firebase initialization started...", 3);
    return Firebase.initializeApp();
  }
}