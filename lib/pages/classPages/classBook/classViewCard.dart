import 'package:flutter/material.dart';

class classViewCard extends StatelessWidget {
  classViewCard(this.data);

  var data;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 12, 0, 0),
        child: Row(
          children: [
            classMemberContainer(context),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['name'],
                        style: TextStyle(
                            color: Color(0xFF18191F),
                            fontWeight: FontWeight.w500,
                            fontSize: 22)),
                    Text(data['role'],
                        style: TextStyle(
                            color: Color(0xFF18191F),
                            fontWeight: FontWeight.w400,
                            fontSize: 17))
                  ]),
            ),
          ],
        ));
  }

  @override
  Widget classMemberContainer(BuildContext context) {
    if (data['role'] == 'Klassenlehrer')
      return Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF18191F),
              width: 2,
            ),
            color: Color(0xFFF95A2C),
            borderRadius: BorderRadius.circular(10.0),
          ));
    else if (data['role'] == 'Klassensprecher')
      return Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF18191F),
              width: 2,
            ),
            color: Color(0xFF1947E5),
            borderRadius: BorderRadius.circular(10.0),
          ));
    else
      return Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFF18191F),
              width: 2,
            ),
            color: Color(0xFF00C6AE),
            borderRadius: BorderRadius.circular(10.0),
          ));
  }
}
