import 'package:flutter/material.dart';
import '../classList/getClass.dart';
import '../classList/classMemberCard.dart';

class classPage extends StatefulWidget {
  var classNumber;
  classPage({Key? key, required this.classNumber}) : super(key: key);
  @override
  State<classPage> createState() => _classPageState();
}

class _classPageState extends State<classPage> {
  var classMemberCards;
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
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(30, 20, 0, 0),
        child: Text('Klasse ' + widget.classNumber.toString(),
            style: TextStyle(fontSize: 27)),
      ),
    ));
  }
}
