import 'package:flutter/material.dart';
import 'widgets/sideMenu.dart';
import '../../user_data_cache.dart';
import '../../codeScanner/qrCodeWidget.dart';
import 'booksListView.dart';
import 'widgets/qrCodeCard.dart';

class studentHomepage extends StatelessWidget {
  const studentHomepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFECEBE7),
        child: SafeArea(
            child: Column(children: [
          Container(
              margin: EdgeInsets.fromLTRB(15, 90, 15, 0),
              child: bookListView()),
          Stack(children: <Widget>[
            Container(
                margin: EdgeInsets.fromLTRB(0, 300, 0, 0),
                height: 100,
                width: 100,
                color: Colors.red),
            Container(child: qrCodeCard()),
          ])
        ])));
  }
}
