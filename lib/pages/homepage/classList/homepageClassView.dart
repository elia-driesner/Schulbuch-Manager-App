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

    var classTeacher = [];
    var classRepresentative = [];
    var students = [];

    for (int i = 0; i < classList.length; i++) {
      var member = classList[i];
      if (member['role'] == 'Klassenlehrer') {
        classTeacher.add(member);
      } else if (member['role'] == 'Klassensprecher') {
        classRepresentative.add(member);
      } else {
        classTeacher.add(member);
      }
      classList = students;
      classList.add(classRepresentative);
      classList.add(classTeacher);
    }
    var range;
    if (classList.length > 5) {
      range = 5;
    } else {
      range = classList.length;
    }

    for (int i = 0; i < range; i++) {
      classMemberCards.add(classMemberCard({
        'name': classList[i]['name'],
        'role': classList[i]['role'],
        'rights': classList[i]['rights']
      }));
    }
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
