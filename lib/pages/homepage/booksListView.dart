import 'package:flutter/material.dart';
import 'widgets/bookCard.dart';

class bookListView extends StatelessWidget {
  const bookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 220,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const <Widget>[
            // ! remove const if getting books from firebase
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
