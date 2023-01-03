import 'package:flutter/material.dart';
import '../../../homepage/widgets/customActionButton.dart';
import '../../../bookPages/booksListView.dart';

class studentView extends StatelessWidget {
  var studentInfo;
  studentView({Key? key, required this.studentInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Container(
              child: Container(
            margin: EdgeInsets.fromLTRB(27, 0, 0, 0),
            child: Text(this.studentInfo['name'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          )),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(27, 5, 0, 0),
                  child: Text(
                      'Klasse ' + this.studentInfo['classNumber'].toString(),
                      style: TextStyle(fontSize: 17))),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                  child: Text(this.studentInfo['role'].toString(),
                      style: TextStyle(fontSize: 17)))
            ],
          ),
          Container(
              child: bookListView(userCred: [
            this.studentInfo['books'],
            this.studentInfo['school']
          ])),
          Container(
              child: loginBookButton(studentUid: this.studentInfo['uid']),
              margin: EdgeInsets.fromLTRB(25, 30, 25, 0))
        ],
      ),
    ));
  }
}
