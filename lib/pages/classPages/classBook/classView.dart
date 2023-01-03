import 'package:flutter/material.dart';
import '../classList/getClass.dart';
import 'classViewCard.dart';
import 'studentInfoView/studentView.dart';

class classPage extends StatefulWidget {
  var classNumber;
  classPage({Key? key, required this.classNumber}) : super(key: key);
  @override
  State<classPage> createState() => _classPageState();
}

class _classPageState extends State<classPage> {
  List<Widget> classMemberCards = [];
  final snackBar = SnackBar(
    content: const Text(
      'Bitte einen Schüler auswählen',
      style: TextStyle(fontSize: 15),
    ),
  );
  void createClassMemberCards() async {
    var classList = await getClassList(widget.classNumber);

    classList.forEach((member) {
      classMemberCards.add(GestureDetector(
        onTap: () {
          member['classNumber'] = widget.classNumber;
          if (member['role'] != 'Schüler' &&
              member['role'] != 'Klassensprecher') {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => studentView(studentInfo: member)),
            );
          }
        },
        child: classViewCard({
          'name': member['name'],
          'role': member['role'],
          'rights': member['rights'],
          'uid': member['uid'],
          'books': member['books'],
        }),
      ));
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
            Row(
              children: [
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, size: 20),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(13),
                      elevation: 0,
                      primary: Colors.transparent,
                      onPrimary: Color(0xFF18191F),
                    ),
                  ),
                ),
                Text('Klasse ' + widget.classNumber.toString(),
                    style: TextStyle(fontSize: 27)),
              ],
            ),
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
