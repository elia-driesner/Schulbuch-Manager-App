import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Auth {
  late String email;
  late String password;

  Auth({required this.email, required this.password});

  Future<String?> signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: this.email.toString(), password: this.password.toString());
      return ('Account erstellt');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return ('Password min. 6 Zeichen');
      } else if (e.code == 'email-already-in-use') {
        return ('Diese email wird schon benutzt');
      }
    } catch (e) {
      debugPrint(e.toString());
      return ('error');
    }
  }

  Future<String?> signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: this.email, password: this.password);
      final user = await FirebaseAuth.instance.currentUser;
      if (user != null) {
        final name = user.displayName;
        final email = user.email;
        final photoUrl = user.photoURL;

        final emailVerified = user.emailVerified;

        final uid = await user.uid;

        CollectionReference users =
            FirebaseFirestore.instance.collection('Users');
        users
            .doc(uid)
            .set({'email': this.email})
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      }
      return ('');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('Kein account mir dieser email gefunden');
      } else if (e.code == 'wrong-password') {
        return ('Falsches Password');
      }
    }
  }

  void verifyEmail() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }
}
