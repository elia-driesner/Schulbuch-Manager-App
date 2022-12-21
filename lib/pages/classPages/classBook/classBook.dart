import 'package:flutter/material.dart';
import 'classView.dart';

class classBook extends StatelessWidget {
  classBook({Key? key, required this.grade, required this.backgroundColor})
      : super(key: key);
  int grade;
  String backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => classPage(
                    classNumber: grade,
                  )),
        )
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Stack(
          children: [
            Container(
              width: 185,
              height: 275,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(offset: Offset(10, 6), color: Color(0xFF18191F))
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  height: 280,
                  width: 195,
                  child: Card(
                      shadowColor: Colors.transparent,
                      color: Color(int.parse(backgroundColor)).withOpacity(1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                          color: Color(0xFF18191F),
                          width: 2,
                        ),
                      ),
                      child: Container(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.fromLTRB(7, 15, 0, 0),
                              child: Text('Klassenbuch',
                                  style: TextStyle(fontSize: 25))),
                          Container(
                              margin: EdgeInsets.fromLTRB(7, 5, 0, 0),
                              child: Text('Klasse ' + grade.toString(),
                                  style: TextStyle(fontSize: 20))),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                            width: 110,
                            height: 27,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                                border: Border.all(
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            width: 80,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                                border: Border.all(
                                    color: Color.fromARGB(255, 0, 0, 0))),
                          )
                        ],
                      ))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
