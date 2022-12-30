import 'package:flutter/material.dart';
import '../../../homepage/widgets/customActionButton.dart';

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
              child: Container(
            margin: EdgeInsets.fromLTRB(27, 20, 0, 0),
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
              child: loginBookButton(studentUid: this.studentInfo['uid']),
              margin: EdgeInsets.fromLTRB(25, 30, 25, 0))
        ],
      ),
    ));
  }
}
