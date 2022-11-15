import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../../user_data_cache.dart';

Future<List> getClassMember() async {
  var students;
  var classRepresentative;
  var classTeacher;

  var classMember;
  await FirebaseFirestore.instance
      .collection('Schools')
      .doc(userDataVar['school'])
      .collection('Classes')
      .doc('Class ' + userDataVar['class'].toString())
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      students = documentSnapshot['students'];
      classRepresentative = documentSnapshot['classRepresentative'];
      classTeacher = documentSnapshot['classTeacher'];

      classMember.add(classTeacher);
      classMember.add(classRepresentative);
      classMember.add(students);
    }
  });
  return classMember;
}
