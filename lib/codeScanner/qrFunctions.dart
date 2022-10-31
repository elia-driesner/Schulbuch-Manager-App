import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../user_data_cache.dart';

void addBook(bookCode) async {
  await FirebaseFirestore.instance
      .collection('Schools')
      .doc(userDataVar['school'])
      .collection('Books')
      .doc(bookCode.toString())
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      DocumentReference userRef = FirebaseFirestore.instance
          .collection('Accounts')
          .doc(userDataVar['id']);
    }
  });
}
