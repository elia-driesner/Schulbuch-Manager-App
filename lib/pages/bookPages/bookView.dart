import 'package:flutter/material.dart';
import 'bookCard.dart';

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
          children: [],
        )
      ],
    )))));
  }
}
