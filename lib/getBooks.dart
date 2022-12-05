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
        userBooksVar.add(documentSnapshot);
      }
    });
  }
}

Future<List> returnBooks() async {
  var books = [];
  var bookSnapshot;
  for (int i = 0; i < userDataVar['books'].length; i++) {
    await FirebaseFirestore.instance
        .collection('Schools')
        .doc('DBS')
        .collection('Books')
        .doc(userDataVar['books'][i])
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        bookSnapshot = documentSnapshot;
      }
    });
    await FirebaseFirestore.instance
        .collection('Schools')
        .doc('DBS')
        .collection('BookType')
        .doc(bookSnapshot['bookType'])
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        books.add([documentSnapshot, bookSnapshot]);
      }
    });
  }

  return books;
}

Future<List> returnClassBooks() async {
  var books = [];
  var bookSnapshot;

  await FirebaseFirestore.instance
      .collection('Schools')
      .doc('DBS')
      .collection('Classes')
      .doc(bookSnapshot['bookType'])
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      books.add([documentSnapshot, bookSnapshot]);
    }
  });

  return books;
}
