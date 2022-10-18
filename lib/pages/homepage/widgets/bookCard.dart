import 'package:flutter/material.dart';

class book {
  late String name;

  // late var alreadyPaid;
  // late var damages;
  // late var userHistory;
  // var alreadyPaid, damages, userHistory
  book({required String name});
}

class bookCard extends StatelessWidget {
  bookCard({Key? key, required this.bookName}) : super(key: key);
  var bookName = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
          child: Stack(
            children: [
              Container(
                width: 124,
                height: 167,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(offset: Offset(10, 4), color: Color(0xFF18191F))
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 170,
                    child: Card(
                        shadowColor: Colors.transparent,
                        color: Color(0xFF6796FF).withOpacity(1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(
                            color: Color(0xFF18191F),
                            width: 2,
                          ),
                        ),
                        child: Container(
                          width: 125,
                          child: Icon(Icons.image_outlined, size: 40),
                        )),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child:
                          Text(bookName, style: const TextStyle(fontSize: 20)))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
