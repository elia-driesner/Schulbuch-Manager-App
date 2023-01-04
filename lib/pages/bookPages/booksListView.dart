import 'package:flutter/material.dart';
import 'bookCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../user_data_cache.dart';
import '../classPages/classBook/getBooks.dart';

class bookListView extends StatefulWidget {
  var userCred;
  bookListView({Key? key, required this.userCred}) : super(key: key);

  @override
  State<bookListView> createState() => _bookListViewState();
}

class _bookListViewState extends State<bookListView> {
  var _user;

  var bookCards = <Widget>[];

  void creataBookCards() async {
    if (widget.userCred[0] == 'undefined') {
      widget.userCred[0] = await getStudentBooks(widget.userCred[2]);
    }
    debugPrint(widget.userCred[1]);
    var allBooks = await returnBooks(widget.userCred[0], widget.userCred[1]);
    userBooksVar = allBooks;
    var bookCardsPlaceholder = <Widget>[];

    for (int i = 0; i < allBooks.length; i++) {
      // bookCardsPlaceholder.add(Text(allBooks[i]['name']));
      bookCardsPlaceholder.add(bookCard(bookInfo: allBooks[i]));
    }
    setState(() {
      bookCards = bookCardsPlaceholder;
    });
  }

  @override
  void initState() {
    creataBookCards();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 220,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: bookCards,
        ),
      )
    ]);
  }
}
