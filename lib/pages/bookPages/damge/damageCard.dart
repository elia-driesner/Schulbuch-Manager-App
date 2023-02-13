import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../config/palette.dart';

class damageCard extends StatelessWidget {
  var damageInfo;
  damageCard({Key? key, required this.damageInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(
            color: BLACK,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(damageInfo['name'], style: TextStyle(fontSize: 20)),
            Text(damageInfo['responsibleName'], style: TextStyle(fontSize: 18))
          ],
        ),
        Text(
            DateFormat('dd.MM.yyyy')
                .format(damageInfo['date'].toDate())
                .toString(),
            style: TextStyle(fontSize: 18))
      ]),
    ));
  }
}
