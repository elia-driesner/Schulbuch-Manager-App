import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../user_data_cache.dart';

Future<bool> loginBook(bookCode, uid) async {
  var success = false;
  debugPrint(uid);
  await FirebaseFirestore.instance
      .collection('Schools')
      .doc(userDataVar['school'])
      .collection('Books')
      .doc(bookCode.toString())
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      DocumentReference userRef =
          FirebaseFirestore.instance.collection('Accounts').doc(uid);
      userRef.update({
        'books': FieldValue.arrayUnion([bookCode])
      });

      FirebaseFirestore.instance
          .collection('Schools')
          .doc(userDataVar['school'])
          .collection('Books')
          .doc(bookCode.toString())
          .update({'user': uid, 'lastActivity': FieldValue.serverTimestamp()});

      success = true;
    } else {
      debugPrint('Buch existiert nicht :(');
      success = false;
    }
  });
  return Future.value(success);
}

Future<bool> logoutBook(bookCode) async {
  var success = false;
  await FirebaseFirestore.instance
      .collection('Schools')
      .doc(userDataVar['school'])
      .collection('Books')
      .doc(bookCode.toString())
      .get()
      .then((DocumentSnapshot bookSnapshot) {
    if (bookSnapshot.exists) {
      DocumentReference userRef = FirebaseFirestore.instance
          .collection('Accounts')
          .doc(bookSnapshot['user']);
      userRef.update({
        'books': FieldValue.arrayRemove([bookCode])
      });

      success = true;
    } else {
      debugPrint('Buch existiert nicht :(');
      success = false;
    }
  });
  FirebaseFirestore.instance
      .collection('Schools')
      .doc(userDataVar['school'])
      .collection('Books')
      .doc(bookCode.toString())
      .update({'user': '', 'lastActivity': FieldValue.serverTimestamp()});

  return Future.value(success);
}
