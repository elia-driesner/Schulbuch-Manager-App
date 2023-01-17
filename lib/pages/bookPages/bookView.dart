import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'bookCard.dart';
import '../../user_data_cache.dart';
import 'package:intl/intl.dart';
import 'damge/getDamages.dart';
import 'damge/DamageView.dart';

class bookView extends StatelessWidget {
  var bookInfo;
  bookView({Key? key, required this.bookInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SafeArea(
                child: Container(
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
        Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(27, 20, 0, 0),
              child: bookCard(
                bookInfo: bookInfo,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Benutzer:', style: TextStyle(fontSize: 20)),
                        Text(selectedUserData['name'],
                            style: TextStyle(fontSize: 17)),
                      ],
                    )),
                Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Seit:', style: TextStyle(fontSize: 20)),
                        Text(
                            DateFormat('dd.MM.yyyy, HH:mm')
                                .format(
                                    this.bookInfo[1]['lastActivity'].toDate())
                                .toString(),
                            style: TextStyle(fontSize: 17)),
                      ],
                    )),
                bookDamageView(
                  bookInfo: bookInfo,
                ),
              ],
            )
          ],
        )
      ],
    )))));
  }
}
