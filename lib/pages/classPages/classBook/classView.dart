import 'package:flutter/material.dart';
import '../classList/getClass.dart';
import 'classViewCard.dart';

class classPage extends StatefulWidget {
  var classNumber;
  classPage({Key? key, required this.classNumber}) : super(key: key);
  @override
  State<classPage> createState() => _classPageState();
}

class _classPageState extends State<classPage> {
  List<Widget> classMemberCards = [];
  void createClassMemberCards() async {
    var classList = await getClassList(widget.classNumber);

    classList.forEach((member) {
      classMemberCards.add(classViewCard({
        'name': member['name'],
        'role': member['role'],
        'rights': member['rights'],
        'uid': member['uid'],
      }));
    });

    setState(() {
      classMemberCards;
    });
  }

  void initState() {
    createClassMemberCards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Stack(
          children: [
            Text('Klasse ' + widget.classNumber.toString(),
                style: TextStyle(fontSize: 27)),
            Container(
              margin: EdgeInsets.fromLTRB(10, 50, 0, 0),
              child: SingleChildScrollView(
                child: Column(
                  children: classMemberCards,
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
