import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthDataSource extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      log(e.toString(), name: 'AuthDataSource :: signInWithEmail');
    }
  }

  Future<void> saveUserEmail(String email) async {
    await _usersCollection.add({'email': email});
  }

  Future<bool> hasEmail(String email) async {
    final QuerySnapshot result =
        await _usersCollection.where('email', isEqualTo: email).get();
    return result.docs.isNotEmpty;
  }

  Future<void> sendSignUpEmailVerification(String email) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: 'temporaryPassword',
      );
      await userCredential.user?.sendEmailVerification();
      // 사용자를 임시로 생성 후 로그아웃
      await _auth.signOut();
      // 임시 사용자 삭제
      await userCredential.user?.delete();
    } catch (e) {
      log(e.toString(), name: 'AuthDataSource :: sendSignUpEmailVerification');
    }
  }

  Future<bool> checkIfEmailVerified(String email) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: 'temporaryPassword',
      );
      await userCredential.user?.reload();
      bool isVerified = userCredential.user?.emailVerified ?? false;
      await _auth.signOut();
      return isVerified;
    } catch (e) {
      log(e.toString(), name: 'AuthDataSource :: checkIfEmailVerified');
      return false;
    }
  }

  Future<void> registerUser(String email, String password) async {
    bool isVerified = await checkIfEmailVerified(email);
    if (isVerified) {
      try {
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        await _usersCollection.add({
          'email': email,
          'uid': userCredential.user?.uid,
        });
      } catch (e) {
        log(e.toString(), name: 'AuthDataSource :: registerUser');
      }
    } else {
      log('Email not verified', name: 'AuthDataSource :: registerUser');
    }
  }

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      log(e.toString(), name: 'AuthDataSource :: signOut');
    }
  }
}
