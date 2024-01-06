import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:spudly/models/models.dart';

class AuthService {
  Rxn<User> firebaseUser = Rxn<User>();
  Rxn<UserModel> firestoreUser = Rxn<UserModel>();

  final RxBool admin = false.obs;

  FirebaseAuth auth() {
    return FirebaseAuth.instance;
  }

  Future<User> get getUser async => auth().currentUser!;
  Stream<User?> get user => auth().authStateChanges();

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    return await auth()
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    return await auth().signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
  }

  Future<void> signOut() {
    return auth().signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await auth().sendPasswordResetEmail(email: email);
  }

  bindFirestoreUserStream(Stream<UserModel?> stream) {
    firestoreUser.bindStream(stream);
  }

  bindFirebaseUserUserStream(Stream<User?> stream) {
    firebaseUser.bindStream(stream);
  }
}
