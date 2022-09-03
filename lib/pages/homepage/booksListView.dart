import 'package:flutter/material.dart';
import 'widgets/bookCard.dart';

class bookListView extends StatelessWidget {
  const bookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Meine Bücher:', style: TextStyle(fontSize: 25)),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child:
                      const Icon(Icons.arrow_forward, color: Color(0xFFDF5953)))
            ],
          )),
      Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 240,
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
