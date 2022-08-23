import 'package:flutter/material.dart';
import 'widgets/bookCard.dart';

class bookListView extends StatelessWidget {
  const bookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text('Meine Bücher:', style: const TextStyle(fontSize: 25))),
      Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 200,
        child: ListView(
          // This next line does the trick.
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
