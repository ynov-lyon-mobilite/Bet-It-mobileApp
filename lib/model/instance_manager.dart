import 'package:firebase_auth/firebase_auth.dart';

class InstanceManager {
  FirebaseAuth getFireAuthInstance() => FirebaseAuth.instance;
}