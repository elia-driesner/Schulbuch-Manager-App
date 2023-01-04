import 'package:flutter/material.dart';
import '../../../homepage/widgets/customActionButton.dart';
import '../../../bookPages/booksListView.dart';
import '../../../../user_data_cache.dart';

class studentView extends StatefulWidget {
  var studentInfo;
  studentView({Key? key, required this.studentInfo}) : super(key: key);

  @override
  State<studentView> createState() => _studentViewState();
}

class _studentViewState extends State<studentView> {
  void initState() {
    selectedUserData = this.widget.studentInfo;
  }

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
            child: Text(this.widget.studentInfo['name'],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          )),
          Row(
            children: [
              Container(
                  margin: EdgeInsets.fromLTRB(27, 5, 0, 0),
                  child: Text(
                      'Klasse ' +
                          this.widget.studentInfo['classNumber'].toString(),
                      style: TextStyle(fontSize: 17))),
              Container(
                  margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                  child: Text(this.widget.studentInfo['role'].toString(),
                      style: TextStyle(fontSize: 17)))
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(27, 15, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text('Bücher:', style: TextStyle(fontSize: 20)),
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: bookListView(userCred: [
                      'undefined',
                      this.widget.studentInfo['school'],
                      this.widget.studentInfo['uid']
                    ])),
              ],
            ),
          ),
          Container(
              child:
                  loginBookButton(studentUid: this.widget.studentInfo['uid']),
              margin: EdgeInsets.fromLTRB(25, 30, 25, 0))
        ],
      ),
    ));
  }
}
