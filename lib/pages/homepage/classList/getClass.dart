import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../../user_data_cache.dart';
import 'classMemberCard.dart';

// classMemberCard(
//             {'name': 'Roman Martens', 'role': 'Klassenlehrer', 'rights': 500})

Future<List> getClassMember() async {
  var students;
  var classRepresentative;
  var classTeacher;

  var classMember;

  var memberCards;
  await FirebaseFirestore.instance
      .collection('Schools')
      .doc(userDataVar['school'])
      .collection('Classes')
      .doc('Class ' + userDataVar['class'].toString())
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      classMember.add(documentSnapshot['member']);
    }
  });

  for (var i = 0; i >= classMember.length; i++) {
    memberCards.add(classMemberCard({
      'name': classMember[i]['name'],
      'role': classMember[i]['role'],
      'rights': classMember[i]['rights']
    }));
  }
  return memberCards;
}
