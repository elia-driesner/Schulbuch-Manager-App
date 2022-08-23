import 'package:flutter/material.dart';
import 'widgets/bookCard.dart';

class bookListView extends StatelessWidget {
  const bookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Meine Bücher:', style: const TextStyle(fontSize: 25)),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child:
                      Icon(Icons.arrow_forward, color: const Color(0xFFDF5953)))
            ],
          )),
      Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        height: 240,
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
