import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'user_data_cache.dart';

void getBooks() async {
  for (int i = 0; i < userDataVar['books'].length; i++) {
    await FirebaseFirestore.instance
        .collection('Schools')
        .doc('DBS')
        .collection('Books')
        .doc(userDataVar['books'][i])
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        debugPrint(documentSnapshot['name']);
      }
    });
  }
}
