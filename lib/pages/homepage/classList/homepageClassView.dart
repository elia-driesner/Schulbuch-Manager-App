import 'package:flutter/material.dart';
import 'classMemberCard.dart';

class homepageClassView extends StatelessWidget {
  const homepageClassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
          margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: GestureDetector(
              child: Row(children: [
            Container(
              child: Text('Meine Klasse',
                  style: TextStyle(color: Color(0xFF4B4E5B), fontSize: 22)),
            ),
            Spacer(),
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: Icon(Icons.arrow_forward,
                    size: 25, color: Color(0xFF4B4E5B)))
          ]))),
      Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: classMemberCard(
            {'name': 'Roman Martens', 'role': 'Klassenlehrer', 'rights': 500}),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: classMemberCard(
            {'name': 'Erika Roth', 'role': 'Klassenlehrer', 'rights': 500}),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: classMemberCard(
            {'name': 'Schüler 1', 'role': 'Klassensprecher', 'rights': 250}),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: classMemberCard(
            {'name': 'Schüler 2', 'role': 'Klassensprecher', 'rights': 250}),
      ),
      Container(
        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: classMemberCard(
            {'name': 'Schüler 3', 'role': 'Schüler', 'rights': 200}),
      ),
    ]));
  }
}
