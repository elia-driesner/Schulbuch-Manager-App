import 'package:flutter/material.dart';

class book {
  late String name;
  late var alreadyPaid;
  late var damages;
  late var userHistory;

  book({required String name, var alreadyPaid, damages, userHistory});
}

class bookCard extends StatefulWidget {
  bookCard({Key? key, required this.bookInfo}) : super(key: key);
  var bookInfo;
  @override
  State<bookCard> createState() => _bookCardState();
}

class _bookCardState extends State<bookCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Column(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(5, 5),
                        color: Color.fromARGB(255, 0, 0, 0))
                  ],
                ),
                child: Card(
                    shadowColor: Colors.transparent,
                    color: Color.fromARGB(245, 236, 235, 231),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Container(
                        child: Column(
                      children: [
                        Icon(Icons.book_outlined, size: 130),
                      ],
                    ))),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(widget.bookInfo.name,
                      style: TextStyle(fontSize: 20)))
            ],
          ),
        ),
      ],
    );
  }
}
