import 'package:flutter/material.dart';
import 'classBook.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../user_data_cache.dart';

class bookListView extends StatefulWidget {
  bookListView({Key? key}) : super(key: key);

  @override
  State<bookListView> createState() => _bookListViewState();
}

class _bookListViewState extends State<bookListView> {
  var classBooks;
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 220,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: classBooks,
        ),
      )
    ]);
  }
}
