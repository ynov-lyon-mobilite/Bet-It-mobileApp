import 'package:bet_it/model/instance_manager.dart';
import 'package:bet_it/utils/debug_logger.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthManager {
  static Future<UserCredential?> createUserFirebase(String mailAddress, String password) async {
    try {
      return InstanceManager.getFireAuthInstance().createUserWithEmailAndPassword(
        email: mailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        DebugLogger.debugLog(
          "register_page",
          "buildConfirmationBtn",
          "Password provided is too weak",
          1,
        );
      } else if (e.code == 'email-already-in-use') {
        DebugLogger.debugLog(
          "register_page",
          "buildConfirmationBtn",
          "The account already exists for that email.",
          1,
        );
      }
    } catch (e) {
      DebugLogger.debugLog("register_page", "buildConfirmationBtn", e.toString(), 1);
    }
    return null;
  }

  static Future<void> fillInformationsInDatabase(
    String uid,
    String name,
    String surname,
    String nickname,
    String mailAddress,
    String country,
    String city,
    String ddn,
    String gender,
  ) async {
    var instance = InstanceManager.getFireStoreInstance();
    instance.collection("users").doc(uid).set({
      'name': name,
      'surname': surname,
      'nickname': nickname,
      'mailAddress': mailAddress,
      'birthCountry': country,
      'birthCity': city,
      'dateOfBirth': ddn,
      'gender': gender,
    });
  }
}