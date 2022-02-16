import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InstanceManager {
  static FirebaseAuth getAuthInstance() => FirebaseAuth.instance;
  static FirebaseFirestore getDatabaseInstance() => FirebaseFirestore.instance;
}