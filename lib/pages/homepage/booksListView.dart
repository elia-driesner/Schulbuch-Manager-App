import 'package:flutter/material.dart';
import 'widgets/bookCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../user_data_cache.dart';

class bookListView extends StatelessWidget {
  const bookListView({Key? key}) : super(key: key);

  Future<List<book>> getUserBooks() async {
    return [book(name: '')];
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 220,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[

            bookCard(),
            bookCard(),
            bookCard(),
            bookCard(),
            bookCard(),
            bookCard(),

          ],
        ),
      )
    ]);
  }
}
