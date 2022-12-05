import 'package:flutter/material.dart';
import 'classBook.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../user_data_cache.dart';
import '../../../getBooks.dart';

class classBookListView extends StatefulWidget {
  classBookListView({Key? key}) : super(key: key);

  @override
  State<classBookListView> createState() => _classBookListView();
}

class _classBookListView extends State<classBookListView> {
  List<Widget> classBooks = [classBook(grade: 10, backgroundColor: 0xFF6796FF)];
  void creataBookCards() async {
    var allBooks = await returnClassBooks();
    userBooksVar = allBooks;
    var bookCardsPlaceholder = <Widget>[];

    for (int i = 0; i < allBooks.length; i++) {
      // bookCardsPlaceholder.add(Text(allBooks[i]['name']));
      bookCardsPlaceholder
          .add(classBook(grade: allBooks[i][0]['Title'], backgroundColor: 1));
    }
    setState(() {
      classBooks = bookCardsPlaceholder;
    });
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 500,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: classBooks,
        ),
      )
    ]);
  }
}
