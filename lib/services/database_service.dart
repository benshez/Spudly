import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spudly/models/models.dart';

class DatabaseService {
  static Future<void> init() async {
    var firebaseConfig = FirebaseOptions(
        apiKey: "AIzaSyD_qohkbjnznHZQI2pduNASP6mZ2ujwyK8",
        appId: "1:372332871040:web:258f4a31e6e6351981d565",
        authDomain: "spudly-f1a05.firebaseapp.com",
        projectId: "spudly-f1a05",
        storageBucket: "spudly-f1a05.appspot.com",
        messagingSenderId: "372332871040",
        measurementId: "G-VHEWP9BL66");

    await Firebase.initializeApp(options: firebaseConfig);
  }

  FirebaseFirestore database() {
    return FirebaseFirestore.instance;
  }

  Future<UserModel> getFirestoreUser(String uid) async {
    return await database().doc('/users/${uid}').get().then(
        (documentSnapshot) => UserModel.fromMap(documentSnapshot.data()!));
  }

  Stream<UserModel> streamFirestoreUser(String uid) {
    return database()
        .doc('/users/${uid}')
        .snapshots()
        .map((snapshot) => UserModel.fromMap(snapshot.data()!));
  }

  Future<bool> isAdmin(String uid) async {
    DocumentSnapshot adminRef =
        await database().collection('admin').doc(uid).get();

    return adminRef.exists || false;
  }

  Future<void> updateUserFirestore(UserModel user, User _firebaseUser) async {
    await database().doc('/users/${_firebaseUser.uid}').update(user.toJson());
  }

  Future<void> createUserFirestore(UserModel user, User _firebaseUser) async {
    await database().doc('/users/${_firebaseUser.uid}').set(user.toJson());
  }
}
