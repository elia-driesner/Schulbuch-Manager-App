import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../../user_data_cache.dart';

void getBooks() async {
  for (int i = 0; i < userDataVar['books'].length; i++) {
    await FirebaseFirestore.instance
        .collection('Schools')
        .doc(userDataVar['school'])
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

Future<List> returnBooks(userBooks, userSchool) async {
  var books = [];
  var bookSnapshot;

  for (int i = 0; i < userBooks.length; i++) {
    await FirebaseFirestore.instance
        .collection('Schools')
        .doc(userSchool)
        .collection('Books')
        .doc(userBooks[i])
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        bookSnapshot = documentSnapshot;
      }
    });
    await FirebaseFirestore.instance
        .collection('Schools')
        .doc(userSchool)
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

Future<List> getStudentBooks(uid) async {
  var books;

  await FirebaseFirestore.instance
      .collection('Accounts')
      .doc(uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      books = documentSnapshot['books'];
    }
  });
  return books;
}

Future<List> returnClassBooks() async {
  List<Map> books = [];
  var bookSnapshot;

  await FirebaseFirestore.instance
      .collection('Schools')
      .doc(userDataVar['school'])
      .collection('Classes')
      .doc('classBooks')
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      documentSnapshot['classBooks'].forEach((book) {
        books.add(book);
      });
    }
  });
  return books;
}
