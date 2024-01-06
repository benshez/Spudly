import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spudly/models/models.dart';

class DatabaseService {
  static Future<void> init() async {
    var firebaseConfig = FirebaseOptions();

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
