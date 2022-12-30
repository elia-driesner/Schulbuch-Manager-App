import 'package:flutter/material.dart';

class studentView extends StatelessWidget {
  var studentInfo;
  studentView({Key? key, required this.studentInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          child: Text(this.studentInfo['name'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    ));
  }
}
