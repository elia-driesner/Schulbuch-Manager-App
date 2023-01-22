import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../user_data_cache.dart';
import 'package:flutter/material.dart';

Future<List> getDamages(bookInfo) async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('Schools')
      .doc(userDataVar['school'])
      .collection('Books')
      .doc(bookInfo[1]['uid'])
      .collection('Damages')
      .get();
  final bookDamages = querySnapshot.docs.map((doc) => doc.data()).toList();

  return bookDamages;
}
