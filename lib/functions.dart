import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> getNameByUid(String uid) async {
  var name = 'Schüler konnte nicht gefunden werden';
  await FirebaseFirestore.instance
      .collection('Accounts')
      .doc(uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      name = documentSnapshot['name'];
    }
  });
  return name;
}
