import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../../user_data_cache.dart';
import 'classMemberCard.dart';

Future<List> getClassMember() async {
  var classMember;

  var classTeacher = [];
  var classRepresentative = [];
  var students = [];

  await FirebaseFirestore.instance
      .collection('Schools')
      .doc(userDataVar['school'])
      .collection('Classes')
      .doc('Class ' + userDataVar['class'].toString())
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      classMember = documentSnapshot['Member'];
      classMember.forEach((member) {
        if (member['role'] == 'Klassenlehrer') {
          classTeacher.add(member);
        } else if (member['role'] == 'Klassensprecher') {
          classRepresentative.add(member);
        } else {
          students.add(member);
        }
      });
    }
  });
  classMember = classTeacher;
  classRepresentative.forEach((representative) {
    classMember.add(representative);
  });
  students.forEach((students) {
    classMember.add(students);
  });

  return classMember;
}

Future<List> getClassList(grade) async {
  var classMember;

  var classTeacher = [];
  var classRepresentative = [];
  var students = [];

  await FirebaseFirestore.instance
      .collection('Schools')
      .doc(userDataVar['school'])
      .collection('Classes')
      .doc('Class ' + grade.toString())
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      classMember = documentSnapshot['Member'];
      classMember.forEach((member) {
        if (member['role'] == 'Klassenlehrer') {
          classTeacher.add(member);
        } else if (member['role'] == 'Klassensprecher') {
          classRepresentative.add(member);
        } else {
          students.add(member);
        }
      });
    }
  });
  classMember = classTeacher;
  classRepresentative.forEach((representative) {
    classMember.add(representative);
  });
  students.forEach((students) {
    classMember.add(students);
  });

  return classMember;
}
