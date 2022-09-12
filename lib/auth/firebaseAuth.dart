import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'globalAuthVariables.dart';

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
      return ('Ein unerwarteter Fehler ist aufgetreten.');
    }
    return null;
  }

  Future<String?> signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: this.email, password: this.password);

      return 'Ladet...';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('Kein account mir dieser email gefunden');
      } else if (e.code == 'wrong-password') {
        return ('Falsches Password');
      } else {
        debugPrint('**** Firebase error *****:   ' + e.code);
        return 'Ein unerwarteter Fehler ist aufgetreten';
      }
    }
  }

  Future<String?> addUserToFirestore() async {
    final user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      final name = user.displayName;
      final email = user.email;
      final photoUrl = user.photoURL;

      final emailVerified = user.emailVerified;

      final uid = await user.uid;
      DocumentReference userInSchool = FirebaseFirestore.instance
          .collection('Schools')
          .doc(selectionData['school'])
          .collection('Classes')
          .doc('Class ${selectionData['class']} students');
      userInSchool
          .set(
            {
              uid: {
                'name': 'name',
                'email': email,
                'rights': 0,
                'role': selectionData['role'],
                'parents': [],
                'electives': []
              }
            },
            SetOptions(merge: true),
          )
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

      await FirebaseFirestore.instance.collection('Accounts').doc(uid).set(
          {"school": selectionData['school'], 'class': selectionData['class']});
    }

    void verifyEmail() async {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
    }
  }
}
