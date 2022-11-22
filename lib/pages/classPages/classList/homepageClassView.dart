import 'package:flutter/material.dart';
import 'classMemberCard.dart';
import 'getClass.dart';

class homepageClassView extends StatefulWidget {
  homepageClassView({Key? key}) : super(key: key);

  @override
  State<homepageClassView> createState() => _homepageClassViewState();
}

class _homepageClassViewState extends State<homepageClassView> {
  List<Widget> classMemberCards = [];

  void createClassMemberCards() async {
    var classList = await getClassMember();

    classList.forEach((member) {
      classMemberCards.add(classMemberCard({
        'name': member['name'],
        'role': member['role'],
        'rights': member['rights']
      }));
    });

    setState(() {
      classMemberCards;
    });
  }

  @override
  void initState() {
    createClassMemberCards();
  }

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
      Column(children: classMemberCards)
    ]));
  }
}
